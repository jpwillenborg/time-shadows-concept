package patterns {
	
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class MidReverbEcho extends MidReverb {
		
		protected var l1:Object;
		protected var r1:Object;
		protected var speed:int;
		private var thisCount:int;
		protected var startPt1:int;
		protected var startPt2:int;
		protected var midPt:int;
		
		
		public function MidReverbEcho(stage:Stage, c1:String, delay:int, echo:Boolean):void {
			
			super(stage, c1, delay, echo);
			
		}
		
		override protected function callBlock():void {
			
			l1 = stage.addChild(new Block(c1, idX));
			r1 = stage.addChild(new Block(c1, idX + gap));
			
			thisCount = 0;
			startPt1 = l1.x;
			startPt2 = r1.x;
			midPt = (l1.x + r1.x) / 2;
			
			stage.addEventListener(Event.ENTER_FRAME, thisLoop);
			stage.removeEventListener(Event.ENTER_FRAME, loop);
		}
		
		
		protected function thisLoop(evt:Event):void {
			
			thisCount++;
			
			if (thisCount == 20 || thisCount == 40) {
				
				stage.addChildAt(new BlockEcho(c1, idX, l1.y), 2);
				stage.addChildAt(new BlockEcho(c1, idX + gap, r1.y), 2);
				
			}
			
			if (thisCount > 60) {
				stage.removeEventListener(Event.ENTER_FRAME, thisLoop);
			}
		}
	}
}
