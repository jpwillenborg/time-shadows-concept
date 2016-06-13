package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class Walls {
		
		static var blockHeight:uint;
		static var blockWidth:uint;
		static var numBlocks:uint;
		
		static var topBounds:uint;
		static var bottomBounds:uint;
		static var leftBounds:int;
		static var rightBounds:int;
		
		static var centerPt:uint;
		static var resetPt:uint;
		
		static var leftWall:Array = [];
		static var rightWall:Array = [];
		
		static var firstInLoop:int;
		static var lastInLoop:int;
		
		static var wallSpeed:uint;
		static var vertGap:uint;
		static var sideEdgeWidth:uint;
		
		
		static function setup(stage:Stage):void {
			
			// SET VARIABLES
			
			wallSpeed = 0;
			vertGap = 20;
			sideEdgeWidth = 80;
			
			var tempBlock = Atlas.generate("neon block");
			blockHeight = tempBlock.height;
			blockWidth = tempBlock.width;
			tempBlock = null;
			
			numBlocks = Math.ceil(Main.screenHeight / (blockHeight - vertGap)) + 2;
			firstInLoop = 0;
			lastInLoop = numBlocks - 1;
			
			topBounds = 0;
			bottomBounds = Main.screenHeight;
			leftBounds = - blockWidth + sideEdgeWidth;
			rightBounds = Main.screenWidth - sideEdgeWidth;
			centerPt = Main.screenWidth / 2;
			resetPt = bottomBounds + blockHeight;
			
			
			// GENERATE WALLS
			
			for (var i:int = 0; i < numBlocks; i++) {
				leftWall[i] = Atlas.generate("neon block");
				leftWall[i].x = leftBounds;
				leftWall[i].y = (i * blockHeight) - (i * vertGap);
				stage.addChild(leftWall[i]);
				
				rightWall[i] = Atlas.generate("neon block");
				rightWall[i].x = rightBounds;
				rightWall[i].y = (i * blockHeight) - (i * vertGap);
				stage.addChild(rightWall[i]);
			}
		}
		
		
		static function moveWallsDown(stage:Stage):void {
			
			if (Controls.gameIsOn) {
				for (var i:uint = 0; i < leftWall.length; i++) {
					leftWall[i].y += wallSpeed;
					rightWall[i].y += wallSpeed;
				}
				
				if (rightWall[lastInLoop].y >= resetPt) {
					
					leftWall[lastInLoop].y = leftWall[firstInLoop].y - blockHeight + vertGap;
					rightWall[lastInLoop].y = rightWall[firstInLoop].y - blockHeight + vertGap;
					
					leftWall[lastInLoop].x = leftBounds;
					rightWall[lastInLoop].x = rightBounds;
					
					firstInLoop--;
					lastInLoop--;
					
					if (firstInLoop < 0) {
						firstInLoop = rightWall.length - 1;
					}
					if (lastInLoop < 0) {
						lastInLoop = rightWall.length - 1;
					}
				}
			}
		}
		
		
		static function resetWalls() {
			for each(var id1:Image in Walls.leftWall) {
				id1.x = Walls.leftBounds;
			}
			for each(var id2:Image in Walls.rightWall) {
				id2.x = Walls.rightBounds;
			}
		}
	}
}
