///UI
//try {
	//ui = new window(json_parse(json_stringify(json_load("/home/airgeadlamh/.config/AirLibGMProject//export.ui"))));
//}
//catch (error) {
	//
//}
ui = new window(global.game_uis.anvil);
ui.fit_to_gui();
for (var i = 0; i <= 5; i++) {
	ui.add_draw($"w{i}",
		AirUIFunctionStart
			var p = real(string_digits(name));
			var color = row == 0 and oAnvilInterface.pos == p ? c_aqua : c_white;
			draw_sprite_stretched_ext(sItemSquare, 0, _x, _y, _w, _h, color, 1);
			var i = Player_Weapons[p];
			if (mouse_in_area_gui(area)) {
				oAnvilInterface.pos = p;
				row = 0;
			}
			if (!is_undefined(i)) {
				airui_draw_sprite_centered(name + "anvil", i.sprite, pos, airui_fit.height, 0.7);
			}
		AirUIFunctionEnd
	)
}


for (var i = 0; i <= 5; i++) {
	ui.add_draw($"i{i}",
		AirUIFunctionStart
			var p = real(string_digits(name));
			var color = row == 1 and oAnvilInterface.pos == p ? c_aqua : c_white;
			draw_sprite_stretched_ext(sItemSquare, 0, _x, _y, _w, _h, color, 1);
			var i = Player_Items[p];
			if (mouse_in_area_gui(area)) {
				oAnvilInterface.pos = p;
				row = 1;
			}
			if (!is_undefined(i)) {
				airui_draw_sprite_centered(name + "anvil", i.sprite, pos, airui_fit.height, 0.7);
			}
		AirUIFunctionEnd
	)
}

ui.add_draw("item_panel",
	AirUIFunctionStart
		draw_sprite_stretched(sHudUpgrade, 1, _x, _y, _w, _h);
	AirUIFunctionEnd
)
ui.add_draw("item_name",
	AirUIFunctionStart
		if (!is_undefined(selected)) {
			scribble(lexicon_text($"{selected.lex}.{selected.name}.name")).wrap(_w).draw(_x, _y);
		} else {
			scribble("Item Name").wrap(_w).draw(_x, _y);
		}
	AirUIFunctionEnd
)
ui.add_draw("item_desc",
	AirUIFunctionStart
		if (!is_undefined(selected)) {
			scribble(lexicon_text($"{selected.lex}.{selected.name}.desc")).wrap(_w).draw(_x, _y);
		} else {
			scribble(Lorem).wrap(_w).draw(_x, _y);
		}
	AirUIFunctionEnd
)
ui.add_draw("item_frame",
	AirUIFunctionStart
		draw_sprite_stretched(sItemSquare, 0, _x, _y, _w, _h);
		if (!is_undefined(selected)) {
			var spr = selected.sprite;
			airui_draw_sprite_centered(name + "anvil", spr, pos, airui_fit.height, 0.8);
		}
		
	AirUIFunctionEnd
)
ui.finish();