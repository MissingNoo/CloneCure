//feather ignore GM1041
//yy += - input_check_pressed("up") + input_check_pressed("down");
//oo += (- input_check_pressed("left") + input_check_pressed("right")) * 0.05;
//show_debug_message($"o {oo}");
ui.foreach(function(name, pos, data) {
    var spr = data[$ "image"] != undefined ? asset_get_index(data.image) : undefined;
    spr = (spr != undefined and spr != -1) ? spr : sBlank;
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
	
	var char_name = Characters[$ selected_char].uiname;
	var char_weapon = Weapons[$ Characters[$ selected_char].main_weapon];
	
	
    switch(name) {
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
		
        default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});