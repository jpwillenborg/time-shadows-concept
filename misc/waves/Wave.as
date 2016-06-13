package  {
	
	import starling.display.Stage;
	import starling.events.*;
	import starling.display.Image;
	
	
	public class Wave {
		
		static var stage:Stage;
		static var speed:int;
		static var waveList:Array;
		static var speedList:Array;
		static var moveList:Array;
		static var numWaves:uint;
		static var highLimit:int;
		static var highVal:uint;
		static var started:Boolean;
		
		
		static function go(id:Stage, num:uint) {
			stage = id;
			speed = 7;
			numWaves = num;
			waveList = [];
			speedList = [];
			moveList = [];
			highLimit = Main.screenHeight;
			highVal = 0;
			started = false;
			
			for (var i:int = 0; i < Walls.numBlocks; i++) {
				if (Walls.leftWall[i].y < highLimit) {
					highLimit = Walls.leftWall[i].y;
					highVal = i;
				}
			}
			
			for (var j:int = 0; j < numWaves; j++) {
				waveList.push(Walls.leftWall[highVal]);
				speedList.push(speed);
				moveList.push(false);
				highVal++;
				if (highVal > Walls.numBlocks - 1) {
					highVal = 0;
				}
			}
			
			stage.addEventListener(Event.ENTER_FRAME, checkWave);
		}
		
		
		static function checkWave(evt:Event) {
			trace(waveList[0].y);
			if (waveList[0].y >= -100) {
				moveList[0] = true;
				stage.removeEventListener(Event.ENTER_FRAME, checkWave);
				stage.addEventListener(Event.ENTER_FRAME, wave);
			}
		}
		
		
		static function wave(evt:Event):void {
			
			for (var i:int = 0; i < waveList.length; i++) {
				
				if (i > 0 && waveList[i - 1].x > Walls.leftBounds + 70) {
					moveList[i] = true;
				}

				if (moveList[i]) {
					
					waveList[i].x += speedList[i];
					
					if (waveList[i].x >= Walls.centerPt - waveList[i].width) {
						waveList[i].x = Walls.centerPt - waveList[i].width;
						speedList[i] *= -1;
					} else if (waveList[i].x <= Walls.leftBounds) {					
						waveList[i].x = Walls.leftBounds;
						speedList[i] = 0;
						
						// finish
						if (i == waveList.length - 1) {
							stage.removeEventListener(Event.ENTER_FRAME, wave);
							stage.addEventListener(TouchEvent.TOUCH, Controls.screenHit);
						}
					}
				}
				
				
				if (waveList[i].y >= Walls.bottomBounds) {
					waveList.pop();
					trace(i);
				}
			}			
		}
		
		
	}
}
