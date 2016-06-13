package {
	
	import starling.display.Stage;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	import starling.display.Image;
	
	
	public class PlayScreen {
		
		static var scoreHeader:Image;
		static var score:TextField;
		
		
		static function show(stage:Stage):void {
			
			Environment.clearScreen(stage);
			Controls.setup(stage);
			
			//
			
			scoreHeader = Atlas.generate("score header");
			scoreHeader.x = 30;
			scoreHeader.y = 28;
			scoreHeader.touchable = false;
			stage.addChild(scoreHeader);
			Environment.objList.push(scoreHeader);
			scoreHeader.visible = false;
			
			//score = new TextField(500, 90, String(Score.addZeros(Score.currentScore)), "bmf", 90, 0xFFFFFF, false);
			score = new TextField(500, 90, String(Score.currentScore), "bmf", 90, 0xFFFFFF, false);
			score.hAlign = HAlign.CENTER;
			score.vAlign = VAlign.TOP;
			score.x = Main.screenWidth/2 - score.width/2; // 30;
			score.y = 20; // 48;
			score.touchable = false;
			stage.addChild(score);
			Environment.objList.push(score);
			//score.visible = false;
			
			/*score = new TextField(500, 80, String(Score.addZeros(Score.currentScore)), "bmf", 80, 0xFFFFFF, false);
			score.hAlign = HAlign.CENTER;
			score.vAlign = VAlign.TOP;
			score.x = Main.screenWidth/2 - score.width/2; // 30;
			score.y = 20; // 48;
			score.touchable = false;
			stage.addChild(score);
			Environment.objList.push(score);*/
			//score.visible = false;
			
			//
			
			// SHOW TUTORIAL FIRST
			
			//
			
			Audio.playIntro(stage);
		}
	}
}
