///UI
ui = new window(variable_clone(global.game_uis.select), false);
ui.fit_to_gui();


draw_stat = function (_spr, _var, mult, _x, _y, _w, _h, pos) {
	var thispos = variable_clone(pos);
	thispos.top = _y;
	airui_draw_sprite_centered($"st{_var}", _spr, thispos, airui_fit.height, 0.75, 1, 0, - pos.width / 1.85, - pos.height / 3.5);
	//draw_sprite_ext(_spr, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(_spr, 2) + 5;
			draw_rectangle(
				_xx,
				_y + _h / 2,
				(_x + _w)
					- (
						100
							- (
								real(
									string_replace(
										Characters[$ selected_char][$_var],
										"1.",
										""
									)
								) * mult
							)
					),
				_y + _h,
				false
			);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble($"[fa_middle]{string_upper(_var)}").scale_to_box(_w, _h * 0.65, true).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{Characters[$ selected_char].spd}")
				.scale_to_box(_w, _h * 0.65, true)
				.draw(_x + _w, _y + _h / 2 + 2);
}
ui.add_draw("stat_crt",
	AirUIFunctionStart
	draw_stat(sHudCRTIcon, "crit", 4, _x, _y - character_selected_offset, _w, _h, pos); 
	AirUIFunctionEnd
);
ui.add_draw("stat_spd",
	AirUIFunctionStart
	draw_stat(sHudSPDIcon, "spd", 1.5, _x, _y - character_selected_offset, _w, _h, pos); 
	AirUIFunctionEnd
);
ui.add_draw("stat_atk",
	AirUIFunctionStart
	draw_stat(sHudATKIcon, "atk", 2, _x, _y - character_selected_offset, _w, _h, pos); 
	AirUIFunctionEnd
);
ui.add_draw("stat_hp",
	AirUIFunctionStart
	_y -= character_selected_offset;
	var thispos = variable_clone(pos);
	thispos.top = _y;
			airui_draw_sprite_centered($"sthp", sHudHPIcon, thispos, airui_fit.height, 0.75, 1, 0, - pos.width / 1.85, -pos.height / 3.5);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudHPIcon, 2) + 5;
			draw_rectangle(
				_xx,
				_y + _h / 2,
				(_x + _w) - (100 - Characters[$ selected_char].hp),
				_y + _h,
				false
			);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]HP").scale_to_box(_w, _h * 0.65, true).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{Characters[$ selected_char].hp}")
				.scale_to_box(_w, _h * 0.65, true)
				.draw(_x + _w, _y + _h / 2 + 2);
	AirUIFunctionEnd
);
ui.add_draw("base",
	AirUIFunctionStart
	draw_sprite_stretched(sTitleBG, 0, _x, _y, _w, _h);
			with (oTriangle) {
				draw_self();
			}
			draw_sprite_ext(
				Characters[$ selected_char].title_sprite,
				0,
				0 + charoffset,
				chary,
				charscale,
				charscale,
				0,
				c_white,
				0.8
			);
			draw_sprite_ext(
				Characters[$ selected_char].title_sprite,
				0,
				gui_w - charoffset,
				chary,
				charscale * -1,
				charscale,
				0,
				c_white,
				0.8
			);
	AirUIFunctionEnd
);
ui.add_draw("panel_61046",
	AirUIFunctionStart
	_y -= character_selected_offset;
			draw_set_alpha(0.5);
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_black,
				c_black,
				c_black,
				c_black,
				false
			);
			draw_set_alpha(1);
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_white,
				c_white,
				c_white,
				c_white,
				true
			);
	AirUIFunctionEnd
);
ui.add_draw("special_description",
	AirUIFunctionStart
	_y -= character_selected_offset;
			draw_set_alpha(0.5);
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_black,
				c_black,
				c_black,
				c_black,
				false
			);
			draw_set_alpha(1);
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_white,
				c_white,
				c_white,
				c_white,
				true
			);
			//var text = lexicon_text($"Specials.{}")
			//scribble()
	AirUIFunctionEnd
);
ui.add_draw("label_title",
	AirUIFunctionStart
	draw_set_alpha(0.25);
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_black,
				c_black,
				c_black,
				c_black,
				false
			);
			draw_set_alpha(1);
			var str = "[fa_middle][fa_center]CHOOSE YOUR IDOL";
			scribble(str).scale_to_box(_w, _h * 0.75, true).draw(_x + _w / 2, _y + _h / 2);
	AirUIFunctionEnd
);
ui.add_draw("weapon_description",
	AirUIFunctionStart
	var char_weapon = Weapons[$ Characters[$ selected_char].main_weapon];
	_y -= character_selected_offset;
			draw_set_alpha(0.5);
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_black,
				c_black,
				c_black,
				c_black,
				false
			);
			draw_set_alpha(1);
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_white,
				c_white,
				c_white,
				c_white,
				true
			);
			var str = lexicon_text($"Weapons.{char_weapon.name}.1");
			scribble(str).scale(2).wrap(_w).draw(_x + 10, _y + 10);
	AirUIFunctionEnd
);
ui.add_draw("special_name",
	AirUIFunctionStart
	_y -= character_selected_offset;
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_white,
				c_white,
				c_white,
				c_white,
				false
			);
			var woffset = sprite_get_width_ext(sAkiSpecial, global.flexcache.get("specialspr") ?? 1);
			airui_draw_sprite_centered("specialspr", sAkiSpecial, pos, airui_fit.height, 0.8, 1, 0, - (pos.width / 2) + (woffset / 2), - character_selected_offset);
			var str = "[c_black][fa_middle]Slow Time";
			scribble(str).scale_to_box(_w, _h * 0.75, true).draw(_x + woffset, _y + _h / 2);
	AirUIFunctionEnd
	);
