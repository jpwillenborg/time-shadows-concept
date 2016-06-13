package {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class Block extends Sprite {
		
		private var count:int = 0;
		
		
		public function Block(color:String, idX:int) {
			
			if (Audio.hasStarted) {
				
				addChild(Atlas.generate("neon block " + color));
				Environment.objList.push(this);
				
				x = idX;
				y = -40;
				pivotX = width/2;
				pivotY = height/2;
				alpha = 0;
				

				addEventListener(Event.ADDED_TO_STAGE, added);
				function added(evt:Event):void {
					
					Score.moveToFront(Environment.stageRef);
				
					removeEventListener(Event.ADDED_TO_STAGE, added);
					addEventListener(Event.ENTER_FRAME, loop);
				}
			}
		}
		
		
		protected function loop(evt:EnterFrameEvent):void {
			
			y += Rhythm.speed;
			
			
			// INTRO TRANSITION
			
			if (y < Main.screenHeight * 0.25 && alpha < 100) {
				alpha += 0.20;
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
 
		
		public function removeSelf():void {
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
