if (selected_option < 4) { 
	global.currentelement = noone;
}
var eliminated = false;
var held = false;
if (input_check_pressed("accept") || force_z) {
	
	switch (selected_option) {
		case 0:
		case 1:
		case 2:
		case 3:
			global.search = string_lower(ups[selected_option].name);
			if (eliminating) {
				array_push(GameData.ignore_ups, global.search);
				ups[selected_option] = undefined;
				eliminating = false;
				eliminated = true;
				hold.set_enabled(GameData.Holds > 0);
				reroll.set_enabled(GameData.Rerolls > 0);
				eliminate.set_enabled(GameData.Eliminates > 0);
				break;
			}
			if (holding) {
				GameData.held = [selected_option, ups[selected_option]];
				holding = false;
				heldpos = selected_option;
				held = true;
				hold.set_enabled(GameData.Holds > 0);
				reroll.set_enabled(GameData.Rerolls > 0);
				eliminate.set_enabled(GameData.Eliminates > 0);
				break;
			}
			var pos = -1;
			switch (ups[selected_option].lex) {
				case "Weapons":
					pos = array_find_index(Player_Weapons, function(e, i) {
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
					if (Items[$ global.search].use_only) {
						Items[$ global.search].on_bought();
						break;
					}
					pos = array_find_index(Player_Items, function(e, i) {
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
					if (pos != -1) {
						Player_Items[pos].on_bought();
					}
					break;
				case "Stats":
					ups[selected_option].on_bought();
					break;
				case "Perks":
					pos = array_find_index(Player_Perks, function(e, i) {
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
	if (!eliminated and !held) {
		instance_destroy();
	}
}
force_z = false;
