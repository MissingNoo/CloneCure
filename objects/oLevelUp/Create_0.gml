//feather disable all
eliminating = false;
holding = false;
heldpos = -1;
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
event_user(0);

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
		if (GameData.Eliminates > 0) {
			GameData.Eliminates = clamp(GameData.Eliminates - 1, 0, infinity);
			eliminating = true;
			eliminate.set_enabled(false);
			reroll.set_enabled(false);
			hold.set_enabled(false);
			selected_option = 0;
		}
	});
eliminate.set_enabled(GameData.Eliminates > 0);
reroll = new button("Reroll");
reroll
	.set_function(function() {
		if (GameData.Rerolls > 0) {
			event_user(0);
		}
		GameData.Rerolls = clamp(GameData.Rerolls - 1, 0, infinity);
	});
reroll.set_enabled(GameData.Rerolls > 0);
hold = new button("Hold");
hold.set_function(function() {
	if (GameData.Holds > 0) {
		GameData.Holds = clamp(GameData.Holds - 1, 0, infinity);
		holding = true;
		eliminate.set_enabled(false);
		eliminate.set_enabled(false);
		reroll.set_enabled(false);
		hold.set_enabled(false);
		selected_option = 0;
	}
});
hold.set_enabled(GameData.Holds > 0);

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
