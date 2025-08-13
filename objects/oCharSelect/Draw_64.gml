//feather ignore GM1041
ui.foreach(function(name, pos, data) {
    AirUIDefaultSpr;
	AirUIArea;
	
	var char_name = Characters[$ selected_char].uiname;
	var char_weapon = Weapons[$ Characters[$ selected_char].main_weapon];
	var chars = struct_get_names(GameData.characters);
	if (!ui.node_is_visible(name)) {
		exit;
	}
    switch(name) {
		case "char_list_1":
			for (var offset = 0, yoffset = 0, i = 0; i <= 19; i++) {
				var xoff2 = charxoff * (i <= 9 ? 1 : -1);
				draw_set_color(c_black);
				draw_set_alpha(0.25);
				draw_rectangle(_x + offset - 1 + xoff2, _y + yoffset - 1, _x + offset + 88 + xoff2, _y + yoffset + 64, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
				draw_rectangle(_x + offset - 1 + xoff2, _y + yoffset - 1, _x + offset + 88 + xoff2, _y + yoffset + 64, true);
				if (i > struct_names_count(GameData.characters) - 1) {
					draw_sprite_centered(sAchLocked, 0, _x + offset + 44 + xoff2, _y + 31 + yoffset);
				} else {
					draw_sprite_stretched(GameData.characters[$ chars[i]].portrait, 0, _x + offset + xoff2, _y + yoffset, 87, 63);
					if (mouse_in_area_gui([_x + offset + xoff2, _y + yoffset, _x + offset + 87 + xoff2, _y + yoffset + 63])) {
                        if ((lmxx != mx or lmy != my)) {
                        	lmxx = mx;
                            lmy = my;
                            if (selected != i) {
        						selected = i;
        						select_char();
                            }
                        }
                        if (selected == i and device_mouse_check_button_released(0, mb_left)) {
                        	forcez = true;
                        }
					}
				}
				if (i == selected) {
					draw_sprite_stretched(sMenuCharSelectCursor, -1, _x + offset + xoff2, _y + yoffset, 87, 63);
				}
				offset += char1o;
				if (i == 9) {
					offset = 0;
					yoffset += char1yo;
				}
			}
			break;
		
		case "char_list_2":
			for (var offset = 0, yoffset = 0, i = 20; i <= 46; i++) {
				var xoff2 = 0;
				if (i >= 20) {
					xoff2 = charxoff * (i >= 20 ? 1 : -1);
				}
				if (i >= 29) {
					xoff2 = charxoff * (i >= 29 ? -1 : 1);
				}
				if (i >= 38) {
					xoff2 = charxoff * (i >= 38 ? 1 : -1);
				}
				draw_set_color(c_black);
				draw_set_alpha(0.25);
				draw_rectangle(_x + offset - 1 + xoff2, _y + yoffset - 1, _x + offset + 88 + xoff2, _y + yoffset + 64, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
				draw_rectangle(_x + offset - 1 + xoff2, _y + yoffset - 1, _x + offset + 88 + xoff2, _y + yoffset + 64, true);
				if (i > struct_names_count(GameData.characters) - 1) {
					draw_sprite_centered(sAchLocked, 0, _x + offset + 44 + xoff2, _y + 31 + yoffset);
				} else {
					draw_sprite_stretched(GameData.characters[$ chars[i]].portrait, 0, _x + offset + xoff2, _y + yoffset, 87, 63);
					if (mouse_in_area_gui([_x + offset + xoff2, _y + yoffset, _x + offset + 87, _y + yoffset + 63])) {
						if ((lmxx != mx or lmy != my)) {
							lmxx = mx;
							lmy = my;
							if (selected != i) {
								selected = i;
								select_char();
							}
						}
						if (selected == i and device_mouse_check_button_released(0, mb_left)) {
							forcez = true;
						}
					}
				}
				//draw_text(_x + offset + xoff2, _y + yoffset, i);
				if (i == selected) {
					draw_sprite_stretched(sMenuCharSelectCursor, -1, _x + offset + xoff2, _y + yoffset, 87, 63);
				}
				offset += char1o;
				if (i == 28 or i == 37) {
					offset = 0;
					yoffset += char1yo;
				}
			}
			break;
		
		case "label_title":
			draw_set_alpha(0.25);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			var str = "[fa_middle][fa_center]CHOOSE YOUR IDOL";
			scribble(str).scale(3).draw(_x + _w / 2, _y + _h / 2);
			break;
		
		case "char_name":
			_y -= character_selected_offset;
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, false);
			var str = $"[c_black][fa_middle]{string_upper(char_name)}";
			scribble(str).scale(2).draw(_x + 10, _y + _h / 2);
			break;
		
		case "weapon_name":
			_y -= character_selected_offset;
			var weapon_spr = char_weapon.sprite;
			var weapon_name = lexicon_text($"Weapons.{char_weapon.name}.name");
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, false);
			var woffset = sprite_get_width_ext(weapon_spr, 2) + sprite_get_width_ext(weapon_spr, 1);
			var hoffset = sprite_get_height_ext(weapon_spr, 2);
			draw_sprite_centered_ext(weapon_spr, 0, _x + woffset / 2, (_y + _h / 2) + hoffset / 2, 2, 2, 0, c_white, 1);
			var str = $"[c_black][fa_middle]{weapon_name}";
			scribble(str).scale(2).draw(_x + (woffset / 1.5), _y + _h / 2);
			break;
		case "weapon_description":
			_y -= character_selected_offset;
			draw_set_alpha(0.5);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, true);
			var str = lexicon_text($"Weapons.{char_weapon.name}.1");
			scribble(str).scale(2).wrap(_w).draw(_x + 10, _y + 10);
			break;

		case "special_name":
			_y -= character_selected_offset;
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, false);
			var woffset = sprite_get_width_ext(sAkiSpecial, 2);
			var hoffset = sprite_get_height_ext(sAkiSpecial, 2);
			draw_sprite_centered_ext(sAkiSpecial, 0, _x + woffset / 2, (_y + _h / 2) + hoffset / 2, 2, 2, 0, c_white, 1);
			var str = "[c_black][fa_middle]Slow Time";
			scribble(str).scale(2).draw(_x + (woffset / 1.5), _y + _h / 2);
			break;
		case "special_description":
			_y -= character_selected_offset;
			draw_set_alpha(0.5);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, true);
			//var text = lexicon_text($"Specials.{}")
			//scribble()
			break;
		
		case "panel_61046":
			_y -= character_selected_offset;
			draw_set_alpha(0.5);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, true); 
			break;
		
		case "char_sprite":
			_y -= character_selected_offset;
			var defog = false;
			if (!array_contains(SaveData.characters[$ selected_char].outfits, selected_skin_name)) {
				gpu_set_fog(true, c_black, 0, 0);
				defog = true;
			}
			draw_sprite_ext(charspr.sprite, charspr.get_frame(), (_x + _w  / 2), _y + _h / 1.5, skin_scale / 2, skin_scale / 2, 0, c_white, 1);
			if defog gpu_set_fog(false, c_black, 0, 0);
			break;
		
		case "stat_hp":
			_y -= character_selected_offset;
			draw_sprite_ext(sHudHPIcon, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudHPIcon, 2) + 5;
			draw_rectangle(_xx, _y + _h / 2, (_x + _w) - (100 - Characters[$ selected_char].hp), _y + _h, false);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]HP").scale(2).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{Characters[$ selected_char].hp}").scale(2).draw(_x + _w, _y + _h / 2 + 2);
			break;
		case "stat_atk":
			_y -= character_selected_offset;
			draw_sprite_ext(sHudATKIcon, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudATKIcon, 2) + 5;
			draw_rectangle(_xx, _y + _h / 2, (_x + _w) - (100 - (real(string_replace(Characters[$ selected_char].atk, "1.", "")) * 2)), _y + _h, false);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]ATK").scale(2).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{Characters[$ selected_char].atk}").scale(2).draw(_x + _w, _y + _h / 2 + 2);
			break;
		case "stat_spd":
			_y -= character_selected_offset;
			draw_sprite_ext(sHudSPDIcon, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudSPDIcon, 2) + 5;
			draw_rectangle(_xx, _y + _h / 2, (_x + _w) - (100 - (real(string_replace(Characters[$ selected_char].spd, "1.", "")) * 1.5)), _y + _h, false);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]SPD").scale(2).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{Characters[$ selected_char].spd}").scale(2).draw(_x + _w, _y + _h / 2 + 2);
			break;
		case "stat_crt":
			_y -= character_selected_offset;
			draw_sprite_ext(sHudCRTIcon, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudCRTIcon, 2) + 5;
			draw_rectangle(_xx, _y + _h / 2, (_x + _w) - (real(string_replace(Characters[$ selected_char].crit, "1.", "")) * 4), _y + _h, false);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]CRT").scale(2).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{string_replace(Characters[$ selected_char].crit, "1.", "")}%").scale(2).draw(_x + _w, _y + _h / 2 + 2);
			break;
		
		case "base":
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
			with (oTriangle) {
				draw_self();
			}
			draw_sprite_ext(Characters[$ selected_char].title_sprite, 0, 0 + charoffset, chary, charscale, charscale, 0, c_white, 0.8);
			draw_sprite_ext(Characters[$ selected_char].title_sprite, 0, gui_w - charoffset, chary, charscale * -1, charscale, 0, c_white, 0.8);
			break;
		
		default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
			 break;
    }
});

