if (input_check_pressed("accept")) {
	switch (selected_option) {
		case 0:
		case 1:
		case 2:
		case 3:
			switch (ups[selected_option].lex) {
				case "Weapons":
					global.search = ups[selected_option].name;
					var pos = array_find_index(Player_Weapons, function(e, i) {
						if (e == undefined) {
							return false;
						}
						return e.name == global.search;
					});
					if (pos != -1) {
						Player_Weapons[pos].level++;
					} else {
						pos = array_get_index(Player_Weapons, undefined);
						if (pos != -1) {
							Player_Weapons[pos] = variable_clone(Weapons[$ global.search]);
						}
					}
					break;
				case "Items":
					break;
				case "Stats":
					ups[selected_option].bought();
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