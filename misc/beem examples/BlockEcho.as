package {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class BlockEcho extends Block {
		
		private var count:int = 0;
		private var count0:int = 0;
		
		
		public function BlockEcho(color:String, idX:int, idY:int) {
			
			super (color, idX);
			
			y = idY;
			alpha = 0.5;
		}
		
		
		override protected function loop(evt:EnterFrameEvent):void {			
			
			y += Rhythm.speed / 8;
			alpha -= 0.015;
			
			
			// EXIT TRANSITION
			
			if (alpha <= 0 || y > Main.screenHeight + 100) {
				removeSelf();
			}
		}
	}
}
