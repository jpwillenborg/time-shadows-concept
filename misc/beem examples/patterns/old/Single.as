package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Single extends Sprite {
		
		static var hGap:int = -40; // -120 to 40
		static var hPos = 0; // -160 to 160
		//static var hArr:Array = [-160, 0, 160];
		//static var vGap:uint = 100;
		//static var xDiff:int;
		
		
		public function Single(stage:Stage, idX:int, c1:String, delay:int):void {
			
			//hPos = hArr[int(Math.random() * hArr.length)];
			
			var l1:Object = stage.addChild(new Block(c1, hGap, hPos));
			var r1:Object = stage.addChild(new Block(c1, Main.screenWidth - hGap, hPos));
			
			
			/*if (l1.x < -160) {
				xDiff = Math.abs(l1.x + 160);
				l1.x += xDiff;
				r1.x += xDiff;
			}
			
			if (r1.x > 800) {
				xDiff = Math.abs(r1.x - 800);
				l1.x -= xDiff;
				r1.x -= xDiff;
			}*/
		}
	}
}
