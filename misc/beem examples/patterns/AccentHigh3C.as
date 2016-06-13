package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class AccentHigh3C extends MidReverb {
		
		
		public function AccentHigh3C(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
			speed = 11.5;
			
		}
		
		
		override protected function patternLoop(evt:Event):void {
			
			patternCount++;
			
			if (patternCount >= 60) {
				
				/*l1.x -= speed * 1.3;
				r1.x += speed * 1.3;
				
				if (r1.x > Main.screenWidth + r1.width/2 + 40) {
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}*/
				
				
				l1.x += speed * 0.7;
				r1.x -= speed * 0.7;
				
				if ((l1.x + (l1.width/2)) > midPt + 25) {
					l1.x = midPt - l1.width/2 + 25;
					r1.x = midPt + r1.width/2 - 25;
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}
			}
		}
	}
}
