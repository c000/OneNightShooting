import flash.display.Bitmap;
import flash.display.Sprite;
import flash.Assets;
import flash.geom.Point;
import flash.events.Event;
import flash.media.Sound;

class Player extends Character {
	private var moveSpeed:Float = 10;
	private var shootSound:Sound;

	public function new () {
		super ();

		shootSound = Assets.getSound ("assets/hit01.mp3");
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
		shootSound.play ();
		return new PlayerBullet (new Point (x, y));
	}
}
