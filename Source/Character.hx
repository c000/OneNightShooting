import flash.display.Bitmap;
import flash.display.Sprite;
import flash.Assets;
import flash.geom.Point;
import flash.events.Event;

class Character extends Sprite {
	public var radius : Int = 10;
	public function new () {
		super ();
	}

	public function getPoint () : Point {
		return new Point (x, y);
	}

	public function collideWith (other:Character) {
		var myPoint = getPoint ();
		var otherPoint = other.getPoint ();
		var sumRadius = radius + other.radius;
		if (Point.distance (myPoint, otherPoint) < sumRadius) {
			return true;
		} else {
			return false;
		}
	}
}
