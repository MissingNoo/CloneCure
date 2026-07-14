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
if (GameData.hp <= 0) {
	draw_set_color(c_black);
	death_alpha = lerp(death_alpha, 0.5, 0.01);
	draw_set_alpha(death_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
}
draw_set_alpha(1);
draw_set_color(c_white);
//draw_text(10, gui_y_percent(95), $"Current:{fps_real}: Average:{fps_average} : {fps} xpqueue: {ds_queue_size(GameData.xp_list)} dmgqueue: {ds_queue_size(GameData.dmg_list)}");
