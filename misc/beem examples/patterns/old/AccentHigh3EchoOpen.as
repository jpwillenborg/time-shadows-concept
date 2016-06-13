package patterns {
	
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class AccentHigh3EchoOpen extends AccentHigh3Echo {

		
		public function AccentHigh3EchoOpen(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
		}

		
		override protected function thisLoop(evt:EnterFrameEvent):void {
			
			if (thisCount == 0) {
				l1.x = midPt - l1.width/2 + 25;
				r1.x = midPt + r1.width/2 - 25;
			}
			
			
			thisCount++;
			
			
			if (thisCount == 20 || thisCount == 40) {
				
				stage.addChildAt(new BlockEcho(c1, midPt - l1.width/2 + 25, l1.y), 2);
				stage.addChildAt(new BlockEcho(c1, midPt + r1.width/2 - 25, r1.y), 2);
				
			}
			
			
			if (thisCount >= 60) {
				l1.x += -speed;
				r1.x -= -speed;
				
				if (l1.x + l1.width/2 < -50) {
					stage.removeEventListener(Event.ENTER_FRAME, thisLoop);
				}
				
				/*if (l1.x < -60) {
					l1.x = -60;
					r1.x = 700;
					stage.removeEventListener(Event.ENTER_FRAME, thisLoop);
				}*/
			}
		}
	}
}
