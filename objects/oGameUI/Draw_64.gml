//feather ignore GM1041
if (GameData.is_paused && surface_exists(GameData.GameSurf)) {
	draw_surface_stretched_ext(
		GameData.GameSurf,
		0,
		0,
		display_get_gui_width(),
		display_get_gui_height(),
		c_white,
		1
	);
}
ui.draw();
//xpsurf = surface_recreate(
	//xpsurf,
	//sprite_get_width(sExpBarBG),
	//sprite_get_height(sExpBarBG)
//);
//surface_set_target(xpsurf);
//draw_sprite(sExpBarBG, 0, 0, 0);
//draw_sprite_part(
	//sExpBar,
	//-1,
	//0,
	//0,
	//((GameData.xp / GameData.needed_xp) * sprite_get_width(sExpBar)),
	//sprite_get_height(sExpBarBG),
	//0,
	//0
//);
//draw_sprite(sExpBarBG, 1, 0, 0);
//surface_reset_target();
//draw_surface_stretched(
	//xpsurf,
	//0,
	//0,
	//gui_x_percent(100),
	//surface_get_height(xpsurf) * 1.5
//);
//update_ui();
draw_text(10, gui_y_percent(95), $"Current:{fps_real}: Average:{fps_average} : {fps}");
