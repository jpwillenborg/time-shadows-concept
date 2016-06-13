package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	import starling.events.TouchEvent;
	
	
	public class Walls {
		
		static var numWalls:int;
		static var wallHeight:int;
		static var wallList1:Array = [];
		static var wallList2:Array = [];
		static var wallSpeed1:Array = [];
		static var wallSpeed2:Array = [];
		static var wallGo:Array = [];
		static var fmCount:int = 0;
		static var goCount:int = 0;
		static var moving:Boolean = false;
		
		
		static function setup(stage:Stage) {			
			
			wallHeight = 55;
			numWalls = Math.ceil(Main.screenHeight / wallHeight);
			
			for (var i:int = 0; i < numWalls; i++) {
				wallList1[i] = Atlas.generate("neon bar thin");
				wallList1[i].x = - wallList1[i].width + wallList1[i].height;
				wallList1[i].y = i * wallHeight;
				stage.addChild(wallList1[i]);
				
				wallList2[i] = Atlas.generate("neon bar thin");
				wallList2[i].x = Main.screenWidth - wallList2[i].height;
				wallList2[i].y = i * wallHeight;
				stage.addChild(wallList2[i]);
			}
			
			for (var j:int = 0; j < numWalls; j++) {
				wallSpeed1[j] = 5;
				wallSpeed2[j] = -5;
			}
		}
		
		
		static function move(stage:Stage) {
			
			if (moving) {
			
				fmCount++;
				
				if (fmCount == 8) {
					fmCount = 0;
					goCount++;
				}
				 if (goCount >= numWalls) {
					goCount = numWalls;
				 }
			
				 
				for (var i:int = 0; i < goCount; i++) {
					
					wallList1[i].x += wallSpeed1[i];
					wallList2[i].x += wallSpeed2[i];
					
					
					if (wallList1[i].x >= -100) {
						wallSpeed1[i] *= -1;
					}
					if (wallList1[i].x <= - wallList1[i].width + wallList1[i].height) {
						wallSpeed1[i] *= 0;
					}
					
					if (wallList2[i].x <= Main.screenWidth - wallList2[i].width + 100) {
						wallSpeed2[i] *= -1;
					}
					if (wallList2[i].x >= Main.screenWidth - wallList2[i].height) {
						wallSpeed2[i] *= 0;
						
						if (i == goCount - 1) {
							moving = false;
							goCount = 0;
							fmCount = 0;
							
							for (var j:int = 0; j < numWalls; j++) {
								wallSpeed1[j] = 5;
								wallSpeed2[j] = -5;
							}
							
							stage.addEventListener(TouchEvent.TOUCH, Controls.screenHit);
						}
					}
				}
			}
			
		}
	}
}
