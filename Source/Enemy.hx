import flash.display.Bitmap;
import flash.display.Sprite;
import flash.Assets;
import flash.geom.Point;
import flash.events.Event;

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
