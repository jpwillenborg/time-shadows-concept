package {
	
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Game extends Sprite {
		
		
		function Game():void{
			addEventListener(Event.ADDED_TO_STAGE, start);
		}
		
		
		private function start(evt:Event):void {
			
			Environment.setup(stage);
			
			stage.addEventListener(Event.ENTER_FRAME, Player.movePlayer);
			
			Background.setup(stage);
			Player.setup(stage);
			Controls.setup(stage);
			
			removeEventListener(Event.ADDED_TO_STAGE, start);
			
			/*stage.addEventListener(Event.ENTER_FRAME, loop);
			function loop(evt:Event) {
				//trace(Background.tileSprite.numChildren, Environment.objList.length);
			}*/
		}
	}
}
