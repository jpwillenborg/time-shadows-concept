package  {
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	
	
	public class Exit {


		static function setup() {
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, flushSave);
			NativeApplication.nativeApplication.addEventListener(Event.EXITING, flushSave);
		}
		
		
		static function flushSave(evt:Event):void {
			Data.flushSave();
		}

	}
	
}
