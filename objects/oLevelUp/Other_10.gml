/// @description Select Upgrades
u0 = undefined;
u1 = undefined;
u2 = undefined;
u3 = undefined;
event_user(1);
can_offer_skill = function () {
	return array_find_index(Player_Perks, function (e, i) {
		return e.level < e.max_level;
	}) != -1 and array_length(perks) > 0;
}
can_offer_weapon = function () {
	return array_find_index(Player_Weapons, function (e, i) {
		return e == undefined || e.level < e.max_level;
	}) != -1 and array_length(weapons) > 0;
}
can_offer_item = function () {
	return array_find_index(Player_Items, function (e, i) {
		return e == undefined || e.level < e.max_level;
	}) != -1  and array_length(items) > 0;
}
check_what_can_be_o1_o2 = function (choosen) {
	if (choosen == "Skill") {
		if (!can_offer_skill()) {
			choosen = "Weapon";
		}
		//show_message($"{can_offer_skill()}:{choosen}");
	}
	if (choosen == "Weapon") {
		if (!can_offer_weapon()) {
			choosen = "Item";
		}
	}
	if (choosen == "Item") {
		if (!can_offer_item()) {
			choosen = "Stat";
		}
	}
	return choosen;
}

#region Option 1&2
var o1type = check_what_can_be_o1_o2(choose_weighted(["Skill", "Weapon", "Item", "Stat"], [7, 7, 5, 1]));
var o2type = check_what_can_be_o1_o2(choose_weighted(["Skill", "Weapon", "Item", "Stat"], [7, 7, 5, 1]));
#endregion

#region Option 3
var o3type;
repeat (5) {
	o3type = choose_weighted(["Weapon", "Item"], [1, 1]);
	if (o3type == "Weapon") {
		if (!can_offer_weapon()) {
			o3type = "Item";
		} else {
			break;
		}
	}
	if (o3type == "Item") {
		if (!can_offer_item()) {
			o3type = "Skill";
		} else {
			break;
		}
	}
	if (o3type == "Skill") {
		if (!can_offer_skill()) {
			o3type = "None";
		} else {
			break;
		}
	}
}
if (o3type == "None") {
	o3type = "Food";
}
#endregion

#region Option 4
var o4type;
repeat (5) {
	o4type = choose_weighted(["Weapon", "Item"], [1, 1]);
	if (o4type == "Weapon") {
		if (!can_offer_weapon()) {
			o4type = "Item";
		} else {
			break;
		}
	}
	if (o4type == "Item") {
		if (!can_offer_item()) {
			o4type = "None";
		} else {
			break;
		}
	}
}
if (o4type == "None") {
	o4type = "Money";
}
#endregion

delete_option = function (arr, name) {
	for (var i = array_length(arr) - 1; i >= 0; i--) {
		if (arr[i] == name) {
			array_delete(arr, i, 1);
		}
	}
}

grab_upgrade = function (c) {
	var grabbed_item = Items[$"money"];
	var name = "";
	try {
		switch (c) {
			default:
			case "Food":
				grabbed_item = Items[$"burger"];
				break;
			case "Stat":
				name = stats[irandom_range(0, array_length(stats) - 1)];
				delete_option(stats, name);
				grabbed_item = Stats[$ name];
				break;
			case "Money":
				grabbed_item = Items[$"money"];
				break;
			case "Item":
				name = items[irandom_range(0, array_length(items) - 1)];
				delete_option(items, name);
				grabbed_item = Items[$ name];
				break;
			case "Weapon":
				name = weapons[irandom_range(0, array_length(weapons) - 1)];
				delete_option(weapons, name);
				grabbed_item = Weapons[$ name];
				break;
			case "Skill":
				name = perks[irandom_range(0, array_length(perks) - 1)];
				delete_option(perks, name);
				grabbed_item = Perks[$ name];
				break;
		}
	}
	catch (error) {
		show_debug_message(error);
	}
	return grabbed_item;
}
show_debug_message($"[LevelUP] Rolled {o1type}:{o2type}:{o3type}:{o4type}");
ups = [
	grab_upgrade(o1type),
	grab_upgrade(o2type),
	grab_upgrade(o3type),
	grab_upgrade(o4type),
	//Items[$ "membership"],
	//Items[$ "corporate_pin"],
	//Items[$ "kusogaki_shackles"],
	//Weapons[$ "bl_book"],
	//Weapons[$ "plug_type_asacoco"]
];
if (!is_undefined(GameData[$"debug_item"])) {
	ups[0] = Items[$ GameData.debug_item];
}
if (!is_undefined(GameData[$"debug_weapon"])) {
	var dbgpos = !is_undefined(GameData[$"debug_item"]) ? 1 : 0;
	ups[dbgpos] = Weapons[$ GameData.debug_weapon];
}
if (!is_undefined(GameData.held)) {
	ups[GameData.held[0]] = GameData.held[1];
	heldpos = GameData.held[0];
	GameData.held = undefined;
}