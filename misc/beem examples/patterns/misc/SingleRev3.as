package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class SingleRev3 extends Sprite {
		
		static var hGap:int = -40; // -120 to 40
		static var hPos = 0; // -160 to 160
		static var hArr:Array = [-160, 0, 160];
		static var vGap:uint = 2;
		static var xDiff:int;
		static var count:int;
		
		
		public function SingleRev3(stage:Stage, c1:String, delay:int):void {
			
			count = 0;
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			function loop(evt:Event):void {
				
				count ++;
				
				if (delay == 0) {
					callBlock();
				}
				
				if (delay == 3 && count >= 45) {
					callBlock();
				}
				
				if (delay == 4 && count >= 60) {
					callBlock();
				}
			}
			
			
			function callBlock() {
				stage.removeEventListener(Event.ENTER_FRAME, loop);
				
				hPos = hArr[int(Math.random() * hArr.length)];
				
				var l1:Object = stage.addChild(new Block(c1, hGap, hPos));
				var r1:Object = stage.addChild(new Block(c1, Main.screenWidth - hGap, hPos));
				var l2;
				var r2;
				var l3;
				var r3;
				
				//				
				
				if (l1.x < -160) {
					xDiff = Math.abs(l1.x + 160);
					l1.x += xDiff;
					r1.x += xDiff;
				}
				
				if (r1.x > 800) {
					xDiff = Math.abs(r1.x - 800);
					l1.x -= xDiff;
					r1.x -= xDiff;
				}
				
				//
				
				stage.addEventListener(Event.ENTER_FRAME, check);
				function check(evt:Event):void {
					
					if (!l2 && l1.y > vGap) {
						l2 = stage.addChildAt(new Block(c1, hGap, hPos), 2);
						r2 = stage.addChildAt(new Block(c1, Main.screenWidth - hGap, hPos), 2);
						
						//				
						
						l2.x = l1.x;
						r2.x = r1.x;
						
						//
						
						l2.alpha = 0.4;
						r2.alpha = 0.4;
					}
					
					if (!l3 && l2 && l2.y > vGap) {
						l3 = stage.addChildAt(new Block(c1, hGap, hPos), 2);
						r3 = stage.addChildAt(new Block(c1, Main.screenWidth - hGap, hPos), 2);
						
						//				
				
						l3.x = l2.x;
						r3.x = r2.x;
						
						//
						
						l3.alpha = 0.2;
						r3.alpha = 0.2;
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
}
