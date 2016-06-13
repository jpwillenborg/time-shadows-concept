package {
	
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import starling.display.Stage;
	
	
	public class Audio {
				
		static var introSound:Intro;
		static var introChannel:SoundChannel;
		static var loopSound:Soundtrack;
		static var loopChannel:SoundChannel;
		static var loopTransform:SoundTransform;
		static var hasStarted:Boolean = false;
		

		static function setup(stage:Stage) {
			introSound = new Intro();
			introChannel = new SoundChannel();
			
			loopSound = new Soundtrack();
			loopChannel = new SoundChannel();
			
			loopTransform = new SoundTransform();
			loopTransform.volume = 1.0; // 0.05;
		}
		
		
		static function playIntro(stage:Stage):void {
			introChannel = introSound.play(1000, 0, loopTransform); // 0
			
			introChannel.addEventListener(Event.SOUND_COMPLETE, introCompleteHandler);
			function introCompleteHandler(evt:Event):void {
				introChannel.removeEventListener(Event.SOUND_COMPLETE, introCompleteHandler);
				playLoop(stage);
			}
		}
		
		
		static function playLoop(stage:Stage):void {
			loopChannel = loopSound.play(0, 1978, loopTransform);
			Rhythm.metro.start();
			
			hasStarted = true;
			if(!Controls.cursorDown) {
				Environment.registerHit();
			}
			
			loopChannel.addEventListener(Event.SOUND_COMPLETE, soundtrackCompleteHandler);
			function soundtrackCompleteHandler(evt:Event):void {
				loopChannel.removeEventListener(Event.SOUND_COMPLETE, soundtrackCompleteHandler);
			}
		}
	}
}