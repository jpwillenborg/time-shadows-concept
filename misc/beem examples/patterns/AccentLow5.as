package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class AccentLow5 extends MidReverb {
		
		private var speedX:Number = 11.5;
		private var speedY:Number = 11.5;
		
		
		public function AccentLow5(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
			new AccentHigh3A(stage, "blue", 3, true);
			
		}
		
		
		override protected function callBlock():void {
			
			l1 = stage.addChild(new CircleBar(c1, idX + 150));
			r1 = stage.addChild(new CircleBar(c1, idX + gap - 150));
			
			l1.x = -100;
			r1.x = Main.screenWidth + 100;			
			
			l1.y = Main.screenHeight/2 - l1.height/2 - 200;
			r1.y = Main.screenHeight/2 - r1.height/2 - 200;
			
			startPt1 = l1.x;
			startPt2 = r1.x;
			midPt = (l1.x + r1.x) / 2;
			
			stage.removeEventListener(Event.ENTER_FRAME, delayLoop);
			stage.addEventListener(Event.ENTER_FRAME, patternLoop);
			if (echo) stage.addEventListener(Event.ENTER_FRAME, echoLoop);
			
		}
		
		
		override protected function patternLoop(evt:Event):void {
			
			//patternCount++;
			
			//if (patternCount >= 42) {
				
				l1.x += speedX;
				r1.x -= speedX;
				
				if ((l1.x + (l1.width/2)) > midPt + 25) {
					l1.x = midPt - l1.width/2 + 25;
					r1.x = midPt + r1.width/2 - 25;
					speedX *= -0.3;
				}
				
				if (speedX < 0) {
					l1.y += speedY;
					r1.y += speedY;
				}
				
				if (r1.x > startPt2 + 100) {
					
					l1.y = Main.screenHeight + l1.height;
					r1.y = Main.screenHeight + r1.height;
					
					stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
				}
			//}
		}
	}
}