skinui.foreach(function(name, pos, data) {
	AirUIArea;
	_y += character_selected_max_offset - character_selected_offset;
	_x -= gui_w - stageoffset;
	switch (name) {
		case "skin_area":
			draw_sprite_stretched(sCharacterselected, 0, _x, _y, _w, _h);
			var defog = false;
			if (!array_contains(SaveData.characters[$ selected_char].outfits, selected_skin_name)) {
				gpu_set_fog(true, c_black, 0, 0);
				defog = true;
			}
			draw_sprite_centered_ext(charspr.sprite, charspr.get_frame(), (_x + _w / 2) + ((charspr.width * skin_scale) / 2), (_y + _h / 2) + ((charspr.height * skin_scale)), skin_scale, skin_scale, 0, c_white, 1);
			if defog gpu_set_fog(false, c_black, 0, 0);
			if (array_length(Characters[$ selected_char].skinorder) > 1) {
				draw_sprite_ext(sSelectArrow, selectarrow.get_frame(), _x + _w / 2, _y + _h / 2, 2, 2, 0, c_white, 1);
				var _x1 = (_x + _w / 2);
				var _w1 = (sprite_get_width_ext(sSelectArrow, 2) / 2);
				var _y1 = (_y + _h / 2);
				var _h1 = (sprite_get_height_ext(sSelectArrow, 2) / 2);
				if (gui_click(_x1 - _w1, _y1 - _h1, _x1, _y1 + _h1)) {
					left_right = -1;
				}
				if (gui_click(_x1, _y1 - _h1, _x1 + _w1, _y1 + _h1)) {
					left_right = 1;
				}
				if (mouse_in_area_gui(area) and !mouse_in_area_gui([_x1 - _w1, _y1 - _h1, _x1 + _w1, _y1 + _h1])) {
					if (device_mouse_check_button_released(0, mb_left)) {
						forcez = true;
					}
				}
			} else {
				if (mouse_in_area_gui(area)) {
					if (device_mouse_check_button_released(0, mb_left)) {
						forcez = true;
					}
				}
			}
			 
			break;
		case "back_panel":
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(_x, _y, _x + _w, _y + _h, false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			break;
	}
});

stageui.foreach(function(name, pos, data) {
	AirUIArea;
	_x += stageoffset;
	area[0] += stageoffset;
	area[2] += stageoffset;
	
	switch (name) {
		case "time":
			time.position_area(area);
			time.draw();
			break;
		case "endless":
			endless.position_area(area);
			endless.draw();
			break;
		case "stage":
			stage.position_area(area);
			stage.draw();
			break;
		case "back_panel":
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(_x, _y, _x + _w, _y + _h, false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			break;
	}
});

stageinfo.foreach(function(name, pos, data) {
	AirUIArea;
	_x += stageoffset + gui_w;
	area[0] += stageoffset +  gui_w;
	area[2] += stageoffset + gui_w;
	switch (name) {
		case "title":
			scribble("[fa_center][fa_middle][c_white]CHOOSE STAGE").scale(3).draw(_x + _w / 2, _y + _h / 2);
			break;
		case "stage_icon":
			draw_sprite_stretched(selected_stage.bg, 0, _x, _y, _w, _h);
			if (mouse_in_area_gui(area)) {
				if (device_mouse_check_button_released(0, mb_left)) {
					forcez = true;
				}
			}
			break;
		case "holocoins":
			scribble($"Holocoin: [sHolocoin]x {selected_stage.multiplier}").scale(2).draw(_x, _y);
			break;
		case "upgrades":
			scribble($"Recommended Upgrades:").scale(2).draw(_x, _y);
			for (var yo = 0, i = 0; i < array_length(selected_stage.recomendation); i++) {
				var r = selected_stage.recomendation[i];
				var upg = Shop.upgrades[$ r[0]];
				var color = upg.level >= r[1] ? "c_white" : "c_red";
				scribble($"[fa_right][fa_center][{sprite_get_name(upg.sprite)}][{color}]  x  LV {r[1]}").scale(recscale).draw(_x + _w / 2, _y + yo + recsyoff);
				yo += recyoff;
			}
			break;
		case "back_panel":
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(_x, _y, _x + _w, _y + _h, false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			break;
	}
});