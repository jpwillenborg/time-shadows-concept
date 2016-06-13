package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class MidReverb {
		
		protected var stage:Stage;
		protected var c1:String;
		protected var delay:int;
		protected var echo:Boolean;
		
		protected var idX:int = -60;
		protected var gap:int = 760;
		protected var speed:int = 11.5;
		
		protected var delayCount:int = 0;
		protected var patternCount:int = 0;
		protected var echoCount:int = 0;
		
		protected var l1:Object;
		protected var r1:Object;
		protected var startPt1:int;
		protected var startPt2:int;
		protected var midPt:int;
		
		
		public function MidReverb(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			this.stage = stage;
			this.c1 = c1;
			this.delay = delay;
			this.echo = echo
			
			stage.addEventListener(Event.ENTER_FRAME, delayLoop);
		}
		
		
		protected function delayLoop(evt:Event):void {
			
			delayCount++;
			
			if (delay == 0) {
				callBlock();
			}
			if (delay == 2 && delayCount >= 30) {
				callBlock();
			}
			if (delay == 3 && delayCount >= 45) {
				callBlock();
			}
		}
		
		
		protected function callBlock():void {
			
			l1 = stage.addChild(new Block(c1, idX));
			r1 = stage.addChild(new Block(c1, idX + gap));
			
			startPt1 = l1.x;
			startPt2 = r1.x;
			midPt = (l1.x + r1.x) / 2;
			
			stage.removeEventListener(Event.ENTER_FRAME, delayLoop);
			stage.addEventListener(Event.ENTER_FRAME, patternLoop);
			if (echo) stage.addEventListener(Event.ENTER_FRAME, echoLoop);
			
		}
		
		
		protected function patternLoop(evt:Event):void {
			stage.removeEventListener(Event.ENTER_FRAME, patternLoop);
		}
		
		
		protected function echoLoop(evt:Event):void {
			echoCount++;
			
			if (echoCount == 20 || echoCount == 40) {
				
				stage.addChildAt(new BlockEcho(c1, idX, l1.y), 2);
				stage.addChildAt(new BlockEcho(c1, idX + gap, r1.y), 2);
				
			}
			
			if (echoCount > 60) {
				stage.removeEventListener(Event.ENTER_FRAME, echoLoop);
			}
		}
	}
}
