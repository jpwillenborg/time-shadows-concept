package  {
	
	import characters.*;
	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	
	public class Player extends Sprite {
		
		public static var hero:Sprite;
		public static var half:Sprite;
		public static var speed:int = 8;
		public static var oldPos:Point;
		public static var overlap:int;
		
		
		public static function setup(stage:Stage):void {
			
			hero = new Sprite();
			hero.addChild(new Hero());
			Background.bgSprite.addChild(hero);
			
			half = new Sprite();
			half.addChild(Atlas.generate("player half"));
			Background.bgSprite.addChild(half);
			
			Background.bgSprite.setChildIndex(Player.hero, Background.bgSprite.numChildren - 1);
			
			hero.x = Main.screenWidth/2 - hero.width/2;
			hero.y = Main.screenHeight/2 - hero.height/2;
			
			half.x = hero.x;
			half.y = hero.y + 32;
			
			half.visible = false;
			
			oldPos = new Point();
		}
		
		
		public static function movePlayer(evt:Event):void {
			
			if (Controls.areActive) {
				
				oldPos.x = hero.x;
				oldPos.y = hero.y;
				
				if (Controls.cDir == "up") {
					hero.y -= speed;
					half.y -= speed;
				} else
				if (Controls.cDir == "down") {
					hero.y += speed;
					half.y += speed;
				} else 
				if (Controls.cDir == "left") {
					hero.x -= speed;
					half.x -= speed;
				} else 
				if (Controls.cDir == "right") {
					hero.x += speed;
					half.x += speed;
				}
			}
		}
		
		
		public static function registerHit(id:Object) {
			
			hero.x = oldPos.x;
			hero.y = oldPos.y;
			
			half.x = hero.x;
			half.y = hero.y + 32;
			
		}
	}
}
