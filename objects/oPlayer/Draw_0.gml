if (instance_exists(objNekoPresenceDemo)) {
	draw_sprite_centered_ext(
		objNekoPresenceDemo.sprite_index,
		0,
		x,
		y - sprite_height - 10,
		0.1,
		0.1,
		0,
		c_white,
		0.5
	);
}
//var _x = round(x), _y = round(y);
var _x = x, _y = y;
draw_sprite_ext(sCharShadow, 0, _x, _y, 1, 1, 0, c_white, 0.8);
if (GameData.hp > 0 && GameData.hp < GameData.max_hp) {
	draw_healthbar(
		(_x - 13),
		((_y - sprite_height) - 3),
		(_x + 13),
		((_y - sprite_height) - 6),
		((GameData.hp / GameData.max_hp) * 100),
		c_red,
		c_lime,
		c_lime,
		0,
		1,
		0
	);
}
if (GameData.shield > 0 && GameData.hp > 0) {
	draw_healthbar(
		(_x - 13),
		((_y - 19) - 20),
		(_x + 13),
		((_y - 19) - 23),
		((GameData.shield / GameData.max_shield) * 100),
		c_red,
		c_blue,
		c_blue,
		0,
		1,
		0
	);
}
gpu_set_fog(inv_frame >= AirLib.frame, c_white, 0, 0);
draw_sprite_ext(
	sprite_index,
	image_index,
	_x,
	_y,
	image_xscale,
	image_yscale,
	image_angle,
	c_white,
	image_alpha
);
gpu_set_fog(false, c_white, 0, 0);
if (GameData.mouseAim) {
	var dir = point_direction(x, y - (sprite_height / 2), mouse_x, mouse_y);
	draw_sprite_ext(sAimArrow, 2, x, y - (sprite_height / 2), 1, 1, dir, c_white, 1);
	GameData.arrow_dir = dir;
} else {
	draw_sprite_ext(
		sArrow,
		GameData.strafing,
		x,
		y - (sprite_height / 2),
		1,
		1,
		GameData.arrow_dir,
		c_white,
		1
	);
}
//draw_text(x, y - 30, $"SPD: {movement.spd}"); 
