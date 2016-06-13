package utils.metronome {
	
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.ByteArray;
	
	[Event(name="start", type="cc.cote.metronome.MetronomeEvent")]
	[Event(name="tick", type="cc.cote.metronome.MetronomeEvent")]
	[Event(name="stop", type="cc.cote.metronome.MetronomeEvent")]

	
	public class Metronome extends EventDispatcher {
		
		public static const VERSION:String = '1.0b rev1';
		public static const SAMPLE_RATE:uint = 44100;
		private const MAX_BUFFER_SAMPLES:uint = 8192;
		
		[Embed(source='/utils/metronome/sounds/Sine880Hz.mp3')] private var NormalBeep:Class;
		[Embed(source='/utils/metronome/sounds/Sine1760Hz.mp3')] private var AccentedBeep:Class;
		[Embed(source='/utils/metronome/sounds/Silence.mp3')] private var Reference:Class;
		
		private var _tempo:Number = 120;
		private var _interval:Number = 500.0;
		private var _startTime:Number = NaN;
		private var _lastTickTime:Number = NaN;
		private var _ticks:uint = 0;
		private var _regularBeep:Sound = new NormalBeep();
		private var _accentedBeep:Sound = new AccentedBeep();
		private var _soundReference:Sound = new Reference();
		private var _soundChannel:SoundChannel;
		private var _samplesBeforeTick:uint;
		private var _running:Boolean = false;
		private var _missed:uint = 0;
		private var _maxTickCount:uint = 0;
		private var _extraPrecise:Boolean = false;
		private var _ba:ByteArray = new ByteArray();
		private var _regularBeepTransform:SoundTransform = new SoundTransform();
		private var _accentedBeepTransform:SoundTransform = new SoundTransform();
		private var _pattern:Array = [];

		public function Metronome(
			tempo:uint = 120, volume:Number = 1.0, pattern:Array = null, maxTickCount:uint = 0
		) {
			this.tempo = tempo;
			this.volume = volume;
			if (pattern) _pattern = pattern;
			_maxTickCount = maxTickCount;
			_ba.length = MAX_BUFFER_SAMPLES * 4 * 2; 	// Samples are 32bits floats (1byte x4) and stereo (x2)
		}
		
		
		public function start():void {
			_running = true;
			_ticks = 0;
			_missed = 0;
			if (_extraPrecise) _initializePreciseMode();
			_startTime = new Date().getTime();
			_tick();
		}
		
		
		private function _initializePreciseMode():void {
			_samplesBeforeTick = Math.round(_interval / 1000 * SAMPLE_RATE);
			_soundReference.addEventListener(
				SampleDataEvent.SAMPLE_DATA, _onSampleData, false, 0, true
			);
		}
		
		
		public function stop():void {
			if ( _soundReference.hasEventListener(SampleDataEvent.SAMPLE_DATA) ) {
				_soundReference.removeEventListener(SampleDataEvent.SAMPLE_DATA, _onSampleData);
			}
			_running = false;
			_soundChannel.removeEventListener(Event.SOUND_COMPLETE, _tick);
			_soundChannel.stop();
			dispatchEvent( new MetronomeEvent(MetronomeEvent.STOP, _ticks, _lastTickTime) );
			_samplesBeforeTick = 0;
		}
		
		
		private function _onSampleData(e:SampleDataEvent):void {
			if (_samplesBeforeTick >= MAX_BUFFER_SAMPLES) {
				e.data.writeBytes(_ba);
				_samplesBeforeTick -= MAX_BUFFER_SAMPLES;
			} else if (_samplesBeforeTick > 0) {
				e.data.writeBytes(_ba, 0, _samplesBeforeTick * 4 * 2);
				_samplesBeforeTick = 0;
			}
		}
		
		
		private function _tick(e:Event = null):void {
			
			if (! _running) return;
			
			_lastTickTime = new Date().getTime();
			_ticks++;
			if (_ticks == 1) {
				dispatchEvent( new MetronomeEvent(MetronomeEvent.START, 0, _lastTickTime));
			}
			dispatchEvent( new MetronomeEvent(MetronomeEvent.TICK, _ticks, _lastTickTime));
			
			
			var ch:SoundChannel;
			var pos:uint = (_ticks - 1) % _pattern.length;
			
			if (!isNaN(pos) && _pattern[pos]) {
				if (_accentedBeepTransform.volume > 0) {
					ch = _accentedBeep.play();
					ch.soundTransform = _accentedBeepTransform;
				}
			} else {
				if (_regularBeepTransform.volume > 0) {
					ch = _regularBeep.play();
					ch.soundTransform = _regularBeepTransform;
				}
			}
			
			
			if (_ticks >= _maxTickCount && _maxTickCount != 0) {
				stop();
				return;
			}
			
			var delay:Number = _startTime + (_ticks * _interval) - _lastTickTime;
			if (delay <= 10) {
				_missed++;
				_tick();
				return;
			}
			
			if (_extraPrecise) {
				_samplesBeforeTick = delay / 1000 * SAMPLE_RATE;
				_soundChannel = _soundReference.play();
			} else {
				_soundChannel = _soundReference.play(_soundReference.length - delay);				
			}
			
			if (_soundChannel) {
				// Cannot use weak listener here (&*?%). I don't know why.
				_soundChannel.addEventListener(Event.SOUND_COMPLETE, _tick);
			} else {
				throw new IllegalOperationError(
					"No sound channels are available to use as Metronome's time reference"
				);
			}
		}
		
		
		public function get tempo():Number {
			return _tempo;
		}
		
		
		public function set tempo(value:Number):void {
			
			if (value <= 0 || value > 600) {
				throw new ArgumentError(
					'The tempo must be greater than 0 and less than 600 beats per minute.'
				);
				return;
			} else if (!extraPrecise && value < 12) {
				throw new ArgumentError(
					'To use a tempo slower than 12 BPM, you must set "extraPrecise" to true.'
				);
				return;
			}
			_tempo = value;
			_interval = 60 / _tempo * 1000;
		}
		
		
		public function get interval():uint {
			return _interval;
		}
		
		
		public function set interval(value:uint):void {
			
			if (value < 100) {
				throw new ArgumentError('The interval must be at least 100 milliseconds long.');
				return
			} else if (!_extraPrecise && value > 5000) {
				throw new ArgumentError(
					'To use an interval longer than 5000 milliseconds, you must set "extraPrecise" to true.'
				);
				return;
			}
			_interval = value;
			_tempo = 60 / _interval * 1000;
		}
		
		
		public function get startTime():Number {
			return _startTime;
		}

		
		public function get ticks():uint {
			return _ticks;
		}

		
		public function get running():Boolean {
			return _running;
		}
		
		
		public function get missed():uint {
			return _missed;
		}

		
		public function get regularBeep():Sound {
			return _regularBeep;
		}
		
		
		public function set regularBeep(value:Sound):void {
			_regularBeep = value;
		}

		
		public function get accentedBeep():Sound {
			return _accentedBeep;
		}
		
		
		public function set accentedBeep(value:Sound):void {
			_accentedBeep = value;
		}
		
		
		public function get maxTickCount():uint {
			return _maxTickCount;
		}
		
		
		public function set maxTickCount(value:uint):void {
			_maxTickCount = value;
		}
		
		
		public function get extraPrecise():Boolean {
			return _extraPrecise;
		}
		
		
		public function set extraPrecise(value:Boolean):void {
			
			if (_running) {
				throw new IllegalOperationError(
					"The 'extraPecise' mode cannot be changed while the Metronome is running"
				);
				return;
			}
			
			_extraPrecise = value;
			
			if (_extraPrecise) {
				_soundReference = new Sound();
			} else {
				_soundReference = new Reference();
			}
		}
		
		
		public function get volume():Number {
			return _regularBeepTransform.volume;
		}
		
		
		public function set volume(value:Number):void {
			_regularBeepTransform.volume = value;
			_accentedBeepTransform.volume = value;
		}

		
		public function get regularBeepVolume():Number {
			return _regularBeepTransform.volume;
		}

		
		public function set regularBeepVolume(value:Number):void {
			_regularBeepTransform.volume = value;
		}
		
	
		public function get accentedBeepVolume():Number {
			return _accentedBeepTransform.volume;
		}

		
		public function set accentedBeepVolume(value:Number):void {
			_accentedBeepTransform.volume = value;
		}

		
		public function get pattern():Array {
			return _pattern;
		}

		
		public function set pattern(value:Array):void {
			_pattern = value;
		}
	}
}

