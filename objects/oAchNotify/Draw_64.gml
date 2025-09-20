var _x = (gui_w - (sprite_width * bg_scale / 2) / 2) - 50;
var _y = gui_h + y_offset;
draw_sprite_ext(sAchievementBackground, 0, _x, _y, bg_scale / 2, bg_scale, 0, c_white, 1);
draw_sprite_ext(
	ach.sprite,
	0,
	_x - icon_x,
	_y - icon_y,
	icon_scale,
	icon_scale,
	0,
	c_white,
	1
);
draw_sprite_ext(
	sItemSquare,
	0,
	_x - icon_x,
	_y - icon_y,
	border_scale,
	border_scale,
	0,
	c_white,
	1
);
text.scale(textscale).draw(_x, _y - text_y);
