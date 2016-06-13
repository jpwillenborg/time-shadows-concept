package {
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import patterns.Single;
	import starling.display.Sprite;
	import starling.display.Stage;
	   

	public class Audio extends Sprite {
		
		private var sound:John;
		private var stageRef:Stage;
		private var beatTimer:Timer;
		static var channel:SoundChannel;
		

		public function Audio(id:Stage) {	
			
			stageRef = id;
			
			sound = new John();
			channel = sound.play();
			channel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
			
			beatTimer = new Timer(1000);
			beatTimer.addEventListener(TimerEvent.TIMER, onBeat);
			beatTimer.start();
			
			new Single(stageRef, "blue");
		}
		
		
		private function onBeat(evt:TimerEvent):void {
			new Single(stageRef, "green");
		}
		
		
		private function soundCompleteHandler(evt:Event):void {
			
			new Single(stageRef, "blue");
			
			channel.stop();
			beatTimer.stop();
			channel.removeEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
			
			channel = sound.play();
			beatTimer.start();
			channel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
		}
	}
}