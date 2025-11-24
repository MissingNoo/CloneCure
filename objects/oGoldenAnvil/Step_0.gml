if (device_mouse_check_button_released(0, mb_left)) {
	for (var i = 0; i < 5; i++) {
		var area = self[$ $"w{i}"];
		if (!is_undefined(Player_Weapons[i]) and mouse_in_area_gui(area)) {
			var w = Player_Weapons[i];
			if (is_undefined(s1) and s2 != w) {
				s1 = w;
			}
			if (is_undefined(s2) and s1 != w) {
				s2 = w;
			}
		}
	}
	if (mouse_in_area_gui(s1a)) {
		s1 = undefined;
	}
	if (mouse_in_area_gui(s2a)) {
		s2 = undefined;
	}
	check();
}