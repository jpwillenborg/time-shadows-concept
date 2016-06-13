package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class SingleCircle extends Sprite {
		
		
		public function SingleCircle(stage:Stage, c1:String):void {
			
			var side:int;

			if (int(Math.random() * 2) < 1) {
				side = 0;
			} else {
				side = 1;
			}
			
			var c:Object = stage.addChild(new Circle(c1, side));
		}
	}
}
