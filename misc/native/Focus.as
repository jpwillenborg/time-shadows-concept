package  {
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import starling.display.Stage;
	
	
	public class Focus {


		static function setup(stage:Stage) {
			
			/*if (CONFIG::AIR) {
				Focus.setup(stage);
			}*/
			
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE , handleDeactivate, false, 0, true);
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate, false, 0, true);
			
			function handleDeactivate(event:Event):void {
				SoundChannelExample.channel.stop();
			}
			
			function handleActivate(event:Event):void {
				new SoundChannelExample(stage);
			}
			
		}
	}
}
