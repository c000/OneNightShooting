import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;
import nme.geom.Point;
import nme.events.Event;

class Enemy extends Character {
	public function new (bornX:Int) {
		super ();

		addChild (new Bitmap (Assets.getBitmapData ("assets/enemy.png")));
		x = bornX;
		y = 0;
		buttonMode = false;
		addEventListener (Event.ENTER_FRAME, onUpdate);
	}

	private function onUpdate (event) {
		y += 2;
	}
}