ui.add_draw("weapon_name",
	AirUIFunctionStart
			_y -= character_selected_offset;
			var char_weapon = Weapons[$ Characters[$ selected_char].main_weapon];
			var weapon_spr = char_weapon.sprite;
			var weapon_name = lexicon_text($"Weapons.{char_weapon.name}.name");
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_white,
				c_white,
				c_white,
				c_white,
				false
			);
			var woffset = sprite_get_width_ext(weapon_spr, global.flexcache.get("wspr") ?? 1);
			airui_draw_sprite_centered("wspr", weapon_spr, pos, airui_fit.height, 0.8, 1, 0, - (pos.width / 2) + (woffset / 2), - character_selected_offset);
			var str = $"[c_black][fa_middle]{weapon_name}";
			scribble(str).scale_to_box(_w, _h * 0.75, true).draw(_x + woffset, _y + _h / 2);
	AirUIFunctionEnd
	);
ui.add_draw("char_name",
	AirUIFunctionStart
			_y -= character_selected_offset;
			draw_rectangle_color(
				_x,
				_y,
				_x + _w,
				_y + _h,
				c_white,
				c_white,
				c_white,
				c_white,
				false
			);
			var char_name = Characters[$ selected_char].uiname;
			var str = $"[c_black][fa_middle]{string_upper(char_name)}";
			scribble(str).scale_to_box(_w, _h * 0.75, true).draw(_x + 10, _y + _h / 2);
	AirUIFunctionEnd
);
ui.add_draw("char_sprite",
	AirUIFunctionStart
		var thispos = variable_clone(pos);
			var defog = false;
			if (
				!array_contains(
					SaveData.characters[$ selected_char].outfits,
					selected_skin_name
				)
			) {
				gpu_set_fog(true, c_black, 0, 0);
				defog = true;
			}
			
			airui_draw_sprite_centered("charspra", charspr.sprite, pos, airui_fit.height, 0.8, 1, charspr.get_frame(), undefined, - character_selected_offset + (pos.height / 2));
			//draw_rectangle(pos.left, pos.top, pos.left + pos.width, pos.top + pos.height, true);
			//draw_sprite_ext(
				//charspr.sprite,
				//charspr.get_frame(),
				//(_x + _w / 2),
				//_y + _h / 1.5,
				//skin_scale / 2,
				//skin_scale / 2,
				//0,
				//c_white,
				//1
			//);
			if (defog) {
				gpu_set_fog(false, c_black, 0, 0);
			}
	AirUIFunctionEnd
);
	
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
