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
		
		public static var speed:Number = 16/3; // 64/12;
		public static var modSpeed:Number = 16/3; // reduce to a smaller increment if mc transitions don't mask
		
		public static var intX:Number;
		public static var intY:Number;
		
		public static var oldPos:Point;
		
		public static var modUp:Boolean = false;
		public static var modDown:Boolean = false;
		public static var modLeft:Boolean = false;
		public static var modRight:Boolean = false;
		
		
		public static function setup(stage:Stage):void {

			hero = new Sprite();
			hero.addChild(new Hero());
			Background.bgSprite.addChild(hero);
			
			Background.bgSprite.setChildIndex(Player.hero, Background.bgSprite.numChildren - 1);
			
			hero.x = Main.screenWidth/2 - hero.width/2;
			hero.y = Main.screenHeight/2 - hero.height/2;
			
			
			half = new Sprite();
			half.addChild(Atlas.generate("player half"));
			Background.bgSprite.addChild(half);
			
			half.x = hero.x;
			half.y = hero.y + 32;
			half.visible = false;
			
			
			oldPos = new Point();
		}
		
		
		public static function movePlayer(evt:Event):void {
			
			if (Controls.dirChange) {
				
				if (Controls.cDir == "up") {
					hero.removeChildAt(0);
					hero.addChild(Hero.playerUp);
					Hero.playerUp.currentFrame = 1;
					Hero.playerUp.play();
				}
				
				if (Controls.cDir == "down") {
					hero.removeChildAt(0);
					hero.addChild(Hero.playerDown);
					Hero.playerDown.currentFrame = 1;
					Hero.playerDown.play();
				}
				
				if (Controls.cDir == "left") {
					hero.removeChildAt(0);
					hero.addChild(Hero.playerLeft);
					Hero.playerLeft.currentFrame = 1;
					Hero.playerLeft.play();
				}
				
				if (Controls.cDir == "right") {
					hero.removeChildAt(0);
					hero.addChild(Hero.playerRight);
					Hero.playerRight.currentFrame = 1;
					Hero.playerRight.play();
				}
				
				if (Controls.cDir == "none") {
					Hero.playerUp.stop();
					Hero.playerDown.stop();
					Hero.playerLeft.stop();
					Hero.playerRight.stop();
				}
			}
			
			
			
			if (Controls.areActive) {
				
				oldPos.x = half.x;
				oldPos.y = half.y;
				
				
				if (Controls.cDir == "up") {
					hero.y -= speed;
					half.y -= speed;
					if (modLeft) {
						hero.x -= modSpeed;
						half.x -= modSpeed;
					} else 
					if (modRight) {
						hero.x += modSpeed;
						half.x += modSpeed;
					}
				} else
				if (Controls.cDir == "down") {
					hero.y += speed;
					half.y += speed;
					if (modLeft) {
						hero.x -= modSpeed;
						half.x -= modSpeed;
					} else 
					if (modRight) {
						hero.x += modSpeed;
						half.x += modSpeed;
					}
				} else
				if (Controls.cDir == "left") {
					hero.x -= speed;
					half.x -= speed;
					if (modUp) {
						hero.y -= modSpeed;
						half.y -= modSpeed;
					} else 
					if (modDown) {
						hero.y += modSpeed;
						half.y += modSpeed;
					}
				} else 
				if (Controls.cDir == "right") {
					hero.x += speed;
					half.x += speed;
					if (modUp) {
						hero.y -= modSpeed;
						half.y -= modSpeed;
					} else 
					if (modDown) {
						hero.y += modSpeed;
						half.y += modSpeed;
					}
				}
				
				
				
				intX = Math.round(half.x*100)/100;
				intY = Math.round(half.y*100)/100;
				
				
				
				if (Math.ceil(intX*10)/10 == intX) {
					half.x = intX;
				}
				if (Math.ceil(intY*10)/10 == intY) {
					half.y = intY;
				}

				
				
				if (intX % 16 == 0) {
					modLeft = false;
					modRight = false;
				} else {
					if (intX % 16 < 8) {
						modLeft = true;
						modRight = false;
					} else {
						modLeft = false;
						modRight = true;
					}
				}
				
				if (intY % 16 == 0) {
					modUp = false;
					modDown = false;
				} else {
					if (intY % 16 < 8) {
						modUp = true;
						modDown = false;
					} else {
						modUp = false;
						modDown = true;
					}
				}
				
			}
		}
		
		
		public static function registerHit(id:Object) {
			
			half.x = oldPos.x;
			half.y = oldPos.y;
			
			hero.x = half.x;
			hero.y = half.y - 32;
			
		}
	}
}
