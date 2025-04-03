for (var i = 0; i <= 1; i++) {
	if (os_type != os_android) { break; }
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
if (keyboard_check_pressed(vk_f2)) {
	display_set_gui_size(1920, 1080);
}
if (keyboard_check_pressed(vk_f1)) {
	debug_rooms();
}

if (keyboard_check_pressed(vk_escape)) {
	if (!instance_exists(oPauseUI)) {
        surf = surface_recreate(surf, surface_get_width(application_surface), surface_get_height(application_surface));
        surface_copy(surf, 0, 0, application_surface);
        instance_deactivate_all(true);
        var dont_deactivate = [input_controller_object, oGameUI];
        array_foreach(dont_deactivate, function(e, i) {
           instance_activate_object(e);
        });
        GameData.is_paused = true;
    	instance_create_depth(0, 0, -1100, oPauseUI);
    } else {
    	instance_destroy(oPauseUI);
        GameData.is_paused = false;
        instance_activate_all();
    }
}