package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class AutoWallMove {
		
		static var stage:Stage;
		static var mixTimer:Timer;
		static var num:uint = 4;
		static var spd:uint = 9;

		
		static function setup(id:Stage) {
			
			stage = id;
			mixTimer = new Timer(2000);
			mixTimer.start();	
			mixTimer.addEventListener(TimerEvent.TIMER, mix);
		}
		
		
		static function mix(event:TimerEvent) {
			var randNum:uint = int(Math.random() * 3);
			
			if (randNum == 0) {
				RightOutStop.go(stage, num, spd);
			}
			if (randNum == 1) {
				LeftOutStop.go(stage, num, spd);
			}
			if (randNum == 2) {
				LeftOutStop.go(stage, num, spd);
				RightOutStop.go(stage, num, spd);
			}
		}
	}
}
