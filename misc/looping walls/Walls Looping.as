package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	import flash.events.Event;
	import flash.utils.*;
	
	
	public class Walls {
		
		static var barHeight:int = 182;
		static var barWidth:int = 272;
		static var blockList1:Array = [];
		static var blockList2:Array = [];
		static var wallSpeed:int = 4;
		static var barSpeed:int = 12;
		static var firstInLoop:int;
		static var lastInLoop:int;
		static var blockIsMoving:Boolean = false;
		static var blockHasFlipped:Boolean = false;
		
		static var block:Image;
		static var blockInt:int;
		
		static var checkList:Array = [];
		
		
		static function setup(stage:Stage) {			
			
			// WALLS
			
			for (var i:int = 0; i < Math.ceil(Main.screenHeight / barHeight) + 2; i++) {
				blockList1[i] = Atlas.generate("neon bar");
				blockList1[i].x = -65 - 140;
				blockList1[i].y = 0 + (i * barHeight);
				stage.addChild(blockList1[i]);
			}
			
			for (var j:int = 0; j < Math.ceil(Main.screenHeight / barHeight) + 2; j++) {
				blockList2[j] = Atlas.generate("neon bar");
				blockList2[j].x = Main.screenWidth - barWidth + 65 + 140;
				blockList2[j].y = 0 + (j * barHeight);
				stage.addChild(blockList2[j]);
			}
			
			firstInLoop = 0;
			lastInLoop = blockList1.length - 1;
			
			
			// BLOCKS
			
			block = Atlas.generate("neon block");
			block.x = 0;
			block.y = - block.height + 12;
			stage.addChild(block);
			
			setupBlock(stage);
			
			
			// COLLISION CHECKLIST
			
			for each (var id1 in blockList1) {
				checkList.push(id1);
			}
			for each (var id2 in blockList2) {
				checkList.push(id2);
			}
			checkList.push(block);
			
		}
		
		
		static function moveWalls(stage:Stage) {
			
			for each (var id1 in blockList1) {
				id1.y += wallSpeed;
			}
			for each (var id2 in blockList2) {
				id2.y += wallSpeed;
			}
			
			if (blockList1[lastInLoop].y >= Main.screenHeight + barHeight) {
				blockList1[lastInLoop].y = blockList1[firstInLoop].y - barHeight;
				blockList2[lastInLoop].y = blockList2[firstInLoop].y - barHeight;
				
				firstInLoop--;
				lastInLoop--;
				
				if (firstInLoop < 0) {
					firstInLoop = blockList1.length - 1;
				}
				
				if (lastInLoop < 0) {
					lastInLoop = blockList1.length - 1;
				}
			}
		}
		
		
		static function checkBar(stage:Stage) {
			moveBar(stage, blockList1[firstInLoop]);
		}
		
		
		static function moveBar(stage:Stage, id:Image) {
			blockIsMoving = true;
			
			stage.addEventListener(Event.ENTER_FRAME, move);
			function move(evt:Event) {
				
				if (id.x < -65 - 140) {
					id.x = -65 - 140;
					barSpeed *= -1;
					blockIsMoving = false;
					stage.removeEventListener(Event.ENTER_FRAME, move);
					stage.addEventListener(TouchEvent.TOUCH, Controls.screenHit);
				} else {
					if (blockIsMoving) {
						id.x += barSpeed;
					}
				}
				
				if (id.x >= Main.screenWidth - barWidth + 65 + 140 - barWidth + 24) {
					id.x = Main.screenWidth - barWidth + 65 + 140 - barWidth + 24;
					barSpeed *= -1;
				}
			}
		}
		
		
		static function setupBlock(stage:Stage) {
			block.x = (Math.random() * (Main.screenWidth / 2)) + (Main.screenWidth / 4) - block.width/2;
		}
		
		
		static function moveBlock(stage:Stage) {
			block.y += wallSpeed;
			
			if (block.y >= Main.screenHeight) {
				block.y = blockList1[firstInLoop].y;
				setupBlock(stage);
			}
		}
	}
}
