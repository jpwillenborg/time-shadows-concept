package {
	
	import flash.geom.Point;
	import starling.display.Stage;
	import starling.events.*;
	import starling.display.Image;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Controls {
		
		static var stage:Stage;
		static var touchList:Vector.<Touch>;
		static var touch:Touch;
		static var touchPt:Point = new Point();
		static var mouseX:Number;
		
		static var fingerDot:Image;
		static var fingerPt:Point = new Point();
		
		static var gameIsOn:Boolean = false;
		
		
		static function setup(id:Stage):void {
			stage = id;
			fingerDot = Atlas.generate("finger dot");
			stage.addChild(fingerDot);
			fingerDot.visible = false;
			
			stage.addEventListener(TouchEvent.TOUCH, screenHit);
		}
		
		
		static function screenHit(evt:TouchEvent):void {
			touchList = evt.getTouches(stage);
				for each (touch in touchList) {
					touchPt = touch.getLocation(stage);
					fingerDot.x = touchPt.x - (fingerDot.width / 2);
					fingerDot.y = touchPt.y - (fingerDot.width / 2);
				}
				
			if (evt.getTouch(stage) != null) {
				if (evt.getTouch(stage).phase == TouchPhase.BEGAN) {
					startGame(stage);
				}
				if (evt.getTouch(stage).phase == TouchPhase.ENDED) {
					stopGame(stage);
					resetGame(stage);
				}
			}
		}
		
		
		static function checkHits(stage:Stage):void {
			if (gameIsOn) {
				for (var i:int = 0; i < Walls.numBlocks; i++) {
					if (fingerDot.getBounds(fingerDot.parent).intersects(Walls.leftWall[i].getBounds(Walls.leftWall[i].parent))) {
						stopGame(stage);
					}
					if (fingerDot.getBounds(fingerDot.parent).intersects(Walls.rightWall[i].getBounds(Walls.rightWall[i].parent))) {
						stopGame(stage);
					}
				}
			}
		}
		
		
		static function startGame(stage:Stage) {
			if (!gameIsOn) {
				gameIsOn = true;
				Walls.wallSpeed = 5;
				AutoWallMove.mixTimer.start();
			}
			//fingerDot.visible = true;
		}
			
			
		static function stopGame(stage:Stage) {
			//fingerDot.visible = false;
			gameIsOn = false;
			Walls.wallSpeed = 0;
			
			stage.removeEventListener(Event.ENTER_FRAME, LeftOutStop.check);
			stage.removeEventListener(Event.ENTER_FRAME, LeftOutStop.leftOutStop);
			stage.removeEventListener(Event.ENTER_FRAME, RightOutStop.check);
			stage.removeEventListener(Event.ENTER_FRAME, RightOutStop.rightOutStop);
			
			AutoWallMove.mixTimer.stop();
		}	
		
		
		static function resetGame(stage:Stage) {
			Walls.resetWalls();
		}
		
	}
}