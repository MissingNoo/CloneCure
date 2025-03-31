//feather ignore GM1041
//yy += - input_check_pressed("up") + input_check_pressed("down");
//oo += (- input_check_pressed("left") + input_check_pressed("right")) * 0.05;
//show_debug_message($"o {oo}");
ui.foreach(function(name, pos, data) {
    var spr = data[$ "image"] != undefined ? asset_get_index(data.image) : undefined;
    spr = (spr != undefined and spr != -1) ? spr : sBlank;
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
    var _xc = _x + (_w / 1.5), _yc = _y + (_h / 1.5);
    //draw_rectangle(_x, _y, _x + _w, _y + _h, true);
    if (string_contains(name, "button")) {
        var o = 19;
        var yy = 6;
        buttons[$ name].position(_x - o, _y - o - yy, _x + _w + o, _y - yy + _h + o);
        buttons[$ name].sprite = asset_get_index($"sTitle{string_first_letter_upper_case(string_replace(name, "button_", ""))}");
        buttons[$ name].use_text = false;
        buttons[$ name].sprite_back = undefined;
        buttons[$ name].draw();
        if (buttons[$ name].on_area) {
        	scribble($"[Fnt][fa_center][fa_top]{string_first_letter_upper_case(string_replace(name, "button_", ""))}").scale(0.30).draw(_xc - 10, _y + _h + 5);
        }
    }
    
    switch(name) {
        case "chars":
            var _ox = _x;
            _x += sprite_get_width(sTitleAme) * 2;
            _y += (sprite_get_width(sTitleAme) * 2 + 30) - start_y;
            //var chars = struct_get_names(Characters);
            //repeat (30) {
            	//array_push(chars, chars[irandom(array_length(chars) - 1)]);
            //}
            for (var row = 1, layer_dist = 0, xoffset = 0, yoffset = 0, i = 0; i < array_length(chars); i++) {
                var n = string_split(chars[i], "_");
                var si = sine_between(current_time / 1000, clamp((string_length(n[0]) * 2) / (string_length(n[1]) / 4), -3, 5), 10, -10);
                var tspr = Characters[$ chars[i]].title_sprite;
                gpu_set_fog(!Characters[$ chars[i]].unlocked, Characters[$ chars[i]].locked_color, 0, 0);
            	draw_sprite_centered_ext(tspr, 0, _x + xoffset, _y + si + yoffset, 2, 2, 0, c_white, 1);
                gpu_set_fog(false, 0, 0, 0);
                if (_x + xoffset > title_x and yoffset == 0) {
                	do {
                    	xoffset++;
                    } until (_x + xoffset > title_x_end - (sprite_get_width(sTitleAme) * 1));
                }
                xoffset += (sprite_get_width(tspr) * 1.20) - layer_dist;
                if (_x + xoffset > _ox + _w - sprite_get_width(sTitleAme) - (layer_dist * 5)) {
                	yoffset += sprite_get_height(sTitleAme) * 1.25;
                    row++;
                    xoffset = 0;
                    layer_dist += 20;
                    _x += layer_dist;
                    layer_dist = layer_dist / row;
                }
            }
            break;
        case "version":
            scribble("[Fnt]Version 0.7.1740637402").scale_to_box(_w, _h, true).draw(_x, _y);
            break;
        case "title":
            title_x ??= _x - 10;
            title_x_end ??= _x + _w;
            _y += (sine_between(current_time / 1000, 6, -10, 7)) - start_y;
            draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
            break;
        case "panel_btn":
			if (array_length(bars) < 30) {
				array_push(bars, [-100, irandom_range(_y, _y + _h), irandom_range(40, 100), irandom_range(7, 20)]);
			}
            draw_sprite_stretched(spr, 0, 0, _y, gui_x_percent(100), _h);
            draw_set_alpha(0.75);
            for (var i = 0; i < array_length(bars); i++) {
                draw_line_width_color(bars[i][0], bars[i][1], bars[i][0] + bars[i][2], bars[i][1], 2, #788dab, #3573a9);
            }
            draw_set_alpha(1);
            break;
        default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});