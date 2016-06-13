package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class AccentHigh3A extends MidReverb {
		
		private var rand:int;
		
		
		public function AccentHigh3A(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
			speed = 11.5;
			
		}
		
		
		override protected function patternLoop(evt:Event):void {
			
			patternCount++;
			
			if (patternCount == 42) {
				rand = int(Math.random() * 2);
				if (rand == 0) {
					rand = -1;
				}
			}
			
			if (patternCount >= 42) {
				
				l1.x += speed * rand;
				r1.x += speed * rand;
				
				
				if (rand == 1) {
					if (r1.x >= startPt2 + (130 * rand)) {
						//speed *= -1;
						
						l1.x = startPt1 + (130 * rand);
						r1.x = startPt2 + (130 * rand);
						stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
					}
				} else {
					if (r1.x <= startPt2 + (130 * rand)) {
						//speed *= -1;
						
						l1.x = startPt1 + (130 * rand);
						r1.x = startPt2 + (130 * rand);
						stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
					}
				}
				

				
				/*if (r1.x <= startPt2) {
					l1.x = startPt1;
					r1.x = startPt2;
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}*/
				
				
				
				
				
				
				/*l1.x += speed;
				r1.x -= speed;
				
				if ((l1.x + (l1.width/2)) > midPt + 25) {
					l1.x = midPt - l1.width/2 + 25;
					r1.x = midPt + r1.width/2 - 25;
					speed *= -0.9;
					//stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}
				
				if (l1.x < startPt1) {
					
					l1.x = startPt1;
					r1.x = startPt2;
					
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}*/

			}
		}
	}
}
