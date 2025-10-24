if (hp <= 0) {
	image_speed = 0;
	if (image_alpha == 1 and drop) {
		instance_create_depth(x, y, depth, oXP, {xp: expvalue});
		global.events.broadcast("enemy_defeated", name);
	}
	image_alpha -= 0.05;
	x -= image_xscale;
	if (image_alpha <= 0) {
		instance_destroy();
	}
} else {
	image_alpha = lerp(image_alpha, 1, 0.1);
	step();
}
