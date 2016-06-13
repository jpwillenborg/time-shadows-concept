package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class End1 extends MidReverb {
		
		
		public function End1(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
			//new AccentHigh3B(stage, "blue", 0, true);
			new AccentHigh3C(stage, "blue", 0, true);
			
		}
		
		
		override protected function callBlock():void {
			
			stage.removeEventListener(Event.ENTER_FRAME, delayLoop);
			stage.addEventListener(Event.ENTER_FRAME, patternLoop);
			//if (echo) stage.addEventListener(Event.ENTER_FRAME, echoLoop);
			
		}
		
		
		override protected function patternLoop(evt:Event):void {
			
			patternCount++;
			
			if (patternCount == 12 || patternCount == 19|| patternCount == 26 || patternCount == 33 || patternCount == 40 || patternCount == 47 || patternCount == 54) {
				
				stage.addChildAt(new CircleEnd(c1, -100, patternCount), 2);
			}

			
			if (patternCount > 58) stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
		}
	}
}
