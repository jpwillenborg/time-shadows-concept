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
	
	
	public class IntroScreen {
		

		static function show(stage:Stage):void {
			
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
			
			var gameLogo = Atlas.generate("game logo");
			gameLogo.x = Main.screenWidth/2 - gameLogo.width/2;
			gameLogo.y = 220;
			stage.addChild(gameLogo);
			gameLogo.touchable = false;
			Environment.objList.push(gameLogo);
			
			//
			
			var startButton = stage.addChild(new Button(stage, "start", "intro"));
			startButton.x = Main.screenWidth/2 - startButton.width/2;
			startButton.y = Main.screenHeight * 0.59;
			
			//
			
			var resetButton = stage.addChild(new Button(stage, "reset", "intro"));
			resetButton.x = Main.screenWidth/2 - resetButton.width/2;
			resetButton.y = startButton.y + startButton.height;
			
			//
			
			// mute button code...
		}
	}
}
