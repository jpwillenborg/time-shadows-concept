package {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	import starling.display.MovieClip;
	import starling.animation.Juggler;
	import starling.core.Starling;
	
	
	public class Tile extends Sprite {
		
		private var id:String;
		private var passable:Boolean = false;
		private var mc:MovieClip; // add logic for remove method?
		
		
		public function Tile(id:String, idX:int, idY:int) {
			
			if (id == "field water 1_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("field water 1"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "field water 3_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("field water 3"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "field water 5_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("field water 5"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "field water 7_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("field water 7"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "field water 9_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("field water 9"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			
			
			if (id == "swamp water dark 1_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("swamp water dark 1"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "swamp water dark 3_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("swamp water dark 3"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "swamp water dark 5_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("swamp water dark 5"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "swamp water dark 7_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("swamp water dark 7"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "swamp water dark 9_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("swamp water dark 9"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			
			
			if (id == "mountain water 1_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("mountain water 1"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "mountain water 3_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("mountain water 3"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "mountain water 5_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("mountain water 5"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "mountain water 7_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("mountain water 7"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			} else 
			if (id == "mountain water 9_1") {
				mc = new MovieClip(Atlas.atlas.getTextures("mountain water 9"), 1.25);
				addChild(mc);
				Starling.juggler.add(mc);
			}
			
			
			
			
			
			else {
				//trace(id);
				addChild(Atlas.generate(id));
			}
			
			x = idX * 64;
			y = idY * 64;
			//width *= 8;
			//height *= 8;
			
			Environment.objList.push(this);
			
			
			for (var i:int = 0; i < Background.passList.length; i++) {
				if (id == Background.passList[i]) {
					passable = true;
					break;
				}
			}
			
			if (!passable) {
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
