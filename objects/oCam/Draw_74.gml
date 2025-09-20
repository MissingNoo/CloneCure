/// @description Insert description here
if (os_type != os_android) {
	if (surface_exists(GameData.GameSurf)) {
		draw_surface_stretched_ext(
			GameData.GameSurf,
			-frac(x),
			-frac(y),
			display_get_gui_width() + frac(x),
			display_get_gui_height() + frac(y),
			c_white,
			1
		);
	}
} else {
	if (surface_exists(GameData.GameSurf)) {
		draw_rectangle_colour(
			0,
			0,
			display_get_gui_width(),
			display_get_gui_height(),
			c_black,
			c_black,
			c_black,
			c_black,
			false
		);
		draw_surface_stretched_ext(
			GameData.GameSurf,
			-frac(x),
			-frac(y),
			display_get_gui_width() + frac(x),
			display_get_gui_height() + frac(y),
			c_white,
			1
		);
	}
}

if (surface_exists(GameData.GameSurf)) {
	draw_surface_ext(GameData.GameSurf2, 30, 30, 0.5, 0.5, 0, c_white, 1);
}
