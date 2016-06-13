package {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class Circle extends Sprite {
		
		private var count:int = 0;
		private var idX:int;
		private var idY:int;
		private var speedX = Rhythm.speed * 1.5;
		private var speedY = Rhythm.speed * 2;
		
		
		public function Circle(color:String, idX:int, idY:int) {
			
			if (Audio.hasStarted) {
				
				this.idY = idY;
				
				addChild(Atlas.generate("neon circle " + color));
				alpha = 0;
				pivotX = width/2;
				pivotY = height/2;
				
				x = idX;
				y = -40;
				
				Environment.objList.push(this);
				
				addEventListener(Event.ADDED_TO_STAGE, added);
				function added(evt:Event):void {
					
					Score.moveToFront(Environment.stageRef);
					
					addEventListener(Event.ENTER_FRAME, loop);
					removeEventListener(Event.ADDED_TO_STAGE, added);
				}
			}
		}
		
		
		private function loop(evt:EnterFrameEvent):void {
			
			// INTRO TRANSITION
			
			if (y < Main.screenHeight * 0.25 && alpha < 100) {
				alpha += 0.20;
			}
			
			
			// MOVING
			
			y += speedY;
			
			
			if (y >= Main.screenHeight * 0.25 - idY) {
				speedY = Rhythm.speed * 2; // 1.15;
			}
			
			if (y >= Main.screenHeight * 0.15) {
				
				if (x < Main.screenWidth/2) {
					x += speedX;
					if (x >= Main.screenWidth/2 - 150) {
						x = Main.screenWidth/2 - 150;
						speedX = 0;
					}
				}
				if (x > Main.screenWidth/2) {
					x -= speedX;
					if (x <= Main.screenWidth/2 + 150) {
						x = Main.screenWidth/2 + 150;
						speedX = 0;
					}
				}
			}
			
			
			// EXIT TRANSITION
			
			if (y >= Main.screenHeight * 0.90) {
				alpha -= .05;
			}
			
			if (alpha <= 0 || y > Main.screenHeight + 100) {
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
