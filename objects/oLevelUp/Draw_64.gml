//feather ignore GM1041
//feather ignore GM2016
//yy += - input_check_pressed("up") + input_check_pressed("down");
//oo += (- input_check_pressed("left") + input_check_pressed("right")) * 0.05;
//show_debug_message($"o {oo}");
ui.foreach(function(name, pos, data) {
    var spr = data[$ "image"] != undefined ? asset_get_index(data.image) : undefined;
    spr = (spr != undefined and spr != -1) ? spr : sBlank;
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
    
    switch(name) {
		case "u0":
		case "u1":
		case "u2":
		case "u3":
			var opt = real(string_char_at(name, 2));
			var selected = selected_option == opt ? 1 : 0;
			draw_sprite_stretched(sHudUpgrade, selected, _x, _y, _w, _h);
			draw_sprite_centered_ext(sItemType, 0, _x + icon_x, _y + icon_y, icon_scale, icon_scale, 0, c_white, 1);
			scribble("[fa_bottom]Item Name").scale(title_scale).draw(_x + title_x, _y + title_y);
			scribble("[fa_right][fa_bottom]>> Weapon").scale(title_scale).draw(_x + _w - title_end_x, _y + title_y);
			scribble(lorem).scale(title_scale).wrap(_w - description_x_end, _h - description_y_end).draw(_x + description_x, _y + description_y);
			break;
		case "Eliminate":
			eliminate.position(_x, _y, _x + _w, _y + _h);
			eliminate.draw();
			break;
		case "Reroll":
			reroll.position(_x, _y, _x + _w, _y + _h);
			reroll.draw();
			break;
		case "Hold":
			hold.position(_x, _y, _x + _w, _y + _h);
			hold.draw();
			break;
        default:
			draw_set_alpha(0.5);
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
			draw_set_alpha(1);
	        break;
    }
	draw_rectangle(_x, _y, _x + _w, _y + _h, true);
});