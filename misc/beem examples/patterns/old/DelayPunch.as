package patterns {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class DelayPunch extends Sprite {
		
		static var hGap:int = -40; // -120 to 40
		static var hPos = 0; // -160 to 160
		static var hArr:Array = [-160, 0, 160];
		static var vGap:uint = 100;
		static var xDiff:int;
		static var count:int;
		
		
		public function DelayPunch(stage:Stage, c1:String, delay:int):void {
			
			count = 0;
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			function loop(evt:Event):void {
				
				count ++;
				
				if (delay == 0) {
					new SinglePunch(stage, c1, delay);
					stage.removeEventListener(Event.ENTER_FRAME, loop);
				}
				
				if (delay == 2 && count >= 30) {
					new SinglePunch(stage, c1, delay);
					stage.removeEventListener(Event.ENTER_FRAME, loop);
				}
				
				if (delay == 3 && count >= 45) {
					new SinglePunch(stage, c1, delay);
					stage.removeEventListener(Event.ENTER_FRAME, loop);
				}
			}
		}
	}
}
