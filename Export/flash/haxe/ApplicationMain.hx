#if nme

import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new NMEPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		#if !fdb
		haxe.Log.trace = flashTrace;
		#end
		
		if (call_real)
			begin ();
	}

	#if !fdb
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;
		
        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	#end
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, nme.display.DisplayObject)) {
				nme.Lib.current.addChild(cast instance);
			}	
		}
		
	}

	static function onEnter (_) {
		
		var loaded = nme.Lib.current.loaderInfo.bytesLoaded;
		var total = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="assets/bg13.png")
			 
            return Assets.getBitmapData ("assets/bg13.png");
         
		
		if (inName=="assets/bg5.png")
			 
            return Assets.getBitmapData ("assets/bg5.png");
         
		
		if (inName=="assets/bg9.png")
			 
            return Assets.getBitmapData ("assets/bg9.png");
         
		
		if (inName=="assets/bg10.png")
			 
            return Assets.getBitmapData ("assets/bg10.png");
         
		
		if (inName=="assets/bg7.png")
			 
            return Assets.getBitmapData ("assets/bg7.png");
         
		
		if (inName=="assets/bg6.png")
			 
            return Assets.getBitmapData ("assets/bg6.png");
         
		
		if (inName=="assets/bg11.png")
			 
            return Assets.getBitmapData ("assets/bg11.png");
         
		
		if (inName=="assets/enemy.png")
			 
            return Assets.getBitmapData ("assets/enemy.png");
         
		
		if (inName=="assets/bullet.png")
			 
            return Assets.getBitmapData ("assets/bullet.png");
         
		
		if (inName=="assets/bg8.png")
			 
            return Assets.getBitmapData ("assets/bg8.png");
         
		
		if (inName=="assets/bang.png")
			 
            return Assets.getBitmapData ("assets/bang.png");
         
		
		if (inName=="assets/bg12.png")
			 
            return Assets.getBitmapData ("assets/bg12.png");
         
		
		if (inName=="assets/player.png")
			 
            return Assets.getBitmapData ("assets/player.png");
         
		
		if (inName=="assets/bg3.png")
			 
            return Assets.getBitmapData ("assets/bg3.png");
         
		
		if (inName=="assets/bg2.png")
			 
            return Assets.getBitmapData ("assets/bg2.png");
         
		
		if (inName=="assets/bg4.png")
			 
            return Assets.getBitmapData ("assets/bg4.png");
         
		
		if (inName=="assets/bg16.png")
			 
            return Assets.getBitmapData ("assets/bg16.png");
         
		
		if (inName=="assets/bg14.png")
			 
            return Assets.getBitmapData ("assets/bg14.png");
         
		
		if (inName=="assets/bg1.png")
			 
            return Assets.getBitmapData ("assets/bg1.png");
         
		
		if (inName=="assets/bg15.png")
			 
            return Assets.getBitmapData ("assets/bg15.png");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}

class NME_assets_bg13_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg5_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg9_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg10_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg7_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg6_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg11_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_enemy_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bullet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg8_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bang_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg12_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_player_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg3_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg4_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg14_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg1_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bg15_png extends nme.display.BitmapData { public function new () { super (0, 0); } }


#else

import Main;

class ApplicationMain {
	
	public static function main () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
		
	}

}

#end
