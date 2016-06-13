package {

	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;


	public class Controls {
		
		public static var controlFrame:Image;
		public static var controlStick:Image;
		public static var controlOrigin:Point;
		public static var controlStickCtr:Point;
		public static var controlDist:Number = 0;
		public static var controlAngle:Number = 0;
		public static var touches:Vector.<Touch>;
		public static var cDir:String = "none"; // change thse to actual integers to speed things up??
		public static var cDir0:String = "none";
		public static var oldDir:String = "none";
		public static var dirChange:Boolean = false;
		public static var areActive:Boolean = true;
		public static var controlLock:Boolean = false;
		
		
		public static function setup(stage) {
			
			controlFrame = Atlas.generate("control frame");
			controlStick = Atlas.generate("control stick");
			
			stage.addEventListener(TouchEvent.TOUCH, updateControls);
			stage.addEventListener(Event.ENTER_FRAME, updateInput);
		}
		
		
		public static function updateControls(evt:TouchEvent) {
			
			touches = evt.getTouches(Environment.stageRef);
			
			for each (var touch:Touch in touches) {
				if (touch.phase == TouchPhase.BEGAN) {
					hitBegan(touch);
				} else if (touch.phase == TouchPhase.MOVED) {
					hitMoved(touch);
				} else if (touch.phase == TouchPhase.ENDED) {
					hitEnded();
				}
			}
			
			if (touch == null) {
				Controls.hitEnded();
			}
		}
		
		
		public static function hitBegan(touch:Touch) {

			controlFrame.x = touch.globalX - controlFrame.width / 2;
			controlFrame.y = touch.globalY - controlFrame.height / 2;
			Environment.stageRef.addChild(controlFrame);

			controlStick.x = touch.globalX - controlStick.width / 2;
			controlStick.y = touch.globalY - controlStick.height / 2;
			Environment.stageRef.addChild(controlStick);

			controlOrigin = new Point(touch.globalX,touch.globalY);
			controlStickCtr = new Point(touch.globalX,touch.globalY);
		}


		public static function hitMoved(touch:Touch) {

			controlStickCtr = new Point(touch.globalX,touch.globalY);
			controlDist = Point.distance(controlOrigin,controlStickCtr);

			var dx:Number = controlStickCtr.x - controlOrigin.x;
			var dy:Number = controlStickCtr.y - controlOrigin.y;
			controlAngle = Math.atan2(dy,dx);

			if (controlDist < controlFrame.width / 2) {
				controlStick.x = touch.globalX - controlStick.width / 2;
				controlStick.y = touch.globalY - controlStick.height / 2;
			} else {
				controlStick.x = (controlOrigin.x - controlStick.width/2) + ((controlFrame.width/2) * Math.cos(controlAngle));
				controlStick.y = (controlOrigin.y - controlStick.height/2) + ((controlFrame.width/2) * Math.sin(controlAngle));
			}
		}


		public static function hitEnded() {

			Environment.stageRef.removeChild(controlFrame);
			Environment.stageRef.removeChild(controlStick);

			controlOrigin = new Point(0,0);
			controlStickCtr = new Point(0,0);
			
			controlDist = 0;
		}
		
		
		public static function updateInput(evt:Event) {
			
			// CHECK IF ON GRID
			
			if (Math.abs(Player.half.x % 32) > 0 || Math.abs(Player.half.y % 32) > 0) {
				Controls.controlLock = true;
			} else {
				Controls.controlLock = false;
			}
			
			
			// RESUME CONTROLS
			
			if (!controlLock) {
			
				if (controlDist >= 20) {
					if (controlAngle <= -.75 && controlAngle >= -2.25) {
						cDir = "up";
					} else if (controlAngle >= .75 && controlAngle <= 2.25) {
						cDir = "down";
					} else if (controlAngle > 2.25 || controlAngle < -2.25) {
						cDir = "left";
					} else if (controlAngle < .75 && controlAngle > -.75) {
						cDir = "right";
					}
					
					oldDir = cDir;
				} else {
					cDir = "none";
				}
				
				
				if (cDir != cDir0) {
					dirChange = true;
					cDir0 = cDir;
				} else {
					dirChange = false;
				}
			}
			
		}
	}
}