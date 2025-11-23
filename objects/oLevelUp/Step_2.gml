if (selected_option < 4) { 
	global.currentelement = noone;
}
if (input_check_pressed("accept") || force_z) {
	switch (selected_option) {
		case 0:
		case 1:
		case 2:
		case 3:
			global.search = string_lower(ups[selected_option].name);
			switch (ups[selected_option].lex) {
				case "Weapons":
					var pos = array_find_index(Player_Weapons, function(e, i) {
						if (e == undefined) {
							return false;
						}
						return e.name == global.search;
					});
					if (pos != -1) {
						Player_Weapons[pos].level++;
						if (Player_Weapons[pos].level == 7) {
							Player_Weapons[pos].check_collab();
						}
					} else {
						pos = array_get_index(Player_Weapons, undefined);
						if (pos != -1) {
							Player_Weapons[pos] = variable_clone(
								Weapons[$ global.search]
							);
						}
					}
					break;
				case "Items":
					var pos = array_find_index(Player_Items, function(e, i) {
						if (e == undefined) {
							return false;
						}
						return e.name == global.search;
					});
					if (pos != -1) {
						Player_Items[pos].level++;
					} else {
						pos = array_get_index(Player_Items, undefined);
						if (pos != -1) {
							Player_Items[pos] = variable_clone(Items[$ global.search]);
						}
					}
					Player_Items[pos].on_bought();
					break;
				case "Stats":
					ups[selected_option].on_bought();
					break;
				case "Perks":
					var pos = array_find_index(Player_Perks, function(e, i) {
						return e.name == global.search;
					});
					Player_Perks[pos].level++;
					ups[selected_option].on_bought();
					break;
				default:
					show_message("WIP");
					break;
			}
			break;
		default:
			show_message("WIP");
			break;
	}
	instance_destroy();
}
force_z = false;
