package projectile.rocket;

import flixel.group.FlxGroup;
import flixel.math.FlxPoint;

class Rocket extends Projectile {
	private static var ACCEL = 1500;
	private static var ROCKET_GRAPHIC:String = AssetPaths.rocket__png;

	public var explosion:Explosion;

	override public function new() {
		explosion = new Explosion();
		super(ROCKET_GRAPHIC);
	}

	override public function fire(startPoint:FlxPoint, aimDegrees:Float) {
		super.fire(startPoint, aimDegrees);
		var baseAccel = FlxPoint.weak(1, 0);
		acceleration = baseAccel.rotateByDegrees(aimDegrees).scale(ACCEL);
	}

	override public function impact(surface:String) {
		explosion.fire(this.getMidpoint(), 0);
		kill();
	}

	public function getObjectBundle() {
		var group = new FlxGroup();
		group.add(this);
		group.add(explosion);
		return group;
	}
}
