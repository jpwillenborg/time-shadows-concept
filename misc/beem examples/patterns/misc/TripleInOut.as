package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class TripleInOut {
		
		public function TripleInOut (stage:Stage, c1:String, c2:String, c3:String):void {			
			
			var l1 = stage.addChild(new BlockInOut(stage, c1, -150));
			var r1 = stage.addChild(new BlockInOut(stage, c1, Main.screenWidth + 150));
			var l2;
			var r2;
			var l3;
			var r3;
			
			stage.addEventListener(Event.ENTER_FRAME, check);
			function check(evt:Event):void {
				
				if (!l2 && l1.y > 150) {
					l2 = stage.addChild(new BlockInOut(stage, c2, -150));
					r2 = stage.addChild(new BlockInOut(stage, c2, Main.screenWidth + 150));
				}
				
				if (!l3 && l2 && l2.y > 150) {
					l3 = stage.addChild(new BlockInOut(stage, c3, -150));
					r3 = stage.addChild(new BlockInOut(stage, c3, Main.screenWidth + 150));
				}
				
				if (r3 && r3.y > Main.screenHeight) {
					l1 = null;
					l2 = null;
					r1 = null;
					r2 = null;
					l3 = null;
					r3 = null;
					stage.removeEventListener(Event.ENTER_FRAME, check);
				}
			}
		}
	}
}
