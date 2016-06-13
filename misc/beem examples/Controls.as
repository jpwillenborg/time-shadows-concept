package {
	
	import flash.geom.Point;
	import starling.display.Stage;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.display.Image;
	import flash.events.Event;
	
	
	public class Controls {
		
		static var cursor:Image;
		static var mousePt:Point = new Point();
		static var cursorDown:Boolean = false;
		
		static var touch:Touch;
		
		
		static function setup(stage:Stage):void {
			
			cursor = Atlas.generate("cursor");
			cursor.pivotX = cursor.width/2;
			cursor.pivotY = cursor.height/2;
			cursor.visible = false;
			stage.addChild(cursor);
			
			Environment.objList.push(cursor);
			
			stage.addEventListener(TouchEvent.TOUCH, screenHit);
		}
		
		
		static function screenHit(evt:TouchEvent):void {
			if (evt.getTouch(Environment.stageRef) != null) {
				
				if (evt.getTouch(Environment.stageRef).phase == TouchPhase.BEGAN) {
					cursorDown = true;
				}
				
				if (evt.getTouch(Environment.stageRef).phase == TouchPhase.HOVER || evt.getTouch(Environment.stageRef).phase == TouchPhase.MOVED || evt.getTouch(Environment.stageRef).phase == TouchPhase.BEGAN) { // include stationary?
					mousePt = evt.getTouch(Environment.stageRef).getLocation(Environment.stageRef);
					cursor.x = mousePt.x;
					cursor.y = mousePt.y;
				}
				
				if (evt.getTouch(Environment.stageRef).phase == TouchPhase.ENDED) {
					cursorDown = false;
					if (Audio.hasStarted) {
						Environment.registerHit();
					}
				}
				
			}
		}
	}
}