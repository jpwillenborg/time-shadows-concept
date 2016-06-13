package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		static var state:String = "none";
		
		
		public function Main() {
			
			tileGround.addEventListener(MouseEvent.MOUSE_DOWN, tileGroundClick);
			function tileGroundClick(evt:MouseEvent) {
				state = "ground";				
			}
			
			tileMountain.addEventListener(MouseEvent.MOUSE_DOWN, tileMountainClick);
			function tileMountainClick(evt:MouseEvent) {
				state = "mountain";
			}
			
			tileBush.addEventListener(MouseEvent.MOUSE_DOWN, tileBushClick);
			function tileBushClick(evt:MouseEvent) {
				state = "bush";
			}
			
			tileWater.addEventListener(MouseEvent.MOUSE_DOWN, tileWaterClick);
			function tileWaterClick(evt:MouseEvent) {
				state = "water";
			}
			
			tileSand.addEventListener(MouseEvent.MOUSE_DOWN, tileSandClick);
			function tileSandClick(evt:MouseEvent) {
				state = "sand";
			}
			
			tileNone.addEventListener(MouseEvent.MOUSE_DOWN, tileNoneClick);
			function tileNoneClick(evt:MouseEvent) {
				state = "none";
			}
		}
	}
	
}
