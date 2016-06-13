package characters {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Hero extends Sprite {
		
		
		public function Hero():void {
			
			addChild(Atlas.generate("player"));
			
		}
	}
}
