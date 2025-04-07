function pause_game(reason = undefined) {
	var can_unpause = !instance_exists(oLevelUp);
	if (!can_unpause and GameData.is_paused) {
		exit;
	}
	if (GameData.is_paused) {
		instance_destroy(oPauseUI);
        GameData.is_paused = false;
        instance_activate_all();
	} else {
		surf = surface_recreate(surf, surface_get_width(application_surface), surface_get_height(application_surface));
        surface_copy(surf, 0, 0, application_surface);
        instance_deactivate_all(true);
        var dont_deactivate = [input_controller_object, oGameUI];
        array_foreach(dont_deactivate, function(e, i) {
           instance_activate_object(e);
        });
        GameData.is_paused = true;
		switch (reason) {
			case "pause":
				instance_create_depth(0, 0, -1100, oPauseUI);
				break;
		}
    	
	}
}