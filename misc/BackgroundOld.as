package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import tiles.*;
	
	
	public class Background {
		
		public static var bgSprite:Sprite;
		public static var screen00:Array;
		public static var screen01:Array;
		public static var screen02:Array;
		public static var screen10:Array;
		public static var screen11:Array;
		public static var screen12:Array;
		public static var screen13:Array;
		public static var row:int = 0;
		public static var col:int = 0;
		public static var tileWidth:int = 64;
		public static var tileHeight:int = 64;
		public static var moveDir:String;
		public static var inTransition:Boolean = false;
		
		
		public static function setup(stage:Stage):void {
			
			bgSprite = new Sprite();
			stage.addChild(bgSprite);
			
			
			// ROW 0
			
			screen00 = [
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,1,0,0,0,0,0,1,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				[2,0,0,0,1,0,0,0,0,0,1,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,2,2,2,2,2,0,0,0,2,2,2,2,2,2]
			];
			
			screen01 = [
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[0,0,0,0,0,3,3,3,3,3,0,0,0,0,2],
				[0,0,0,0,0,3,3,3,3,3,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,2,2,2,2,2,0,0,0,2,2,2,2,2,2]
			];
			
			screen02 = [
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,1,0,0,0,1,0,0,0,0,2],
				[2,0,0,0,1,0,0,0,0,0,1,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,2,2,2,2,2,0,0,0,2,2,2,2,2,2]
			];
			
			
			// ROW 1
			
			screen10 = [
				[2,2,2,2,2,2,0,0,0,2,2,2,2,2,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,1,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
			];
			
			screen11 = [
				[2,2,2,2,2,2,0,0,0,2,2,2,2,2,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				[2,0,0,0,1,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
			];
			
			screen12 = [
				[2,2,2,2,2,2,0,0,0,2,2,2,2,2,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				[2,0,0,0,0,0,0,0,0,1,1,1,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
			];
			
			screen13 = [
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[0,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[0,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
				[2,2,0,0,0,0,0,0,0,0,0,0,0,2,2],
				[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
			];
			
			
			// CONSTRUCT MAP
			
			buildScreen(row, col);
			stage.addEventListener(Event.ENTER_FRAME, checkForDoor);
		}
		
		
		public static function buildScreen(row:int, col:int):void {
			
			if (!moveDir) {
				
				for (var i:int = 0; i < Background["screen" + row + col].length; i++) {
					for (var j:int = 0; j < Background["screen" + row + col][i].length; j ++) {
					
						switch (Background["screen" + row + col][i][j]){
						
							case 0:
							bgSprite.addChild(new Sand(j, i));
							break;
							
							case 1:
							bgSprite.addChild(new Bush(j, i));
							break;
								
							case 2:
							bgSprite.addChild(new Mountain(j, i));
							break;
							
							case 3:
							bgSprite.addChild(new Water(j, i));
							break;
						} 
					}
				}
			}
					
				
			if (moveDir == "right") {
				
				for (var i:int = 0; i < Background["screen" + row + col].length; i++) {
					for (var j:int = 0; j < Background["screen" + row + col][i].length; j ++) {
						
						switch (Background["screen" + row + col][i][j]){
						
							case 0:
							bgSprite.addChild(new Sand(j + 15, i));
							break;
							
							case 1:
							bgSprite.addChild(new Bush(j + 15, i));
							break;
								
							case 2:
							bgSprite.addChild(new Mountain(j + 15, i));
							break;
							
							case 3:
							bgSprite.addChild(new Water(j + 15, i));
							break;
						}
					}
				}
			}
			
			
			if (moveDir == "left") {
						
				for (var i:int = 0; i < Background["screen" + row + col].length; i++) {
					for (var j:int = 0; j < Background["screen" + row + col][i].length; j ++) {
						
						switch (Background["screen" + row + col][i][j]){
						
							case 0:
							bgSprite.addChild(new Sand(j - 15, i));
							break;
							
							case 1:
							bgSprite.addChild(new Bush(j - 15, i));
							break;
								
							case 2:
							bgSprite.addChild(new Mountain(j - 15, i));
							break;
							
							case 3:
							bgSprite.addChild(new Water(j - 15, i));
							break;
						} 
					}
				}
			}
			
			
			if (moveDir == "up") {
				
				for (var i:int = 0; i < Background["screen" + row + col].length; i++) {
					for (var j:int = 0; j < Background["screen" + row + col][i].length; j ++) {
						
						switch (Background["screen" + row + col][i][j]){
						
							case 0:
							bgSprite.addChild(new Sand(j, i - 10));
							break;
							
							case 1:
							bgSprite.addChild(new Bush(j, i - 10));
							break;
								
							case 2:
							bgSprite.addChild(new Mountain(j, i - 10));
							break;
							
							case 3:
							bgSprite.addChild(new Water(j, i - 10));
							break;
						} 
					}
				}
			}
			
			
			if (moveDir == "down") {
						
				for (var i:int = 0; i < Background["screen" + row + col].length; i++) {
					for (var j:int = 0; j < Background["screen" + row + col][i].length; j ++) {
						
						switch (Background["screen" + row + col][i][j]){
						
							case 0:
							bgSprite.addChild(new Sand(j, i  +10));
							break;
							
							case 1:
							bgSprite.addChild(new Bush(j, i + 10));
							break;
								
							case 2:
							bgSprite.addChild(new Mountain(j, i + 10));
							break;
							
							case 3:
							bgSprite.addChild(new Water(j, i + 10));
							break;
						} 
					}
				}
			}
		}
		
		
		
		
		
		
		
		public static function checkForDoor(evt:Event):void {
			
			if (Controls.areActive && Background.inTransition) {
				Background.inTransition = false;
			}
			
				
			// RIGHT
			
			if (Player.hero.x > Main.screenWidth - Player.hero.width/2) {
				
				moveDir = "right";
				inTransition = true;
				Controls.areActive = false;
				
				row++;
				buildScreen(col, row);				
				Background.bgSprite.setChildIndex(Player.hero, Background.bgSprite.numChildren - 1);
				
				var countRight:int = 0;
				Environment.stageRef.addEventListener(Event.ENTER_FRAME, moveScreenRight);
				function moveScreenRight(evt:Event) {
					
					countRight++;
					for (var i:int = 0; i < bgSprite.numChildren; i++) {
						bgSprite.getChildAt(i).x -= Player.speed * 2;
					}
					
					if (countRight >= 60) {
						Controls.areActive = true;
						Environment.stageRef.removeEventListener(Event.ENTER_FRAME, moveScreenRight);
						Environment.stageRef.addEventListener(Event.ENTER_FRAME, checkForDoor);
					}
				}
				
				Environment.stageRef.removeEventListener(Event.ENTER_FRAME, checkForDoor);
			}
			
			
			// LEFT
			
			if (Player.hero.x < - Player.hero.width/2) {
				
				moveDir = "left";
				inTransition = true;
				Controls.areActive = false;
				
				row--;
				buildScreen(col, row);
				Background.bgSprite.setChildIndex(Player.hero, Background.bgSprite.numChildren - 1);
				
				var countLeft:int = 0;
				Environment.stageRef.addEventListener(Event.ENTER_FRAME, moveScreenLeft);
				function moveScreenLeft(evt:Event) {
					
					countLeft++;
					for (var i:int = 0; i < bgSprite.numChildren; i++) {
						bgSprite.getChildAt(i).x += Player.speed * 2;
					}
					
					if (countLeft >= 60) {
						Controls.areActive = true;
						Environment.stageRef.removeEventListener(Event.ENTER_FRAME, moveScreenLeft);
						Environment.stageRef.addEventListener(Event.ENTER_FRAME, checkForDoor);
					}
				}
				
				Environment.stageRef.removeEventListener(Event.ENTER_FRAME, checkForDoor);
			}
			
			
			// DOWN
			
			if (Player.hero.y > Main.screenHeight - Player.hero.height/2) {
				
				moveDir = "down";
				inTransition = true;
				Controls.areActive = false;
				
				col++;
				buildScreen(col, row);
				Background.bgSprite.setChildIndex(Player.hero, Background.bgSprite.numChildren - 1);
				
				var countDown:int = 0;
				Environment.stageRef.addEventListener(Event.ENTER_FRAME, moveScreenDown);
				function moveScreenDown(evt:Event) {
					
					countDown++;
					for (var i:int = 0; i < bgSprite.numChildren; i++) {
						bgSprite.getChildAt(i).y -= Player.speed * 2;
					}
					
					if (countDown >= 40) {
						Controls.areActive = true;
						Environment.stageRef.removeEventListener(Event.ENTER_FRAME, moveScreenDown);
						Environment.stageRef.addEventListener(Event.ENTER_FRAME, checkForDoor);
					}
				}
				
				Environment.stageRef.removeEventListener(Event.ENTER_FRAME, checkForDoor);
			}
			
			
			// UP
			
			if (Player.hero.y < - Player.hero.height/2) {
				
				moveDir = "up";
				inTransition = true;
				Controls.areActive = false;
				
				col--;
				buildScreen(col, row);
				Background.bgSprite.setChildIndex(Player.hero, Background.bgSprite.numChildren - 1);
				
				var countUp:int = 0;
				Environment.stageRef.addEventListener(Event.ENTER_FRAME, moveScreenUp);
				function moveScreenUp(evt:Event) {
					
					countUp++;
					for (var i:int = 0; i < bgSprite.numChildren; i++) {
						bgSprite.getChildAt(i).y += Player.speed * 2;
					}
					
					if (countUp >= 40) {
						Controls.areActive = true;
						Environment.stageRef.removeEventListener(Event.ENTER_FRAME, moveScreenUp);
						Environment.stageRef.addEventListener(Event.ENTER_FRAME, checkForDoor);
					}
				}
				
				Environment.stageRef.removeEventListener(Event.ENTER_FRAME, checkForDoor);
			}
		}
	}
}
