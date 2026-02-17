if inv_frame > AirLib.frame gpu_set_fog(true, c_white, 0, 0);
draw_self();
draw();
gpu_set_fog(false, c_white, 0, 0);
for (var i = 0; i < array_length(buffs); i++) {
	buffs[i].draw();
}
if (boss or miniboss) {
	draw_healthbar(
		(x - 13),
		((y - sprite_get_height(sprite_index)) - 3),
		(x + 13),
		((y - sprite_get_height(sprite_index)) - 6),
		((hp / e.hp) * 100),
		c_red,
		c_lime,
		c_lime,
		0,
		1,
		0
	);
}