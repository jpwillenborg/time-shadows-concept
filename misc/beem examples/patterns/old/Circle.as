package {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class Circle extends Sprite {
		
		private var count:int = 0;
		
		
		public function Circle(color:String, idX:int) {
			
			addChild(Atlas.generate("neon circle " + color));
			
			x = idX;
			y = -40;
			pivotX = width/2;
			pivotY = height/2;
			alpha = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, added);
			function added(evt:Event):void {
				
				Environment.objList.push(this);
				Score.moveToFront(Environment.stageRef);
				
				addEventListener(Event.ENTER_FRAME, loop);
				removeEventListener(Event.ADDED_TO_STAGE, added);
			}
		}
		
		
		private function loop(evt:EnterFrameEvent):void {
			
			y += Rhythm.speed;
			
			
			// INTRO TRANSITION
			
			if (y <= Main.screenHeight * 0.25 && alpha < 100) {
				alpha += 0.20;
			}
			
			
			// EXIT TRANSITION
			
			if (y >= Main.screenHeight * 0.90) {
				alpha -= .05;
			}
			
			if (y > Main.screenHeight + height/2) {
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
