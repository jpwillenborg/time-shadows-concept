package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class SingleCloseToLeft extends Sprite {
		
		static var hGap:int = 0;
		static var vGap:uint = 100;
		
		
		public function SingleCloseToLeft(stage:Stage, c1:String):void {
			var l1:Object = stage.addChild(new Block(c1, hGap));
			var r1:Object = stage.addChild(new Block(c1, Main.screenWidth - hGap));
			
			var speed = 7;
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			function loop(evt:Event):void {
				
				if (r1.y >= Main.screenHeight * 0.1) {
					r1.x -= speed;
				}
				
				if (r1.x - l1.x + 20 <= r1.width) {
					speed *= -1;
				}
			}
		}
	}
}
