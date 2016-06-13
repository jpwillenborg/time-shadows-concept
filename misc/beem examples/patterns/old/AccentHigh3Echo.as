package patterns {
	
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class AccentHigh3Echo extends AccentHigh3 {

		
		public function AccentHigh3Echo(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
		}

		
		override protected function thisLoop(evt:EnterFrameEvent):void {
			
			thisCount++;
			
			if (thisCount == 20 || thisCount == 40) {
				
				stage.addChildAt(new BlockEcho(c1, idX, l1.y), 2);
				stage.addChildAt(new BlockEcho(c1, idX + gap, r1.y), 2);
				
			}
			
			
			if (thisCount >= 45) {
				l1.x += speed;
				r1.x -= speed;
				
				if ((l1.x + (l1.width/2)) > midPt + 20) {
					l1.x = midPt - l1.width/2 + 20;
					r1.x = midPt + r1.width/2 - 20;
					speed *= -0.9;
				}
				
				if (l1.x < startPt1) {
					
					l1.x = startPt1;
					r1.x = startPt2;
					
					stage.removeEventListener(Event.ENTER_FRAME, thisLoop);
				}
			}
		}
	}
}
