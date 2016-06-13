package  {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	
	
	public class BlockPulse extends Block {
		
		private var thisBlock;
		private var blockTween1:Tween;
		private var blockTween2:Tween;
		private var blockJuggler:Juggler;
		private var pulse:Boolean = false;
		
		
		public function BlockPulse(color:String, idX:int, idH:int) {
			
			super(color, idX, idH);
			
			thisBlock = this;
			
			blockTween1 = new Tween(thisBlock, .1, "easeOutQuad");
			blockTween2 = new Tween(thisBlock, .1, "easeInQuad");
			blockJuggler = new Juggler();
		}
		
		
		override public function loop(evt:EnterFrameEvent):void {
			
			y += Rhythm.speed;
			
			if (/*y > Main.screenHeight * 0.4 && */!pulse) {
				pulse = true;
				animateBlock();
			}
			
			
			// INTRO TRANSITION
			
			if (y <= Main.screenHeight * 0.25 && alpha < 100) {
				alpha += 0.25;
			}
			
			
			// EXIT TRANSITION
			
			if (y >= Main.screenHeight * 0.85) {
				alpha -= .05;
			}
			
			if (y > Main.screenHeight + height/2) {
				removeSelf();
			}
			
			
			// COLLISION DETECTION
			
			if (getBounds(parent).intersects(Controls.cursor.getBounds(Controls.cursor.parent))) {
				Environment.registerHit();
			}
			
			
			// ANIMATE BLOCKS
			
			advanceTime(evt.passedTime);
		}
		
		
		private function animateBlock() {
			
			var count = 0;
			blockLoop1();
			
			function blockLoop1() {
				blockTween1.reset(thisBlock, .1, "easeOutQuad");
				blockTween1.animate("scaleX", 1.1);
				blockTween1.animate("scaleY", 1.1);
				
				blockTween1.onComplete = blockLoop2;
				blockJuggler.add(blockTween1);
			}
			
			function blockLoop2() {
				blockTween2.reset(thisBlock, .1, "easeInQuad");
				blockTween2.animate("scaleX", 1);
				blockTween2.animate("scaleY", 1);
				
				blockTween2.onComplete = function() {
					count++;
					if (count < 3) {
						blockLoop1();
						blockTween1.delay = 0.1;
					}
				};
				blockJuggler.add(blockTween2);
				
				trace("done");

			}
		}
		
		
		private function advanceTime(passedTime:Number):void {
			if (blockJuggler != null) {
				blockJuggler.advanceTime(passedTime);
			}
		}

	}
}
