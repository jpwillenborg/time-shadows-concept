package  {
	
	import starling.animation.Transitions;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.TouchEvent;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	
	public class Environment {
		
		[Embed(source="../assets/bmf.fnt", mimeType="application/octet-stream")]
		public static const bmfXml:Class;
		static var objList:Array = [];
		static var stageRef:Stage;
		
		
		static function setup(stage:Stage):void {
			
			// SETUP TEXTURE ATLAS
			
			stageRef = stage;
			Atlas.setup();
			
			
			// SETUP SAVE FILE
			
			Data.setup();
			
			
			// SETUP SCORE
			
			Score.setup(stage);
			
			
			// SETUP AUDIO
			
			Audio.setup(stage);	
			Rhythm.setup(stage);
			
			
			// SETUP SEQUENCE
			
			Sequence.setup(stage);
			
			
			// SETUP BACKGROUND
			
			var tile:Image = Atlas.generate("floor tile");
			var tileWidth = tile.width;
			var tileHeight = tile.height;
			tile.dispose();
			tile = null;
			
			var floorSprite:Sprite = new Sprite();
			stage.addChild(floorSprite);
			
			for (var i:int = 0; i < Math.ceil(Main.screenWidth / tileWidth); i++) {
				for (var j:int = 0; j < Math.ceil(Main.screenHeight / tileHeight); j++) {
					floorSprite.addChild(Atlas.generate("floor tile"));
					floorSprite.getChildAt(floorSprite.numChildren - 1).x = i * tileWidth;
					floorSprite.getChildAt(floorSprite.numChildren - 1).y = j * tileHeight;
				}
			}
			
			floorSprite.flatten();

			
			// REGISTER BITMAP FONT
			
			var bmfTexture:Texture = Atlas.atlas.getTexture("bmf");
			var bmfXML:XML = XML(new bmfXml());
			TextField.registerBitmapFont(new BitmapFont(bmfTexture, bmfXML));
			
			
			// REGISTER EASING TRANSITIONS
			
			Transitions.register("easeInQuad", registerEaseInQuad);
			function registerEaseInQuad(ratio:Number):Number {
				return ratio * ratio;
			}
			
			Transitions.register("easeOutQuad", registerEaseOutQuad);
			function registerEaseOutQuad(ratio:Number):Number {
				var invRatio = ratio - 1.0;
				return 1 - (invRatio * invRatio);
			}
		}
		
		
		static function registerHit():void {
			//OverScreen.show(stageRef);
		}
		
		
		static function clearScreen(stage:Stage):void {
			for (var i:int = objList.length-1; i >=0; i--) {
				stage.removeChild(objList[i]);
				objList[i].dispose();
				objList.pop();
			}
		}
	}
}
