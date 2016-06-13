package utils.metronome {
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	
	public class MetronomeEvent extends Event {
		
		public static const TICK:String = 'tick';
		public static const START:String = 'start';
		public static const STOP:String = 'stop';
		
		private var _time:Number;
		private var _count:Number;

		
		public function MetronomeEvent(type:String, count:Number, time:Number) {
			super(type);
			_count = count;
			_time = time;
		}
		
		
		override public function toString():String {
			return 	'[' + getQualifiedClassName(this).split("::").pop() + 
				' type="' + type + '" count=' + _count + ' time=' + _time + ']';
		}
		
		
		public function get time():Number {
			return _time;
		}
		
		
		public function get count():Number {
			return _count;
		}
	}
}
