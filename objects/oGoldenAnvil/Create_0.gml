accept = new button("Accept");
accept.set_enabled(false);
accept.set_function(method(self, function () {
	var a1 = array_get_index(Player_Weapons, s1);
	var a2 = array_get_index(Player_Weapons, s2);
	Player_Weapons[a1] = undefined;
	Player_Weapons[a2] = undefined;
	var u = array_get_index(Player_Weapons, undefined);
	if (!is_undefined(col)) {
		Player_Weapons[u] = variable_clone(Weapons[$ col]);
		Player_Weapons[u].materials = [s1, s2]; //TODO: use enchantments
	}
	global.flexcache.flush();
	instance_destroy();
}));
ui = new window(global.game_uis.golden_anvil);
ui.fit_to_gui();
s1 = undefined;
s1 = undefined;
s2 = undefined;
w0 = [0, 0, 0, 0];
w1 = [0, 0, 0, 0];
w2 = [0, 0, 0, 0];
w3 = [0, 0, 0, 0];
w4 = [0, 0, 0, 0];
w5 = [0, 0, 0, 0];
s1a = [0, 0, 0, 0];
s2a = [0, 0, 0, 0];
col = undefined;
check = function () {
	accept.set_enabled(false);
	if (!is_undefined(s1) and !is_undefined(s2)) {
		if (s1.level == 7 and s2.level == 7) {
			if (array_contains(s1.can_collab, s2.name) and array_contains(s2.can_collab, s1.name)) {
				accept.set_enabled(true);
				global.search = [s1.name, s2.name];
				global.result = undefined;
				struct_foreach(Weapons, function (n, v) {
					if (array_contains(v.collab_materials, global.search[0]) and array_contains(v.collab_materials, global.search[1])) {
						global.result = v.name;
					}
				});
				if (global.result != undefined) {
					col = global.result;
				}
			}
		}
	}
}
event_user(0);