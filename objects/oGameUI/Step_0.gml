
//if (os_type == os_android) {
//display_set_gui_size(display_get_width(), display_get_height());
//ui.fit_to_gui();
//}
//if (keyboard_check_released(vk_backspace)) {
//surface_free(itemssurf);
//}
//display_set_gui_size(window_get_width(), window_get_height());
//ui.fit_to_gui();
if (md5_frame < AirLib.frame) {
	md5_frame = AirLib.frame + 60;
	current_md5 = md5_file("/home/airgeadlamh/export.ui");
	if (current_md5 != last_md5) {
		global.flexcache.flush();
		ui = new window(json_parse(json_stringify(json_load("/home/airgeadlamh/export.ui"))));
		ui.fit_to_gui();
		event_user(0);
	}
	last_md5 = current_md5;
	
}
a += (-keyboard_check_pressed(vk_pageup) + keyboard_check_pressed(vk_pagedown)) * 0.1;
a += -keyboard_check_pressed(vk_home) + keyboard_check_pressed(vk_end);
coinspr.animate();
nxp = lerp(nxp, (GameData.xp / GameData.needed_xp) * 100, 0.1);