package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class AccentHigh3EchoClose extends AccentHigh3Echo {

		
		public function AccentHigh3EchoClose(stage:Stage, c1:String, delay:int):void {
			
			super(stage, c1, delay);
			
		}

		
		override protected function thisLoop(evt:Event):void {
			
			thisCount++;
			
			if (thisCount == 20 || thisCount == 40) {
				
				stage.addChildAt(new BlockEcho(c1, idX, l1.y), 2);
				stage.addChildAt(new BlockEcho(c1, idX + gap, r1.y), 2);
				
			}
			
			if (thisCount >= 60) {
				l1.x += speed;
				r1.x -= speed;
				
				if ((l1.x + (l1.width/2)) > midPt + 25) {
					l1.x = midPt - l1.width/2 + 25;
					r1.x = midPt + r1.width/2 - 25;
					stage.removeEventListener(Event.ENTER_FRAME, thisLoop);
				}
			}
		}
	}
}
