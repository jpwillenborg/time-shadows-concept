package {
	
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Game extends Sprite {
		
		
		function Game():void{
			addEventListener(Event.ADDED_TO_STAGE, start);
		}
		
		
		private function start(evt:Event):void {
			//Environment.setup(stage);
			//IntroScreen.show(stage);
			//PlayScreen.show(stage);
			
			trace("go");
			
			removeEventListener(Event.ADDED_TO_STAGE, start);
		}
	}
}
