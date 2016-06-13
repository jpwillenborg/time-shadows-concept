package  {
	
	import starling.display.Stage;
	import starling.events.*;
	import starling.display.Image;
	
	
	public class Wave {
		
		static var stage:Stage;
		static var speed:int = 10;
		static var waveList:Array = [];
		static var speedList:Array = [];
		static var numWaves:uint = 5;
		static var highLimit:int = Main.screenHeight;
		static var highVal:uint = 0;
		static var started:Boolean = false;
		
		
		static function go(id:Stage) {
			stage = id;
			waveList = [];
			speedList = [];
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
				highVal++;
				if (highVal > Walls.numBlocks - 1) {
					highVal = 0;
				}
			}
			
			stage.addEventListener(Event.ENTER_FRAME, checkWave);
			stage.addEventListener("startNextWave", nextWave);
		}
		
		
		static function checkWave(evt:Event) {
			if (waveList[0].y >= 20) {
				stage.removeEventListener(Event.ENTER_FRAME, checkWave);
				stage.addEventListener(Event.ENTER_FRAME, wave);
			}
		}
		
		
		static function nextWave(evt:Event, id:String):void {
			trace("called once");
			stage.removeEventListener("startNextWave", nextWave);
		}
		
		
		static function wave(evt:Event):void {
			
			waveList[0].x += speedList[0];
			
			if (waveList[0].x >= Walls.leftBounds + 100) {
				stage.dispatchEventWith("startNextWave", true, "new param");
			}
			
			
			/*waveList[id].x += speedList[id];
			
			if (waveList[id].x >= Walls.centerPt - waveList[id].width) {
				waveList[id].x = Walls.centerPt - waveList[id].width;
				speedList[id] *= -1;
			} else if (waveList[id].x <= Walls.leftBounds) {
				waveList[id].x = Walls.leftBounds;
				speedList[id] = 0;
				if (id == numWaves - 1) {
					trace("reset");
					started = false;
				}
			}*/
			
		}
		
		
		
		
		
	}
}
