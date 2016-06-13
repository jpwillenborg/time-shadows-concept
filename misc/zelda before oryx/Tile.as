package {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Tile extends Sprite {
		
		private var id:String;
		
		
		public function Tile(id:String, idX:int, idY:int) {
			
			addChild(Atlas.generate(id));
			Environment.objList.push(this);
			
			x = idX * 64;
			y = idY * 64;
			
			if (id != "ground") {
				addEventListener(Event.ENTER_FRAME, loop);
			}
		}
		
		
		public function loop(evt:Event):void {
			
			if (Math.sqrt((Player.half.x - x) * (Player.half.x - x) + (Player.half.y - y) * (Player.half.y - y)) <= 91) {
				if (getBounds(parent).intersects(Player.half.getBounds(Player.half.parent))) {
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
