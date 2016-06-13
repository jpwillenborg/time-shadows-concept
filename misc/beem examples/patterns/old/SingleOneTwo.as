package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class SingleOneTwo extends Sprite {
		
		static var hGap:int = -40; // -120 to 40
		static var hPos = 0; // -160 to 160
		static var hArr:Array = [-160, 0, 160];
		static var vGap:uint = 100;
		static var xDiff:int;
		static var count:int;
		static var side:Boolean;
		
		public function SingleOneTwo(stage:Stage, c1:String, delay:int):void {
			
			count = 0;
			
			var l1:Object;
			var r1:Object;
			
			if (int(Math.random() * 1.99) < 1) {
				side = false;
				l1 = stage.addChild(new BlockOneTwo(c1, hGap, hPos + 160));
				
				if (l1.x < -160) {
					xDiff = Math.abs(l1.x + 160);
					l1.x += xDiff;
					r1.x += xDiff;
				}
			} else {
				side = true;
				r1 = stage.addChild(new BlockOneTwo(c1, Main.screenWidth - hGap, hPos - 160));
				
				if (r1.x > 800) {
					xDiff = Math.abs(r1.x - 800);
					l1.x -= xDiff;
					r1.x -= xDiff;
				}
			}
			
			
			
			
			
			
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			function loop(evt:Event):void {
				count++;
				if (count > 30) {
					
					stage.removeEventListener(Event.ENTER_FRAME, loop);
					
					if (!side) {
						r1 = stage.addChild(new BlockOneTwo(c1, Main.screenWidth - hGap, hPos - 160));
						
						if (r1.x > 800) {
							xDiff = Math.abs(r1.x - 800);
							l1.x -= xDiff;
							r1.x -= xDiff;
						}
					} else {
						l1 = stage.addChild(new BlockOneTwo(c1, hGap, hPos + 160));
						
						if (l1.x < -160) {
							xDiff = Math.abs(l1.x + 160);
							l1.x += xDiff;
							r1.x += xDiff;
						}
					}
				}
			}
			
			
			
		}
	}
}
