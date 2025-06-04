ups = [
	Weapons[$ "Ame_Pistol"],
	Weapons[$ "Ame_Pistol"],
	Weapons[$ "Ame_Pistol"],
	Weapons[$ "Ame_Pistol"],
];

stats = [];
weapons = [];
items = [];
struct_foreach(Stats, function(i, e) { 
    repeat (e.weight) {
    	array_push(oLevelUp.stats, e.name);
    }
});
struct_foreach(Weapons, function(i, e) { 
    repeat (e.weight) {
    	array_push(oLevelUp.weapons, e.name);
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

ups = [
	Items[$ "Energy_Drink"],
	Items[$ "Kusogaki_Shackles"],
	Items[$ "Face_Mask"],
	Weapons[$ "Ame_Pistol"],
];

mx = 0;
my = 0;
GameData.level++;
GameData.needed_xp += round((4*(GameData.level + 1)) *2.1) - round((4*GameData.level)*2.1);
//feather ignore GM2023
//feather ignore GM1041
ui = new window(global.game_uis.level_up);
ui.fit_to_gui();
selected_option = 0;
eliminate = new button("Eliminate");
eliminate.set_function(function() {
	GameData.Eliminates = clamp(GameData.Eliminates - 1, 0, infinity);
});
reroll = new button("Reroll");
reroll.set_function(function() {
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
dbg = dbg_view("stats", true, gui_x_percent(50));
dbg_section("Position");
var names = struct_get_names(self);
for (var i = 0; i < array_length(names); i++) {
	if (is_real(self[$ names[i]])) {
		dbg_slider_int(ref_create(self, names[i]), -50, 300, string_first_letter_upper_case(string_replace_all(names[i], "_", " ")));
	}
}
instance_create_depth(x, y, depth + 1, oPlayerStatsUI);
key = new animated_sprite(sHudLeftKey);
u0 = undefined;
u1 = undefined;
u2 = undefined;
u3 = undefined;

mouse_select = function(_x, _y, _w, _h, num) {
	if ((mx != device_mouse_x_to_gui(0) or my != device_mouse_y_to_gui(0)) and point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _x, _y, _x + _w, _y + _h)) {
		selected_option = num;
		mx = device_mouse_x_to_gui(0);
		my = device_mouse_y_to_gui(0);
	} 
}