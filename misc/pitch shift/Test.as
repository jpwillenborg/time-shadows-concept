package  {
	
	import flash.display.Sprite;
	import flash.events.*;
	import flash.text.*;
	import Pitch_Shift_MP3;
	
	
	public class Test extends Sprite {
		
		[Embed(source='john.mp3')] 
		private var engine_mp3 : Class; 		 
		public var engine_loop:Pitch_Shift_MP3;

		public function Test(stage) {
			
			trace("called");
			engine_loop = new Pitch_Shift_MP3(engine_mp3);
			engine_loop.rate = 0.9;
		}
	}
}
