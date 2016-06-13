package {
	
	import flash.events.Event;
	import flash.net.SharedObject;
	

	public class Data {
		
		static var mySave:SharedObject;
		static var saveObj:Object = {};
		
		
		static function setup() {
			mySave = SharedObject.getLocal("saveData");
			
			if (mySave.data.saveFile == undefined) {
				createSave();
			} else {
				restoreSave();
			}
			
			if (CONFIG::AIR) {
				Exit.setup();
			}
		}
		
		
		static function createSave() {
			
			// SETUP INITIAL STATS
			
			saveObj.hiScore = 0;
			
			
			// SAVE ALL DATA
			
			flushSave();
		}
		
		
		static function restoreSave() {
			saveObj = mySave.data.saveFile;
			flushSave();
		}
		
		
		static function flushSave() {
			mySave.data.saveFile = saveObj;
			mySave.flush();
		}
	}
}