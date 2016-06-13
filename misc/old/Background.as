package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import tiles.*;
	
	
	public class Background {
		
		public static var bgSprite:Sprite;
		public static var tileSprite:Sprite;
		
		public static var col:int = 0;
		public static var row:int = 0;
		
		public static var tileWidth:int = 64;
		public static var tileHeight:int = 64;
		public static var moveDir:String;
		public static var tileList:Array = [];
		
		
		public static function setup(stage:Stage):void {
			
			Map.setup();
			
			bgSprite = new Sprite();
			stage.addChild(bgSprite);
			
			tileSprite = new Sprite();
			bgSprite.addChild(tileSprite);
			
			buildScreen(col, row);
			stage.addEventListener(Event.ENTER_FRAME, checkForDoors);
		}
		
		
		public static function buildScreen(row:int, col:int):void {	
			
			for each (var id in tileList) {
				id.removeSelf();
			}
			tileList.length = 0;
			
			
			for (var i:int = 0; i < Map["screen" + col + "_" + row].length; i++) {
				for (var j:int = 0; j < Map["screen" + col + "_" + row][i].length; j ++) {
					
					switch (Map["screen" + col + "_" + row][i][j]){
					
						case 0:
						tileList.push(tileSprite.addChild(new Ground(j, i)));
						break;
						
						case 1:
						tileList.push(tileSprite.addChild(new Bush(j, i)));
						break;
							
						case 2:
						tileList.push(tileSprite.addChild(new MountainGreenMid(j, i)));
						break;
						
						case 3:
						tileList.push(tileSprite.addChild(new Water(j, i)));
						break;
						
						case 4:
						tileList.push(tileSprite.addChild(new MountainGreenTop(j, i)));
						break;
						
						case 5:
						tileList.push(tileSprite.addChild(new MountainGreenTopLeft(j, i)));
						break;
						
						case 6:
						tileList.push(tileSprite.addChild(new MountainGreenTopRight(j, i)));
						break;
						
						case 7:
						tileList.push(tileSprite.addChild(new MountainGreenBottomLeft(j, i)));
						break;
						
						case 8:
						tileList.push(tileSprite.addChild(new MountainGreenBottomRight(j, i)));
						break;
					}
				}
			}
		}
		
		
		public static function checkForDoors(evt:Event):void {
				
			// RIGHT
			
			if (Player.hero.x > Main.screenWidth - Player.hero.width/2) {
				
				moveDir = "right";
				Controls.areActive = false;
				
				col++;
				buildScreen(col, row);
				
				Player.hero.x -= 960;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
				Controls.areActive = true;
			}
			
			
			// LEFT
			
			if (Player.hero.x < - Player.hero.width/2) {
				
				moveDir = "left";
				Controls.areActive = false;
				
				col--;
				buildScreen(col, row);
				
				Player.hero.x += 960;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
				Controls.areActive = true;
			}
			
			
			// DOWN
			
			if (Player.hero.y > Main.screenHeight - Player.hero.height/2) {
				
				moveDir = "down";
				Controls.areActive = false;
				
				row++;
				buildScreen(col, row);
				
				Player.hero.y -= 640;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
				Controls.areActive = true;
			}
			
			
			// UP
			
			if (Player.hero.y < - Player.hero.height/2) {
				
				moveDir = "up";
				Controls.areActive = false;
				
				row--;
				buildScreen(col, row);
				
				Player.hero.y += 640;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
				Controls.areActive = true;
			}
		}
	}
}
