import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;
import nme.geom.Point;
import nme.events.Event;

class Player extends Character {
	private var moveSpeed:Float = 10;

	public function new () {
		super ();

		addChild (new Bitmap (Assets.getBitmapData ("assets/player.png")));
		x = 100;
		y = 100;
		buttonMode = false;
		addEventListener (Event.ENTER_FRAME, onUpdate);
	}

	public function moveTo (direction:Point) {
		direction.normalize (moveSpeed);
		x += direction.x;
		y += direction.y;
	}

	private function onUpdate (event) {
	}

	public function shoot () : PlayerBullet {
		return new PlayerBullet (new Point (x, y));
	}
}
