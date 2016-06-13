package {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class CircleEnd extends Sprite {
		
		private var count:int = 0;
		private var alphaID:Number;
		private var speed;
		
		public function CircleEnd(color:String, idX:int, idY:int) {
			
			if (Audio.hasStarted) {
				addChild(Atlas.generate("neon circle " + color));
				this.alphaID = alphaID;
				x = idX;
				y = (idY * 15) - 100;
				pivotX = width/2;
				pivotY = height/2;
				
				if (x < 0) {
					speed = 15;
				} else {
					speed = -15;
				}
				
				Environment.objList.push(this);
				
				addEventListener(Event.ADDED_TO_STAGE, added);
				function added(evt:Event):void {
					
					//Environment.objList.push(this);
					Score.moveToFront(Environment.stageRef);
					
					addEventListener(Event.ENTER_FRAME, loop);
					removeEventListener(Event.ADDED_TO_STAGE, added);
				}
			}
		}
		
		
		private function loop(evt:EnterFrameEvent):void {
			
			x += speed;
			//y += 3;
			
			
			// INTRO TRANSITION
			
			if (y < Main.screenHeight * 0.25 && alpha < alphaID) {
				alpha += 0.20;
			}
			
			
			// EXIT TRANSITION
			
			if (x > Main.screenWidth + 100 || x < -100) {
				removeSelf();
			}
			
			
			// COLLISION DETECTION
			
			if (getBounds(parent).intersects(Controls.cursor.getBounds(Controls.cursor.parent))) {
				Environment.registerHit();
			}
		}
 
		
		private function removeSelf():void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stage.contains(this)) {
				
				for (var j:int = 0; j < Environment.objList.length; j++) {
					if (Environment.objList[j] == this) {
						Environment.objList.splice(j, 1);
					}
				}
				
				parent.removeChild(this);
				this.dispose();
			}
		}
	}
}
