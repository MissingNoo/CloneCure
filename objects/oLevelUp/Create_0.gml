//feather disable all
GameData.level++;
global.events.broadcast("level_up", GameData.level);
right_offset = [0, 0, 0, 0];
off_set = false;
ups = [
	Weapons[$ "Ame_Pistol"],
	Weapons[$ "Ame_Pistol"],
	Weapons[$ "Ame_Pistol"],
	Weapons[$ "Ame_Pistol"]
];
icon_scale_mult = 0.6;
stats = [];
weapons = [];
items = [];
struct_foreach(Stats, function(i, e) {
	repeat (e.weight) {
		array_push(oLevelUp.stats, e.name);
	}
});
struct_foreach(Items, function(i, e) {
	repeat (e.weight) {
		array_push(oLevelUp.items, e.name);
	}
});
for (var i = array_length(Player_Items) - 1; i >= 0; i--) {
	if (is_undefined(Player_Items[i])) {
		continue;
	}
	if (Player_Items[i].level == 7) {
		repeat (Player_Items[i].weight + 1) {
			var index = array_get_index(weapons, Player_Items[i].name);
			if (index != -1) {
				array_delete(weapons, index, 1);
			}
		}
	}
}
struct_foreach(Weapons, function(i, e) {
	repeat (e.weight) {
		if (!array_contains(GameData.ignore_weapons, e.name) && !e.collab) {
			array_push(oLevelUp.weapons, e.name);
		}
	}
});
for (var i = array_length(Player_Weapons) - 1; i >= 0; i--) {
	if (is_undefined(Player_Weapons[i])) {
		continue;
	}
	if (Player_Weapons[i].level == 7) {
		repeat (Player_Weapons[i].weight + 1) {
			var index = array_get_index(weapons, Player_Weapons[i].name);
			if (index != -1) {
				array_delete(weapons, index, 1);
			}
		}
	}
}
grab_upgrade = function () {
	var c = choose("item", "weapon");
	var grabbed_item = undefined;
	var name = "";
	switch (c) {
		case "item":
			name = items[irandom_range(0, array_length(items) - 1)];
			for (var i = array_length(items) - 1; i >= 0; i--) {
				if (items[i] == name) {
					array_delete(items, i, 1);
				}
			}
			grabbed_item = Items[$ name];
			break;
		case "weapon":
			name = weapons[irandom_range(0, array_length(weapons) - 1)];
			for (var i = array_length(weapons) - 1; i >= 0; i--) {
				if (weapons[i] == name) {
					array_delete(weapons, i, 1);
				}
			}
			grabbed_item = Weapons[$ name];
			break;
	}
	return grabbed_item;
}
ups = [
	grab_upgrade(),
	grab_upgrade(),
	grab_upgrade(),
	grab_upgrade(),
	//Items[$ "membership"],
	//Items[$ "corporate_pin"],
	//Items[$ "kusogaki_shackles"],
	//Weapons[$ "bl_book"],
	//Weapons[$ "plug_type_asacoco"]
];

mx = 0;
my = 0;
GameData.needed_xp += round((4 * (GameData.level + 1)) * 2.1) - round((4 * GameData.level) * 2.1);
//feather ignore GM2023
//feather ignore GM1041
ui = new window(global.game_uis.level_up);
ui.fit_to_gui();
selected_option = 0;
eliminate = new button("Eliminate");
eliminate
	.set_function(function() {
		GameData.Eliminates = clamp(GameData.Eliminates - 1, 0, infinity);
	});
reroll = new button("Reroll");
reroll
	.set_function(function() {
		GameData.Rerolls = clamp(GameData.Rerolls - 1, 0, infinity);
	});
hold = new button("Hold");
hold.set_function(function() {
	GameData.Holds = clamp(GameData.Holds - 1, 0, infinity);
});

icon_x = 104;
icon_y = 114;
icon_scale = 2;
title_x = 37;
title_end_x = 42;
title_y = 28;
title_scale = 2;
description_x = 144;
description_x_end = 146;
description_y = 42;
description_y_end = 49;
dbg = dbg_view("Level UP", false, gui_x_percent(50));
create_view_from_instance(self);
force_z = false;
//dbg_section("Position");
//var names = struct_get_names(self);
//for (var i = 0; i < array_length(names); i++) {
//if (is_real(self[$ names[i]])) {
//dbg_slider_int(
//ref_create(self, names[i]),
//-50,
//300,
//string_first_letter_upper_case(string_replace_all(names[i], "_", " "))
//);
//}
//}
instance_create_depth(x, y, depth + 1, oPlayerStatsUI);
key = new animated_sprite(sHudLeftKey);
u0 = undefined;
u1 = undefined;
u2 = undefined;
u3 = undefined;

mouse_select = function(_x, _y, _w, _h, num) {
	if (
		(mx != device_mouse_x_to_gui(0) || my != device_mouse_y_to_gui(0))
		&& point_in_rectangle(
			device_mouse_x_to_gui(0),
			device_mouse_y_to_gui(0),
			_x,
			_y,
			_x + _w,
			_y + _h
		)
	) {
		selected_option = num;
		mx = device_mouse_x_to_gui(0);
		my = device_mouse_y_to_gui(0);
	}
};
