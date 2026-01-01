/// @description Fill lists
stats = [];
weapons = [];
items = [];
perks = [];
struct_foreach(Stats, function(i, e) {
	repeat (e.weight) {
		array_push(oLevelUp.stats, e.name);
	}
});
if (is_undefined(Player_Items[array_length(Player_Items) - 1])) {
	struct_foreach(Items, function(i, e) {
		if (e.name != "money" and e.name != "burger") {
			repeat (e.weight) {
				if (!array_contains(GameData.ignore_ups, e.name)) {
					array_push(oLevelUp.items, e.name);
				}
			}
		}
	});
} else {
	array_foreach(Player_Items, function(e, i) {
		repeat (e.weight) {
			if (!array_contains(GameData.ignore_ups, e.name)) {
				array_push(oLevelUp.items, e.name);
			}
		}
	});
}
for (var i = array_length(Player_Perks) - 1; i >= 0; i--) {
	if (Player_Perks[i].level < Player_Perks[i].max_level) {
		array_push(perks, Player_Perks[i].name);
	}
}
for (var i = array_length(Player_Items) - 1; i >= 0; i--) {
	if (is_undefined(Player_Items[i])) {
		continue;
	}
	if (Player_Items[i].level == Player_Items[i].max_level) {
		repeat (Player_Items[i].weight + 1) {
			var index = array_get_index(items, Player_Items[i].name);
			if (index != -1) {
				array_delete(items, index, 1);
			}
		}
	}
}
if (is_undefined(Player_Weapons[array_length(Player_Weapons) - 1])) {
	struct_foreach(Weapons, function(i, e) {
		repeat (e.weight) {
			if (!array_contains(GameData.ignore_ups, e.name) && !e.collab && (!e.is_perk || (e.is_perk && e.character_name == GameData.selected_character))) {
				array_push(oLevelUp.weapons, e.name);
			}
		}
	});
} else {
	array_foreach(Player_Weapons, function(e, i) {
		repeat (e.weight) {
			if (!array_contains(GameData.ignore_ups, e.name) && !e.collab) {
				array_push(oLevelUp.weapons, e.name);
			}
		}
	});
}
for (var i = array_length(Player_Weapons) - 1; i >= 0; i--) {
	if (is_undefined(Player_Weapons[i])) {
		continue;
	}
	if (Player_Weapons[i].level == Player_Weapons[i].max_level) {
		repeat (Player_Weapons[i].weight + 1) {
			var index = array_get_index(weapons, Player_Weapons[i].name);
			if (index != -1) {
				array_delete(weapons, index, 1);
			}
		}
	}
}
