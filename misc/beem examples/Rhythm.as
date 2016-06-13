package  {
	
	import flash.media.Sound;
	import flash.utils.*;
	import utils.metronome.*;
	import patterns.*;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class Rhythm {

		static var metro:Metronome;
		static var rhythmBeat:uint = 1;
		static var speed:uint = 8;
		
		
		static function setup(stage:Stage): void {
			
			metro = new Metronome();
			metro.interval = 1000;
			metro.volume = 0;
			metro.maxTickCount = 0;
			metro.addEventListener(MetronomeEvent.TICK, onTick);
			metro.addEventListener(MetronomeEvent.STOP, onTick);
			 
			
			function onTick(evt:MetronomeEvent):void {
				Score.update(stage);
				//PlayScreen.score.text = String(Score.addZeros(Score.currentScore));
				PlayScreen.score.text = String(Score.currentScore);
			
				Sequence.doNext(stage);
			}
		}
	}
}
