package {
	
	import starling.display.Image;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	
	public class OverScreen {
		

		static function show(stage:Stage):void {
			stage.removeEventListener(TouchEvent.TOUCH, Controls.screenHit);			
			
			Data.flushSave();
			Score.currentScore = -1;
			
			if (Rhythm.metro) {
				Rhythm.metro.stop();
				Rhythm.rhythmBeat = 1;
				
				Audio.hasStarted = false;
				
				Audio.loopChannel.stop();
				Audio.introChannel.stop();
			}
			
			Environment.clearScreen(stage);
			
			//
			
			/*var hiScoreHeader = Atlas.generate("hi score header");
			hiScoreHeader.x = 30;
			hiScoreHeader.y = 28;
			hiScoreHeader.touchable = false;
			stage.addChild(hiScoreHeader);
			Environment.objList.push(hiScoreHeader);*/
			
			var hiScore = new TextField(500, 90, String(Score.hiScore), "bmf", 90, 0xFFFFFF, false);
			hiScore.hAlign = HAlign.CENTER;
			hiScore.vAlign = VAlign.TOP;
			hiScore.x = Main.screenWidth/2 - hiScore.width/2; // 30;
			hiScore.y = 20; // 48;
			hiScore.touchable = false;
			stage.addChild(hiScore);
			Environment.objList.push(hiScore);
			
			//
			
			var optionsText = new TextField(500, 400, "GAME OVER\nAGAIN?", "bmf", 80, 0xFFFFFF, false);
			optionsText.hAlign = HAlign.CENTER;
			optionsText.vAlign = VAlign.TOP;
			optionsText.x = Main.screenWidth/2 - optionsText.width/2;
			optionsText.y = Main.screenHeight * 0.30;
			optionsText.touchable = false;
			stage.addChild(optionsText);
			Environment.objList.push(optionsText);
			
			//
			
			var yesButton = stage.addChild(new Button(stage, "yes", "over"));
			yesButton.x = Main.screenWidth/2 - yesButton.width/2;
			yesButton.y = Main.screenHeight * 0.59;
			
			//
			
			var noButton = stage.addChild(new Button(stage, "no", "over"));
			noButton.x = Main.screenWidth/2 - noButton.width/2;
			noButton.y = yesButton.y + yesButton.height;
			
		}
	}
}
