///UI
ui = new window(variable_clone(global.game_uis.select), false);
ui.fit_to_gui();
global.flexcache.flush();
try {
 char_draw = function (data, area, pos) {
	//draw_rectangle_area(area, true);
	//draw_text(area[0], area[1], data.name);
	var _x = area[0];
	var _y = area[1];
	var _w = area[2];
	var _h = area[3];
	var offset = charxoff * (data.line mod 2 ==  0 ? 1 : -1);
	pos = variable_clone(pos);
	
	pos.left += offset;
	
	draw_sprite_stretched(sCharFG, 1, pos.left, pos.top, pos.width, pos.height);
	//airui_draw_sprite_centered($"charfg{data.name}", sCharFG, pos, airui_fit.height, 2, 2, 0, 1);
	//airui_draw_sprite_centered($"charlock{data.name}", sCharLock, pos, airui_fit.height, 0.5, 1, 0);
	draw_sprite_stretched(sCharLock, 0, pos.left, pos.top, pos.width, pos.height);
	var _pos = array_get_index(chars, data.name);
	if (!is_undefined(data.name)) {
		airui_draw_sprite_centered($"charpic{data.name}", GameData.characters[$ data.name].portrait, pos, airui_fit.stretch, 1, 1, 0);
		if ( mouse_in_area_gui(
					pos
				)
			) {
				if (lmxx != mx || lmy != my) {
					lmxx = mx;
					lmy = my;
					if (_pos != -1) {
						if (selected != _pos) {
							selected = _pos;
							select_char();
						}
					}
					
				}
				if (
					st.get_current_state() == "Char"
					&& selected == _pos
					&& device_mouse_check_button_pressed(0, mb_left)
				) {
					force_click();
				}
			}
	}
	draw_sprite_stretched(sCharFG, 0, pos.left, pos.top, pos.width, pos.height);
	if (selected == pos) {
			draw_sprite_stretched(sMenuCharSelectCursor, 0, pos.left, pos.top, pos.width, pos.height);

	}
	
	//airui_draw_sprite_centered($"charfg{data.name}", sCharFG, pos, airui_fit.height, 1, 1, 0);
}
for (var i = 0; i <= 46; i++) {
	var line = 0;
	if (i >= 10) {
		line = 1;
	}
	if (i >= 20) {
		line = 2;
	}
	if (i >= 29) {
		line = 3;
	}
	if (i >= 38) {
		line = 4; 
	}
	var _char = undefined;
	agencie_chars = [];
	for (var j = 0; j < array_length(chars); j++) {
		var cur_char = chars[j];
		if (corps[selected_corp].agency == Agencies.Unknown or corps[selected_corp].agency == Characters[$ cur_char].agency) {
			array_push(agencie_chars, cur_char);
		}
	}
	if (i < array_length(agencie_chars)) {
		_char = agencie_chars[i];
	}
	var struct = {
		name : $"char:{i}",
		flex : 1,
		height : "100%",
		margin : 2,
		data : {
			line : line,
			name : _char,
		}
	}
	var node = flexpanel_create_node(struct);
	var root = ui.get_child($"chars{line + 1}");
	flexpanel_node_insert_child(root, node, flexpanel_node_get_num_children(root));
	ui.add_draw($"char:{i}",
		AirUIFunctionStart
		char_draw(data, area, pos);
		AirUIFunctionEnd
	);
	
}
	
ui.add_draw("corps_panel", 
	AirUIFunctionStart
		draw_sprite_stretched(sShopSelected, 0, _x - corps_x_offset, _y, _w, _h);
	AirUIFunctionEnd
)
ui.add_draw("up",
	AirUIFunctionStart
		var _xx = _x - corps_x_offset;
		up.position(_xx, _y, _xx + _w, _y + _h);
		up.draw();
	AirUIFunctionEnd
);
ui.add_draw("down", 
	AirUIFunctionStart
		var _xx = _x - corps_x_offset;
		down.position(_xx, _y, _xx + _w, _y + _h);
		down.draw();
	AirUIFunctionEnd
);
for (var i = 0; i < array_length(corps); i++) {
	var struct = {
		name : $"corp:{i}",
		flex : 1,
		height : "100%",
		margin : 2,
		data : {
			sprite : corps[i].sprite,
		}
	}
	var node = flexpanel_create_node(struct);
	var root = ui.get_child($"corps");
	flexpanel_node_insert_child(root, node, flexpanel_node_get_num_children(root));
	ui.add_draw($"corp:{i}",
		AirUIFunctionStart
		var color = selected_corp == real(string_digits(name)) ? c_aqua : c_white;
		airui_draw_sprite_centered(name, data.sprite, pos, airui_fit.height, 0.65, undefined, undefined, -corps_x_offset, undefined, color);
		AirUIFunctionEnd
	);
}

ui.recalculate();
ui.finish();
}
catch (error) {
	show_debug_message(error)	
}
