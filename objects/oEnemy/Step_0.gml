if (GameData.hp <= 0) {
	image_speed = lerp(image_speed, 0, 0.01);
	speed = lerp(speed, 0, 0.01);
	exit;
}
//occluder.x = x;
//occluder.y = y;
for (var i = 0; i < array_length(buffs); i++) {
	buffs[i].step();
}
if (hp <= 0) {
	image_speed = 0;
	if (image_alpha == 1) {
		var p = part_system_create(part_saved);
		part_system_position(p, x, y - (sprite_height / 2));
	}
	if (image_alpha == 1 and drop) {
		xps = (miniboss or boss) ? irandom_range(5, 10) : 1;
		repeat (xps) {
			spawn_xp(expvalue / xps);
		}
		global.events.broadcast("enemy_defeated", name);
	}
	image_alpha -= 0.05;
	x -= image_xscale;
	if (image_alpha <= 0) {
		array_foreach(Player_Perks, function(e, i) /*=>*/ {
			if (e != undefined) {
				e.on_kill(self);
			}
		});
		instance_destroy();
	}
} else {
	image_alpha = lerp(image_alpha, 1, 0.1);
	if (image_alpha >= 0.95) {
		image_alpha = 1;
	}
	step();
}
