package  {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.*;
	import flash.events.Event;
	import flash.utils.*;
	
	
	public class Button extends Sprite {
		

		public function Button(stage:Stage, id:String, org:String) {
			
			addChild(Atlas.generate(id + " button"));
			
			Environment.objList.push(this);
			
			addEventListener(TouchEvent.TOUCH, buttonHit);
			function buttonHit(evt:TouchEvent):void {
				if (evt.getTouch(stage) != null && evt.getTouch(stage).phase == TouchPhase.BEGAN) {
					if (evt.getTouch(stage).phase == TouchPhase.BEGAN) {		
						
						if (id == "start") {
							PlayScreen.show(stage);
						}
						
						if (id == "reset") {
							ResetScreen.show(stage);
						}
						
						if (id == "yes") {
							if (org == "reset") {
								Score.hiScore = 0;
								Data.saveObj.hiScore = 0;
								Data.flushSave();
								IntroScreen.show(stage);
							}
							if (org == "over") {
								PlayScreen.show(stage);
							}
						}
						
						if (id == "no") {
							if (org == "reset") {
								IntroScreen.show(stage);
							}
							if (org == "over") {
								IntroScreen.show(stage);
							}
						}
					}
				}
			}
			
			
			addEventListener(Event.REMOVED_FROM_STAGE, clearOut);
			function clearOut(evt:Event):void {
				removeEventListener(Event.REMOVED_FROM_STAGE, clearOut);
				removeEventListener(TouchEvent.TOUCH, buttonHit);
			}
		}
	}
}
