package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class AccentHigh3B extends MidReverb {
		
		
		public function AccentHigh3B(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
			speed = 11.5;
			
		}
		
		
		override protected function patternLoop(evt:Event):void {
			
			if (patternCount == 0) {
				
				l1.x = midPt - l1.width/2 + 25;
				r1.x = midPt + r1.width/2 - 25;
				
			}
			
			
			patternCount++;
			
			
			if (patternCount == 20 || patternCount == 40) {
				
				stage.addChildAt(new BlockEcho(c1, midPt - l1.width/2 + 25, l1.y), 2);
				stage.addChildAt(new BlockEcho(c1, midPt + r1.width/2 - 25, r1.y), 2);
				
			}
			
			
			if (patternCount >= 60) {
				
				l1.x += -speed;
				r1.x -= -speed;
				
				if (l1.x + l1.width/2 < -50) {
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}
				
				/*if (l1.x < -60) {
					l1.x = -60;
					r1.x = 700;
					stage.removeEventListener(Event.ENTER_FRAME, thisLoop);
				}*/
			}
		}
		
		
		override protected function echoLoop(evt:Event):void {
			
			stage.removeEventListener(Event.ENTER_FRAME, echoLoop);
			
		}
	}
}
