package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Tile extends MovieClip {

		public function Tile() {
			
			addEventListener(MouseEvent.CLICK, change);
			function change(evt:MouseEvent) {
				
				if (Main.state == "ground") {
					removeChildAt(0);
					addChild(new Ground());
				}
				
				if (Main.state == "mountain") {
					removeChildAt(0);
					addChild(new Mountain());
				}
				
				if (Main.state == "bush") {
					removeChildAt(0);
					addChild(new Bush());
				}
				
				if (Main.state == "water") {
					removeChildAt(0);
					addChild(new Water());
				}
				
				if (Main.state == "sand") {
					removeChildAt(0);
					addChild(new Sand());
				}
				
				if (Main.state == "none") {
					removeChildAt(0);
					addChild(new None());
				}
			}
			
			
		}

	}
	
}
