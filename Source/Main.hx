import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Assets;
import flash.Lib;
import flash.ui.Keyboard;
import flash.geom.Point;
import flash.text.TextField;

class Main extends Sprite {
	
	private var player        : Player;
	private var playerBullets : Array<PlayerBullet>;
	private var enemyList     : Array<Enemy>;
	private var debugText     : TextField;

	private var movingDown  : Bool;
	private var movingLeft  : Bool;
	private var movingRight : Bool;
	private var movingUp    : Bool;
	private var shooting    : Bool;
	
	public function new () {
		super ();
		player = new Player ();
		addChild (player);

		playerBullets = new Array ();
		enemyList = new Array ();

		Lib.current.stage.addEventListener (KeyboardEvent.KEY_DOWN, stage_onKeyDown);
		Lib.current.stage.addEventListener (KeyboardEvent.KEY_UP, stage_onKeyUp);
		Lib.current.stage.addEventListener (Event.ENTER_FRAME, this_onEnterFrame);
	}
	
	private function stage_onKeyDown (event:KeyboardEvent):Void {
		switch (event.keyCode) {
			case Keyboard.DOWN: movingDown = true;
			case Keyboard.LEFT: movingLeft = true;
			case Keyboard.RIGHT: movingRight = true;
			case Keyboard.UP: movingUp = true;
			case Keyboard.Z: shooting = true;
		}
	}
	
	private function stage_onKeyUp (event:KeyboardEvent):Void {
		switch (event.keyCode) {
			case Keyboard.DOWN: movingDown = false;
			case Keyboard.LEFT: movingLeft = false;
			case Keyboard.RIGHT: movingRight = false;
			case Keyboard.UP: movingUp = false;
			case Keyboard.Z: shooting = false;
		}
	}
	
	private function this_onEnterFrame (event:Event):Void {
		movePlayer ();
		shootPlayer ();
		spawnEnemy ();
		collideEnemy ();
	}

	private function movePlayer () {
		var direction = new Point ();
		if (movingDown) {
			direction.y += 1;
		}
		if (movingLeft) {
			direction.x -= 1;
		}
		if (movingRight) {
			direction.x += 1;
		}
		if (movingUp) {
			direction.y -= 1;
		}
		player.moveTo (direction);
	}

	private function shootPlayer () {
		if (shooting) {
			var bullet = player.shoot();
			addChild (bullet);
			playerBullets.push (bullet);
		}
	}

	private function spawnEnemy () {
		if (Std.random (10) < 1) {
			var enemy = new Enemy (Std.random (800));
			addChild (enemy);
			enemyList.push (enemy);
		}
	}

	private function collideEnemy () {
		for (b in playerBullets) {
			var hitted = false;
			for (e in enemyList) {
				if (b.collideWith (e)) {
					playerBullets.remove (b);
					removeChild (b);
					enemyList.remove (e);
					removeChild (e);
					hitted = true;
				}
			}
			if (hitted == true) {
				continue;
			}
		}
	}
}
