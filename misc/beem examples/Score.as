package  {
	
	import starling.display.Stage;
	import starling.text.TextField;
	
	
	public class Score {
		
		static var currentScore:int;
		static var hiScore:int;
		
		
		static function setup(stage:Stage):void {
			currentScore = 0;
			hiScore = Data.saveObj.hiScore;
		}
		
		
		static function update(stage:Stage):void {
			currentScore++;
			if (currentScore >= hiScore) {
				hiScore = currentScore;
				Data.saveObj.hiScore = currentScore;
			}
		}
		
		
		static function addZeros(id:uint):String {
			var scoreString:String = String(id);
			for(var i:uint = 5 - scoreString.length; i > 0; i--) {
				scoreString = "0" + scoreString;
			}
			return scoreString;
		}
		
		
		static function moveToFront(stage:Stage):void {
			stage.setChildIndex(PlayScreen.scoreHeader, stage.numChildren - 1);
			stage.setChildIndex(PlayScreen.score, stage.numChildren - 1);
		}
	}
}
