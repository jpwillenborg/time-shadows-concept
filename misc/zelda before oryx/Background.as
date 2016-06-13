package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import flash.utils.*;
	
	
	public class Background {
		
		public static var bgSprite:Sprite;
		public static var tileSprite:Sprite;
		public static var transSprite:Sprite;
		public static var inTransition:Boolean = false;
		
		public static var col:int = 0;
		public static var row:int = 0;
		
		public static var tileWidth:int = 64;
		public static var tileHeight:int = 64;
		public static var tileList:Array = [];
		
		
		public static function setup(stage:Stage):void {
			
			Map.setup();
			
			bgSprite = new Sprite();
			stage.addChild(bgSprite);
			
			tileSprite = new Sprite();
			bgSprite.addChild(tileSprite);
			
			transSprite = new Sprite();
			transSprite.addChild(Atlas.generate("blank"));
			transSprite.getChildAt(0).width = Main.screenWidth;
			transSprite.getChildAt(0).height = Main.screenHeight;
			stage.addChild(transSprite);
			transSprite.alpha = 0.0;
			
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
						tileList.push(tileSprite.addChild(new Tile("ground", j, i)));
						break;
						
						case 1:
						tileList.push(tileSprite.addChild(new Tile("bush", j, i)));
						break;
							
						case 2:
						tileList.push(tileSprite.addChild(new Tile("mountain green mid", j, i)));
						break;
						
						case 3:
						tileList.push(tileSprite.addChild(new Tile("water", j, i)));
						break;
						
						case 4:
						tileList.push(tileSprite.addChild(new Tile("mountain green top", j, i)));
						break;
						
						case 5:
						tileList.push(tileSprite.addChild(new Tile("mountain green top left", j, i)));
						break;
						
						case 6:
						tileList.push(tileSprite.addChild(new Tile("mountain green top right", j, i)));
						break;
						
						case 7:
						tileList.push(tileSprite.addChild(new Tile("mountain green bottom left", j, i)));
						break;
						
						case 8:
						tileList.push(tileSprite.addChild(new Tile("mountain green bottom right", j, i)));
						break;
						
						case 9:
						tileList.push(tileSprite.addChild(new Door("door", j, i)));
						break;
					}
				}
			}
		}
		
		
		public static function checkForDoors(evt:Event):void {
			
			if (!inTransition) {
				
				if (Player.hero.y < - Player.hero.height/2) {
					transOut("up");
				} else
				
				if (Player.hero.y > Main.screenHeight - Player.hero.height/2) {
					transOut("down");
				} else
				
				if (Player.hero.x < - Player.hero.width/2) {
					transOut("left");
				} else
				
				if (Player.hero.x > Main.screenWidth - Player.hero.width/2) {
					transOut("right");
				} 
			}
		}
		
		
		public static function transOut(id:String) {
			
			inTransition = true;
			Controls.areActive = false;
			bgSprite.flatten();
			
			var wipeInt = setInterval(wipe, 20);
			function wipe() {
				
				transSprite.alpha += 0.15;
				
				if (transSprite.alpha >= 1.0) {
					clearInterval(wipeInt);
					transSprite.alpha = 1.0;
					bgSprite.unflatten();
					switchRoom(id);
				}
			}
		}
		
		
		public static function switchRoom(id:String) {
			if (id == "up") {				
				row--;
				Player.hero.y += 640 - 64/3;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
			} else 
			
			if (id == "down") {				
				row++;
				Player.hero.y -= 640 - 64/3;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
			} else
			
			if (id == "left") {				
				col--;				
				Player.hero.x += 960 - 64/3;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
			} else
			
			if (id == "right") {
				col++;				
				Player.hero.x -= 960 - 64/3;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
			}
			
			
			buildScreen(col, row);
			bgSprite.flatten();
			
			var waitInc:int = setInterval(wait, 50);
			function wait() {
				clearInterval(waitInc);
				transIn();	
			}
		}
		
		
		public static function transIn() {
			
			var wipeInt = setInterval(wipeIn, 20);
			function wipeIn() {
				
				transSprite.alpha -= 0.15;
				
				if (transSprite.alpha <= 0.0) {
					clearInterval(wipeInt);
					
					transSprite.alpha = 0.0;
					
					inTransition = false;
					Controls.areActive = true;
					bgSprite.unflatten();
				}
			}
		}
	}
}
