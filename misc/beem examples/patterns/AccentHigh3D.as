package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class AccentHigh3D extends MidReverb {
		
		private var rand:int;
		
		
		public function AccentHigh3D(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
			speed = 11.5;
			
			rand = int(Math.random() * 2);
			
			l1.x = Main.screenWidth/2 - 250;
			r1.x = Main.screenWidth/2 + 250;
			
		}
		
		
		override protected function patternLoop(evt:Event):void {
			
			//patternCount++;
			
			//if (patternCount >= 60) {
				
				/*l1.x -= speed * 1.3;
				r1.x += speed * 1.3;
				
				if (r1.x > Main.screenWidth + r1.width/2 + 40) {
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}*/
				
				
				l1.x += speed;
				r1.x += speed;
				
				/*if ((l1.x + (l1.width/2)) > midPt + 25) {
					l1.x = midPt - l1.width/2 + 25;
					r1.x = midPt + r1.width/2 - 25;
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}*/
			//}
		}
	}
}
