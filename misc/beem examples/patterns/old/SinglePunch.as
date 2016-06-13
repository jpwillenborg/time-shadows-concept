package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class SinglePunch extends Sprite {
		
		static var hGap:int = -40; // -120 to 40
		static var hPos = 0; // -160 to 160
		static var hArr:Array = [-160, 0, 160];
		static var vGap:uint = 100;
		static var xDiff:int;
		
		static var count:int;
		static var midPt:int;
		
		static var speed:int;
		
		
		public function SinglePunch(stage:Stage, c1:String, delay:int):void {
			
			count = 0;
			speed = 12;
			
			hPos = hArr[int(Math.random() * hArr.length)];
			
			var l1:Object = stage.addChild(new Block(c1, hGap, hPos));
			var r1:Object = stage.addChild(new Block(c1, Main.screenWidth - hGap, hPos));
			
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
			
			
			midPt = (r1.x + l1.x)/2;
			
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			function loop(evt:Event):void {
				count++;
				if (count >= 45) {
					
					l1.x += speed;
					r1.x -= speed;
					
					if ((l1.x + (l1.width/2)) > midPt + 30) {
						l1.x = midPt - l1.width/2 + 30;
						r1.x = midPt + r1.width/2 - 30;
						speed *= -0.9;
					}
					
					if (l1.x - 30 < -l1.width) {
						stage.removeEventListener(Event.ENTER_FRAME, loop);
					}
				}
				
			}
			
			
			
			
		}
	}
}
