if (keyboard_check_released(vk_f11)) {
	fullscreen = !fullscreen;
}
window_set_fullscreen(fullscreen);
#region Touch movement
for (var i = 0; i <= 1; i++) {
	if (os_type != os_android && os_type != os_gxgames) {
		break;
	}
	var xm = device_mouse_x_to_gui(i);
	var ym = device_mouse_y_to_gui(i);
	var side = undefined;
	if (xm > gui_x_percent(50)) {
		side = "right";
	} else {
		side = "left";
	}
	var touch = GameData.touch[$ side];
	if (device_mouse_check_button(i, mb_left)) {
		if (touch.device == undefined) {
			touch.device = i;
			touch.enabled = true;
		}

		if (touch.device == i) {
			touch.startx ??= xm;
			touch.starty ??= ym;
			touch.x = xm;
			touch.y = ym;
		}
	}
	if (device_mouse_check_button_released(i, mb_left)) {
		if (touch.device == i) {
			touch.reset();
		}
	}
}
#endregion
#region Level UP
if (GameData.xp >= GameData.needed_xp) {
	if (!instance_exists(oLevelUp)) {
		GameData.xp -= GameData.needed_xp;
		pause_game();
		instance_create_depth(0, 0, depth - 2, oLevelUp);
	} 
}
#endregion
if (keyboard_check_pressed(vk_f1)) {
	debug_rooms();
}
cursor_sprite = instance_exists(oPlayer)
&& GameData.mouseAim
&& !GameData.is_paused
	? sMouseAim
	: sCursor;
if (keyboard_check_pressed(vk_escape) || device_mouse_check_button_pressed(3, mb_left)) {
	pause_game("pause");
}
if (global.minfps > fps_real && fps_real != 0) {
	global.minfps = fps_real;
}
if (global.maxfps < fps_real) {
	global.maxfps = fps_real;
}
