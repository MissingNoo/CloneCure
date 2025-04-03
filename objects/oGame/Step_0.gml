for (var i = 0; i <= 1; i++) {
	if (device_mouse_check_button(i, mb_left)) {
		for (var j = 0; j < array_length(screen_touch); j++) {
			if (screen_touch[j][0] == true and screen_touch[j][1] == i) {
				var xm = device_mouse_x_to_gui(i);
				var ym = device_mouse_y_to_gui(i);
				if (xm > gui_x_percent(50)) {
					screen_touch[j][2] ??= "right";
				} else {
					screen_touch[j][2] ??= "left";
				}
				screen_touch[j][3] = xm;
				screen_touch[j][4] = ym;
				screen_touch[j][5] ??= xm;
				screen_touch[j][6] ??= ym;
			}
			touch_search = i;
			if (screen_touch[j][0] == false and array_find_index(screen_touch, function(e, i) {
				return e[1] == oGame.touch_search;
			}) == -1) {
				screen_touch[j][0] = true;
				screen_touch[j][1] = i;
			}
		}
	}
	if (device_mouse_check_button_released(i, mb_left)) {
		for (var j = 0; j < array_length(screen_touch); j++) {
			if (screen_touch[j][1] == i) {
				screen_touch[j][0] = false;
				screen_touch[j][1] = -1;
				screen_touch[j][2] = undefined;
				screen_touch[j][5] = undefined;
				screen_touch[j][6] = undefined;
			}
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