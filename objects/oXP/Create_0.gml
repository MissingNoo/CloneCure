direction = random(360);
speed = spd;
near = undefined;
join = new air_timer(180, method(self, function() {
	if (sprite_index == sXPMagnet) {
		exit;
	}
	var xx = x, yy = y;
	x += 10000;
	y += 10000;
	near = instance_nearest(xx, yy, oXP);
	x -= 10000;
	y -= 10000;
	if (
		near.sprite_index != sXPMagnet
		&& !near.disabled
		&& !near.following
		&& distance_to_object(near) < 40
	) {
		following = true;
		direction = point_direction(x, y, near.x, near.y);
		speed = 1;
		near.following = true;
		near.direction = point_direction(near.x, near.y, x, y);
		near.speed = 1;
	}
}));

range = [
	[sXP, 1, 10],
	[sXP2, 11, 19],
	[sXP3, 20, 49],
	[sXP4, 50, 99],
	[sXP5, 100, 199],
	[sXP6, 200, infinity]
];

for (var i = 0; i < array_length(range); i++) {
	if (in_range(xp, range[i][1], range[i][2])) {
		sprite_index = range[i][0];
	}
}
var rnd_range = player_have_item("Super_Study_Glasses") ? 1500 : 3000;
if (irandom_range(0, rnd_range) == 1) {
	sprite_index = sXPMagnet;
}
magnetized = false;
