function pause_game(reason = undefined) {
	var can_unpause = !instance_exists(oLevelUp);
	if (reason == "lvlup") {
		can_unpause = true;
	}
	if (!can_unpause and GameData.is_paused) {
		exit;
	}
	if (GameData.is_paused) {
		instance_destroy(oPauseUI);
        GameData.is_paused = false;
        instance_activate_all();
	} else {
		oGame.surf = surface_recreate(oGame.surf, surface_get_width(application_surface), surface_get_height(application_surface));
        surface_copy(oGame.surf, 0, 0, application_surface);
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

function damage_player(dmg) {
	if (dmg == 0) {
		exit;
	}
	if (GameData.shield > 0) {
		GameData.shield = clamp(GameData.shield - dmg, 0, GameData.max_shield);
	} else {
		GameData.hp = clamp(GameData.hp - dmg, 0, GameData.max_hp);
	}
}