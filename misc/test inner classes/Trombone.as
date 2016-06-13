package  {
	
	import starling.display.Stage;
	import starling.events.*;
	import starling.display.Image;
	
	
	public class Trombone {
		
		static var stage:Stage;
		static var first:Image;
		static var speed:int = 5;
		static var reverse:Boolean = false;
		

		static function go(id:Stage) {
			stage = id;
			first = Walls.leftWall[Walls.firstInLoop];
			stage.addEventListener(Event.ENTER_FRAME, trombone);
		}
		
		
		static function trombone(evt:Event):void {
			for each (var id1:Image in Walls.leftWall) {
				id1.x += speed;
			}
			for each (var id2:Image in Walls.rightWall) {
				id2.x -= speed;
			}
			
			if (!reverse) {
				if (first.x >= Walls.centerPt - Walls.blockWidth + Walls.vertGap/2) {
					speed *= -1;
					reverse = true;
				}
			} else {
				if (first.x <= Walls.leftBounds) {
					speed *= -1;
					reverse = false;
					Walls.resetWalls();
					stage.removeEventListener(Event.ENTER_FRAME, trombone);
				}
			}
			
			
		}
	}
}
