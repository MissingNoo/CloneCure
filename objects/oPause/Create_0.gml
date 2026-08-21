current = "unpaused";
currentinst = noone;
events = {
	lvlup : oLevelUp,
	normal : oPauseUI,
	anvil : oAnvil
}
dont_deactivate = [input_controller_object, oGameUI, oPause, oGame];
pause = function (reason) {
	if (current == reason) {
		current = "unpaused"
		if (instance_exists(currentinst)) {
			instance_destroy(currentinst);
		}
		currentinst = noone;
		instance_activate_all();
	} else if (current == "unpaused") {
		oGame.surf = surface_recreate(
			oGame.surf,
			surface_get_width(application_surface),
			surface_get_height(application_surface)
		);
		switch (os_type) {
			case os_android:
				surface_copy(oGame.surf, 0, 0, GameData.GameSurf);
				break;
			default:
				surface_copy(oGame.surf, 0, 0, application_surface);
				break;
		}

		instance_deactivate_all(true);
		
		array_foreach(dont_deactivate, function(e, i) {
			instance_activate_object(e);
		});
		current = reason;
		currentinst = instance_create_depth(0, 0, -1100, events[$reason]);
	}
}
global.events.add_listener("pause", self, pause)