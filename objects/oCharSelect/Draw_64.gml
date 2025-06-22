//feather ignore GM1041
ui.foreach(function(name, pos, data) {
    AirUIDefaultSpr;
	AirUIArea;
	
	var char_name = Characters[$ selected_char].uiname;
	var char_weapon = Weapons[$ Characters[$ selected_char].main_weapon];
	var chars = struct_get_names(GameData.characters);
	
    switch(name) {
		case "char_list_1":
			for (var offset = 0, yoffset = 0, i = 0; i <= 19; i++) {
				if (i > struct_names_count(GameData.characters) - 1) {
					break;
				}
				draw_sprite_stretched(GameData.characters[$ chars[i]].portrait, 0, _x + offset, _y + yoffset, 87, 63);
				if ((lmxx != mx or lmy != my) and mouse_in_area_gui([_x + offset, _y + yoffset, _x + offset + 87, _y + yoffset + 63])) {
					lmxx = mx;
					lmy = my;
					selected = i;
				}
				if (i == selected) {
					draw_sprite_stretched(sMenuCharSelectCursor, -1, _x + offset, _y + yoffset, 87, 63);
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
				if (i > struct_names_count(GameData.characters) - 1) {
					break;
				}
				draw_sprite_stretched(GameData.characters[$ chars[i]].portrait, 0, _x + offset, _y + yoffset, 87, 63);
				if ((lmxx != mx or lmy != my) and mouse_in_area_gui([_x + offset, _y + yoffset, _x + offset + 87, _y + yoffset + 63])) {
					lmxx = mx;
					lmy = my;
					selected = i;
				}
				if (i == selected) {
					draw_sprite_stretched(sMenuCharSelectCursor, -1, _x + offset, _y + yoffset, 87, 63);
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
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, false);
			var str = $"[c_black][fa_middle]{string_upper(char_name)}";
			scribble(str).scale(2).draw(_x, _y + _h / 2);
			break;
		
		case "weapon_name":
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
			draw_set_alpha(0.5);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, true);
			break;

		case "special_name":
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, false);
			var woffset = sprite_get_width_ext(sAkiSpecial, 2);
			var hoffset = sprite_get_height_ext(sAkiSpecial, 2);
			draw_sprite_centered_ext(sAkiSpecial, 0, _x + woffset / 2, (_y + _h / 2) + hoffset / 2, 2, 2, 0, c_white, 1);
			var str = "[c_black][fa_middle]Slow Time";
			scribble(str).scale(2).draw(_x + (woffset / 1.5), _y + _h / 2);
			break;
		case "special_description":
			draw_set_alpha(0.5);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, true);
			break;
		
		case "panel_61046":
			draw_set_alpha(0.5);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			draw_rectangle_color(_x, _y, _x + _w, _y + _h, c_white, c_white, c_white, c_white, true);
			break;
		
		/*case "base":
			draw_sprite_stretched(select, 0, _x, _y, _w, _h);
			break;*/
		
        default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});