package {
	
	import flash.events.Event;
	import flash.media.SoundChannel;
	import patterns.*;
	import starling.display.Sprite;
	import starling.display.Stage;
	   

	public class Audio extends Sprite {
		
		private var stageRef:Stage;
		private var sound1:J1;
		private var sound2:J2;
		private var sound3:J3;
		private var sound4:J4;
		private var sound5:J5;
		private var sound6:J6;
		private var sound7:J7;
		private var sound8:J8;
		private static var channel:SoundChannel;
		private var c:uint;
		

		public function Audio(id:Stage) {	
			
			stageRef = id;
			
			sound1 = new J1();
			sound2 = new J2();
			sound3 = new J3();
			sound4 = new J4();
			sound5 = new J5();
			sound6 = new J6();
			sound7 = new J7();
			sound8 = new J8();
			
			channel = sound1.play(15);
			channel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
			
			c = 1;
			new Single(stageRef, "red");
		}
		
		
		private function soundCompleteHandler(evt:Event):void {
						
			channel.stop();
			channel.removeEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
			
			c++;
			if (c > 8) {
				c = 1;
			}
			
			if (c == 1 || c == 5) {
				new Single(stageRef, "red");
			} else {
				new Single(stageRef, "yellow");
			}
			
			channel = this["sound" + c].play(15);
			channel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
		}
	}
}