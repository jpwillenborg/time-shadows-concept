package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class MidReverbEchoClose extends MidReverbEcho {
		
		private var thisCount:int;
		private var thisSpeed:int = 9.5;
		
		
		public function MidReverbEchoClose(stage:Stage, c1:String, delay:int):void {
			
			super(stage, c1, delay);
			
		}
		
		
		override protected function thisLoop(evt:Event):void {
			
			thisCount++;
			
			if (thisCount == 20 || thisCount == 40) {
				
				stage.addChildAt(new BlockEcho(c1, idX, l1.y), 2);
				stage.addChildAt(new BlockEcho(c1, idX + gap, r1.y), 2);
				
			}
			
			
			if (thisCount >= 75) {
				
				l1.x += thisSpeed;
				r1.x -= thisSpeed;
				
				if ((l1.x + (l1.width/2)) > midPt + 25) {
					l1.x = midPt - l1.width/2 + 25;
					r1.x = midPt + r1.width/2 - 25;
					
					stage.removeEventListener(Event.ENTER_FRAME, thisLoop);
				}
			}
		}
	}
}
