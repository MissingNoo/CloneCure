direction = random(360);
speed = 1;
near = undefined;
join = new air_timer(180, method(self, function() {
	var xx = x, yy = y;
	x += 10000;
	y += 10000;
	near = instance_nearest(xx, yy, oXP);
	x -= 10000;
	y -= 10000;
	if (near.sprite_index != sXPMagnet and !near.following and distance_to_object(near) < 40) {
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
	[sXP6, 200, infinity],
]

for (var i = 0; i < array_length(range); i++) {
	if (in_range(xp, range[i][1], range[i][2])) {
		sprite_index = range[i][0];
	}
}

if (irandom_range(0, 3000) == 1) {
	sprite_index = sXPMagnet; //TODO: double if got super study glasses
}
xrot = -90;
yrot = -90;
zrot = -90;