package  {
	
	import starling.events.*;
	import flash.utils.*;
	
	
	public class Slider extends EventDispatcher {
		
		static var myInt:uint;
		
		
		public function Slider() {
			myInt = setInterval(determineReadiness, 1000);
		}
		
		
		private function determineReadiness():void {
			//myInt = clearInterval();
			dispatchEventWith("ready", true, "new param");
		}
	}
}
