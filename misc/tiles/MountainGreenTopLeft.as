package tiles {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class MountainGreenTopLeft extends Sprite {

		
		public function MountainGreenTopLeft(idX:int, idY:int) {
			
			addChild(Atlas.generate("mountain green top left"));
			Environment.objList.push(this);			
			
			x = idX * 64;
			y = idY * 64;
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		
		public function loop(evt:Event):void {
			
			if (Math.sqrt((Player.hero.x - x) * (Player.hero.x - x) + (Player.hero.y - y) * (Player.hero.y - y)) <= 91) {
				if (getBounds(parent).intersects(Player.hero.getBounds(Player.hero.parent))) {
					Player.registerHit(this);
				}
			}
		}
		
		
		public function removeSelf():void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stage.contains(this)) {
				for (var i:int = 0; i < Environment.objList.length; i++) {
					if (Environment.objList[i] == this) {
						Environment.objList.splice(i, 1);
					}
				}
				parent.removeChild(this);
				this.dispose();
			}
		}
	}
}
