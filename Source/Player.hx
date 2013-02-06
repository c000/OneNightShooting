import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;

class Player extends Sprite {
	public function new () {
		super ();

		addChild (new Bitmap (Assets.getBitmapData ("assets/player.png")));
		x = 100;
		y = 100;
		buttonMode = false;
	}
}
