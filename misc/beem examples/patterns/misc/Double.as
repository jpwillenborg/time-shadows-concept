package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Double {
		
		static var hGap:int = -30;
		static var vGap:uint = 100;
		
		
		public function Double(stage:Stage, c1:String, c2:String):void {			
			var l1 = stage.addChild(new Block(c1, hGap));
			var r1 = stage.addChild(new Block(c1, Main.screenWidth - hGap));			
			var l2;
			var r2;
			
			stage.addEventListener(Event.ENTER_FRAME, check);
			function check(evt:Event):void {			
				
				if (!l2 && l1.y > vGap) {
					l2 = stage.addChild(new Block(c2, hGap));
					r2 = stage.addChild(new Block(c2, Main.screenWidth - hGap));
				}
				
				if (r2 && r2.y > Main.screenHeight) {
					l1 = null;
					l2 = null;
					r1 = null;
					r2 = null;
					stage.removeEventListener(Event.ENTER_FRAME, check);
				}
				
			}
		}
	}
}
