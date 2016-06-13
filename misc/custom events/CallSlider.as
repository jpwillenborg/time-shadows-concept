package  {
	
	import starling.events.Event;
	
	public class CallSlider {

		
		public function CallSlider() {
			var mySlider:Slider = new Slider();
			mySlider.addEventListener("ready", onObjectReady);
		}
		
		
		private function onObjectReady(e:Event, id):void {
			trace(id + " was called");
		}
	}
}
