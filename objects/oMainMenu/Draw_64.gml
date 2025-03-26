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
        case "version":
            scribble("[Fnt]Version 0.7.1740637402").scale_to_box(_w, _h, true).draw(_x, _y);
            break;
        case "title":
            _y += sine_between(current_time / 1000, 6, -10, 7);
            draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
            break;
        case "panel_btn":
            draw_sprite_stretched(spr, 0, 0, _y, gui_x_percent(100), _h);
            draw_set_alpha(0.75);
            for (var i = 0; i < array_length(bars); i++) {
                draw_line_width_color(bars[i][0], _yc + bars[i][1], bars[i][0] + bars[i][2], _yc + bars[i][1], 2, #788dab, #3573a9);
            }
            draw_set_alpha(1);
            break;
        default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});