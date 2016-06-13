package 
{
	// Pitch_Shift_MP3 Example
	// Created by McFunkypants
	// http://www.mcfunkypants.com
	// http://twitter.com/mcfunkypants
	//
	// This class can play a looped sound and dynamically pitch-shift it during runtime.
	// Useful for engine sounds in racing games when you slow down or speed up.
	// Based heavily upon code by Andre Michelle - many thanks and grateful acknowledgements.
	//
	// Linkware: If you use this, kindly tweet/blog/post a link to it! =)
	
    import flash.display.Sprite;
	import flash.events.*;
	import flash.text.*;

	import Pitch_Shift_MP3;
	
	[SWF(backgroundColor = "#FF8000", frameRate = "60", width = "640", height = "128")]
	
	public class Pitch_Shift_Example extends Sprite
    {
		
		[Embed(source='Pitch_Shift_Example.mp3')] 
		private var engine_mp3 : Class; 		 
		public var engine_loop:Pitch_Shift_MP3;

		public function Pitch_Shift_Example()
		{
			engine_loop = new Pitch_Shift_MP3(engine_mp3);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			var someText:TextField = new TextField();
			someText.x = 200;
			someText.y = 0;
			someText.textColor = 0xFFFFFF;
			someText.selectable = false;  
			someText.autoSize = TextFieldAutoSize.LEFT;
			someText.text = "Pitch Shift MP3 Demo by Breakdance McFunkypants\nMove your mouse to change the sample rate. Enjoy!";
			addChild(someText);
		}

		private function onMouseMove(event:MouseEvent):void
        {
			engine_loop.rate = (mouseX / stage.width) * 2;
		}
		
	}
}