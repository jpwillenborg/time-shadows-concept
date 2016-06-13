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
		public static var speed:Number = 32/3;
		public static var oldPos:Point;
		public static var intX:Number;
		public static var intY:Number;
		
		
		public static function setup(stage:Stage):void {

			hero = new Sprite();
			hero.addChild(new Hero());
			Background.bgSprite.addChild(hero);
			
			Background.bgSprite.setChildIndex(Player.hero, Background.bgSprite.numChildren - 1);
			
			hero.x = 480 - hero.width/2; // Main.screenWidth/2 - hero.width/2;
			hero.y = 320 - hero.height/2 - 32; // Main.screenHeight/2 - hero.height/2 - 32;
			
			
			half = new Sprite();
			half.addChild(Atlas.generate("player half"));
			Background.bgSprite.addChild(half);
			
			half.x = hero.x;
			half.y = hero.y + 32;
			half.visible = false;
			
			
			oldPos = new Point();
		}
		
		
		public static function movePlayer(evt:Event):void {			
			
			if (!Controls.controlLock) {
				
				// ANIMATION CHANGE
				
				if (Controls.dirChange) {
					
					if (Controls.cDir == "up") {
						hero.removeChildAt(0);
						hero.addChild(Hero.playerUp);
						//Hero.playerUp.currentFrame = 1;
						Hero.playerUp.play();
					}
					
					if (Controls.cDir == "down") {
						hero.removeChildAt(0);
						hero.addChild(Hero.playerDown);
						//Hero.playerDown.currentFrame = 1;
						Hero.playerDown.play();
					}
					
					if (Controls.cDir == "left") {
						hero.removeChildAt(0);
						hero.addChild(Hero.playerLeft);
						//Hero.playerLeft.currentFrame = 1;
						Hero.playerLeft.play();
					}
					
					if (Controls.cDir == "right") {
						hero.removeChildAt(0);
						hero.addChild(Hero.playerRight);
						//Hero.playerRight.currentFrame = 1;
						Hero.playerRight.play();
					}
					
					if (Controls.cDir == "none") {
						Hero.playerUp.stop();
						Hero.playerDown.stop();
						Hero.playerLeft.stop();
						Hero.playerRight.stop();
					}
				}
				
				
				// MOVE CHARACTER
			
				if (Controls.areActive) {
					
					oldPos.x = half.x;
					oldPos.y = half.y;
					
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
					
					
					intX = Math.round(half.x*100)/100;
					intY = Math.round(half.y*100)/100;
					
					if (Math.ceil(intX*10)/10 == intX) {
						half.x = intX;
					}
					if (Math.ceil(intY*10)/10 == intY) {
						half.y = intY;
					}
					
					hero.x = half.x;
					hero.y = half.y - 32;
				}
				
			} else {
				
				// AUTO MOVE TO GRID
				
				if (Controls.oldDir == "up") {
					hero.y -= speed;
					half.y -= speed;
					
					if (half.y % 32 == 0) {
						Controls.controlLock = false;
					}
				} else 
				if (Controls.oldDir == "down") {
					hero.y += speed;
					half.y += speed;
					
					if (half.y % 32 == 0) {
						Controls.controlLock = false;
					}
				} else 
				if (Controls.oldDir == "left") {
					hero.x -= speed;
					half.x -= speed;
					
					if (half.x % 32 == 0) {
						Controls.controlLock = false;
					}
				} else 
				if (Controls.oldDir == "right") {
					hero.x += speed;
					half.x += speed;
					
					if (half.x % 32 == 0) {
						Controls.controlLock = false;
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
				
				hero.x = half.x;
				hero.y = half.y - 32;
			}
		}
		
		
		public static function registerHit(id:Object) {
			
			Controls.controlLock = false;
			Controls.cDir = "none";
			
			half.x = oldPos.x;
			half.y = oldPos.y;
			
			hero.x = half.x;
			hero.y = half.y - 32;
			
		}
	}
}
