package characters {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	import starling.display.MovieClip;
	import starling.textures.TextureAtlas;
	import starling.core.Starling;
	
	
	public class Hero extends Sprite {
		
		public static var playerUp:MovieClip;
		public static var playerDown:MovieClip;
		public static var playerLeft:MovieClip;
		public static var playerRight:MovieClip;
		
		
		public function Hero():void {
						
			playerUp = new MovieClip(Atlas.atlas.getTextures("dude up"), 7);
			playerUp.loop = true;
			playerUp.stop();
			////addChild(playerUp);
			
			playerDown = new MovieClip(Atlas.atlas.getTextures("dude down"), 7);
			playerDown.loop = true;
			playerDown.stop();
			addChild(playerDown);
			
			playerLeft = new MovieClip(Atlas.atlas.getTextures("dude left"), 7);
			playerLeft.loop = true;
			playerLeft.stop();
			////addChild(playerLeft);
			
			playerRight = new MovieClip(Atlas.atlas.getTextures("dude right"), 7);
			playerRight.loop = true;
			playerRight.stop();
			////addChild(playerRight);
			
			Starling.juggler.add(playerUp);
			Starling.juggler.add(playerDown);
			Starling.juggler.add(playerLeft);
			Starling.juggler.add(playerRight);
		}
	}
}
