//feather ignore GM1041
//feather ignore GM2016
ui.foreach(function(name, pos, data) {
    var spr = data[$ "image"] != undefined ? asset_get_index(data.image) : undefined;
    spr = (spr != undefined and spr != -1) ? spr : sBlank;
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
    
    if (string_contains(name, "button")) {
        buttons[$ name].position(_x, _y, _x + _w, _y + _h);
        buttons[$ name].set_selected_area(_x - 19, _y - 5, _x + _w + 19, _y + _h + 5);
        buttons[$ name].draw(); 
    }
    
    switch(name) {
        default:
            draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});

stats.foreach(function(name, pos, data) {
    var spr = data[$ "image"] != undefined ? asset_get_index(data.image) : undefined;
    spr = (spr != undefined and spr != -1) ? spr : sBlank;
	var _x = pos.left + start_x, _y = pos.top, _w = pos.width, _h = pos.height;
	//if (!string_contains(name, "panel") and !string_contains(name, "name")) {
	var hud_spr = asset_get_index($"sHud{name}Icon");
	if (hud_spr != -1) {
		draw_line_width(_x + line_start, _y + _h - line_y, _x + _w - line_end, _y + _h - line_y, 2);
		scribble(string_upper($"{name}")).scale(text_scale).draw(_x + line_start, _y + text_y);
		draw_sprite_ext(hud_spr, 0, _x + icon_x_offset, _y + icon_y_offset, icon_scale, icon_scale, 0, c_white, 1);
	}
	//}
	var char= GameData.characters[$ GameData.selected_character];
    switch(name) {
		case "back":
			spr = char.title_sprite;
			draw_sprite_centered_ext(spr, 0, _x + sprite_get_width(spr) / 1.6, _y + sprite_get_height(spr), 4, 4, 0, c_white, 0.5);
			break;
		case "name":
			var charname = string_replace(string_upper(char.name), "_", " ");
			scribble($"[fa_right]{charname}").scale(2).draw(_x + _w - line_end, _y);
			break;
		case "HP":
			var hp = GameData.hp;
			var max_hp = GameData.max_hp;
			scribble($"[fa_right]{hp} / {max_hp}").scale(text_scale).draw(_x + _w - line_end, _y + text_y);
			break;
        default:
			var value = GameData[$ name];
			if (!is_undefined(value)) {
				scribble($"[fa_right]{value >= 0 ? "+" : ""}{value}%").scale(text_scale).draw(_x + _w - line_end, _y + text_y);
			}
	        break;
    }
});