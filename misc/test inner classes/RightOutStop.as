package  {
	
	import starling.display.Stage;
	import starling.events.*;
	import starling.display.Image;
	
	
	public class RightOutStop {
		
		static var stage:Stage;
		static var blockList:Array;
		static var numBlocks:uint;
		static var speed:int;
		static var highLimit:int;
		static var highVal:uint;
		static var started:Boolean;
		
		
		static function go(id:Stage, num:uint, spd:int) {			
			stage = id;
			blockList = [];
			numBlocks = num;
			speed = spd;
			highLimit = Main.screenHeight;
			highVal = 0;
			
			for (var i:int = 0; i < Walls.numBlocks; i++) {
				if (Walls.rightWall[i].y < highLimit) {
					highLimit = Walls.rightWall[i].y;
					highVal = i;
				}
			}
			
			for (var j:int = 0; j < numBlocks; j++) {
				blockList.push(Walls.rightWall[highVal]);
				highVal++;
				if (highVal > Walls.numBlocks - 1) {
					highVal = 0;
				}
			}
			
			stage.addEventListener(Event.ENTER_FRAME, check);
		}
		
		
		static function check(evt:Event):void {
			if (blockList[0].y >= 150) {
				stage.removeEventListener(Event.ENTER_FRAME, check);
				stage.addEventListener(Event.ENTER_FRAME, rightOutStop);
			}
		}
		
		
		static function rightOutStop(evt:Event):void {
			for each (var id:Image in blockList) {
				id.x -= speed;
			}
			
			if (blockList[0].x <= Walls.centerPt) {
				for each (var id2:Image in blockList) {
					id2.x = Walls.centerPt;
				}
				stage.removeEventListener(Event.ENTER_FRAME, rightOutStop);
				//stage.addEventListener(TouchEvent.TOUCH, Controls.screenHit);
			}
		}
	}
}
