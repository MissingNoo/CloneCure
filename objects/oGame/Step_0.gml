if (keyboard_check_pressed(vk_escape)) {
	if (!instance_exists(oPauseUI)) {
        surf = surface_recreate(surf, surface_get_width(application_surface), surface_get_height(application_surface));
        surface_copy(surf, 0, 0, application_surface);
        instance_deactivate_all(true);
        instance_activate_object(input_controller_object);
        instance_activate_object(oGameUI);
        is_paused = true;
    	instance_create_depth(0, 0, -1100, oPauseUI);
    } else {
    	instance_destroy(oPauseUI);
        is_paused = false;
        instance_activate_all();
    }
}