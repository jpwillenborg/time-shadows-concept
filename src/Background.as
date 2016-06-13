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
		
		public static var row:int = 7;
		public static var col:int = 5;
		
		public static var tileWidth:int = 64;
		public static var tileHeight:int = 64;
		public static var tileNames:Array = [];
		public static var tileList:Array = [];
		public static var passList:Array = [];
		
		
		public static function setup(stage:Stage):void {
			
			Map.setup();
			
			bgSprite = new Sprite();
			stage.addChild(bgSprite);
			
			tileSprite = new Sprite();
			bgSprite.addChild(tileSprite);
			
			transSprite = new Sprite();
			transSprite.addChild(Atlas.generate("temp"));
			transSprite.getChildAt(0).width = Main.screenWidth;
			transSprite.getChildAt(0).height = Main.screenHeight;
			stage.addChild(transSprite);
			transSprite.alpha = 0.0;
			
			tileNames = [
			
				"field grass", // 00
				"field grass rock",
				"field tree alive",
				"field tree dead",
				"field bridge vert",
				"field water 5_1",
				"field water 3_1",
				"field water 7_1",
				"field treasure",
				"field bridge horz",
				"field flowers white",
				"field water 9_1",
				"field water 1_1",
				
				"desert bones", // 13
				"desert mountain 1",
				"desert mountain 3",
				"desert mountain 5",
				"desert mountain 7",
				"desert mountain 9",
				"desert sand dark",
				"desert sand light",
				"desert bush",
				"desert water 1_1",
				"desert water 3_1",
				"desert water 5_1",
				"desert water 7_1",
				"desert water 9_1",
				"desert mountain 8",
				"desert cactus",
				
				"swamp grass", // 29
				"swamp mountain 1",
				"swamp mountain 3",
				"swamp mountain 5",
				"swamp mountain 7",
				"swamp mountain 9",
				"swamp muck 1",
				"swamp muck 3",
				"swamp muck 5",
				"swamp muck 7",
				"swamp muck 9",
				"swamp sand",
				"swamp tree dead",
				"swamp bush",
				"swamp water dark 1_1",
				"swamp water dark 3_1",
				"swamp water dark 5_1",
				"swamp water dark 7_1",
				"swamp water dark 9_1",
				"swamp water light",
				"swamp rocks",
				
				"winter ground", // 50
				"winter ice 1",
				"winter ice 3",
				"winter ice 5",
				"winter ice 7",
				"winter ice 9",
				"winter mountain 1",
				"winter mountain 3",
				"winter mountain 5",
				"winter mountain 7",
				"winter mountain 8",
				"winter mountain 9",
				"winter tree",
				"winter ice crack", // 63
				"winter snow 1",
				"winter snow 3",
				"winter snow 5",
				"winter snow 7",
				"winter snow 9",
				"winter rocks",
				
				"mountain ground", // 70
				"mountain sand",
				"mountain mountain 1",
				"mountain mountain 3",
				"mountain mountain 5",
				"mountain mountain 7",
				"mountain mountain 8",
				"mountain mountain 9",
				"mountain bush",
				"mountain water 1_1", // 79
				"mountain water 3_1",
				"mountain water 5_1",
				"mountain water 7_1",
				"mountain water 9_1",
				"mountain tree dead",
				"mountain rock",
				"mountain sign", // 86
				
				"field mountain 1",
				"field mountain 3",
				"field mountain 5",
				"field mountain 7", // 90
				"field mountain 9",
				
				"field grass 7",
				"field grass 1"
				
			];
			
			
			passList = [
				
				"field grass",
				"field grass rock",
				"field bridge vert",
				"field bridge horz",
				"field flowers white",
				"desert sand dark",
				"desert sand light",
				"desert bush",
				"swamp grass",
				"swamp muck 1",
				"swamp muck 3",
				"swamp muck 5",
				"swamp muck 7",
				"swamp muck 9",
				"swamp sand",
				"swamp bush",
				"swamp rocks",
				"winter ground",
				"winter snow 1",
				"winter snow 3",
				"winter snow 5",
				"winter snow 7",
				"winter snow 9",
				"winter rocks",
				"mountain ground",
				"mountain sand",
				"mountain bush",
				"mountain rock",
				
				"field grass 7",
				"field grass 1"
			];
				
				
			buildScreen(col, row);
			stage.addEventListener(Event.ENTER_FRAME, checkForDoors);
		}
		
		
		public static function buildScreen(row:int, col:int):void {
			
			trace("screen" + col + "_" + row);
			
			for each (var id in tileList) {
				id.removeSelf();
			}
			tileList.length = 0;
			
			for (var i:int = 0; i < Map["screen" + col + "_" + row].length; i++) {
				for (var j:int = 0; j < Map["screen" + col + "_" + row][i].length; j ++) {
					
					tileList.push(tileSprite.addChild(new Tile(tileNames[Map["screen" + col + "_" + row][i][j]], j, i)));

				}
			}
		}
		
		
		public static function checkForDoors(evt:Event):void {
			
			if (!inTransition) {
				
				if (Player.hero.y <= -32) {
					transOut("up");
				} else
				
				if (Player.hero.y >= 640 - 32) {
					transOut("down");
				} else
				
				if (Player.hero.x <= -32) {
					transOut("left");
				} else
				
				if (Player.hero.x >= 960 - 32) {
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
				Player.hero.y = 640 - 64;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
			} else 
			
			if (id == "down") {				
				row++;
				Player.hero.y = 0;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
			} else
			
			if (id == "left") {				
				col--;				
				Player.hero.x  = 960 - 64;
				Player.half.x = Player.hero.x;
				Player.half.y = Player.hero.y + 32;
			} else
			
			if (id == "right") {
				col++;
				Player.hero.x = 0;
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
