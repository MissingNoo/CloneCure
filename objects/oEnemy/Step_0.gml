if (hp <= 0) {
	image_speed = 0;
	if (image_alpha == 1 and drop) {
		var xpobj = ds_queue_dequeue(GameData.xp_list);
		if (is_undefined(xpobj)) {
			instance_create_depth(x, y, depth, oXP, {xp: expvalue});
		} else {
			var xx = x
			var yy = y;
			var xpv = expvalue;
			with (xpobj) {
				x = xx;
				y = yy;
				disabled = false;
				xp = xpv;
				event_user(0);
				event_perform(ev_create, 0);
			}
		}
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
