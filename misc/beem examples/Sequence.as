package {
	
	import patterns.*;
	import starling.display.Sprite;
	import starling.display.Stage;
	
	
	public class Sequence {
		
		static var seq:Object = {};
		
		
		static function setup(stage:Stage):void {
			
			seq.p1 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p3 = {pattern: AccentHigh3A, color1: "blue", delay: 3, echo: true};
			seq.p5 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p7 = {pattern: End2, color1: "green", delay: 3 , echo: false};
			
			seq.p9 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p11 = {pattern: AccentLow5, color1: "yellow", delay: 0, echo: false};
			seq.p13 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p15 = {pattern: End2, color1: "green", delay: 3 , echo: false};
			
			seq.p17 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p19 = {pattern: AccentHigh3A, color1: "blue", delay: 3, echo: true};
			seq.p21 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p23 = {pattern: End2, color1: "green", delay: 3 , echo: false};
			
			seq.p25 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p27 = {pattern: AccentLow5, color1: "yellow", delay: 0, echo: false};
			seq.p29 = {pattern: MidReverb, color1: "blue", delay: 0, echo: true};
			seq.p31 = {pattern: End2, color1: "green", delay: 3 , echo: false};
			
		}
		
		
		static function doNext(stage:Stage) {
			
			//new AccentHigh3EchoOpen(stage, "blue", 0);
			
			if (seq["p" + Score.currentScore] != null) {
				
				new (seq["p" + Score.currentScore]["pattern"] as Class)(stage, seq["p" + Score.currentScore]["color1"], seq["p" + Score.currentScore]["delay"], seq["p" + Score.currentScore]["echo"]);
			
			}
			
			
			/*if (seq["p" + Score.currentScore] != null || seq["p" + Score.currentScore] != {}) {
				
				seqLength = 0;
				for each (var s:String in seq["p" + Score.currentScore]) {
					seqLength++;
				}
				
				
				if (seqLength == 3) {
					new (seq["p" + Score.currentScore]["pattern"] as Class)(stage, seq["p" + Score.currentScore]["color1"], seq["p" + Score.currentScore]["delay"]);
				}
				if (seqLength == 4) {
					new (seq["p" + Score.currentScore]["pattern"] as Class)(stage, seq["p" + Score.currentScore]["color1"], seq["p" + Score.currentScore]["color2"], seq["p" + Score.currentScore]["delay"]);
				}
			}*/
		}
	}
}