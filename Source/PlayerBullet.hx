import flash.display.Bitmap;
import flash.display.Sprite;
import flash.Assets;
import flash.geom.Point;
import flash.events.Event;

class PlayerBullet extends Character {
	private var moveSpeed:Float = 10;

	public function new (bornPosition:Point) {
		super ();

		addChild (new Bitmap (Assets.getBitmapData ("assets/bullet.png")));
		x = bornPosition.x;
		y = bornPosition.y;
		buttonMode = false;
		addEventListener (Event.ENTER_FRAME, onUpdate);
	}

	private function onUpdate (event) {
		y -= 10;
	}
}
