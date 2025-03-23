//feather ignore GM1041
ui.foreach(function(name, pos, data) {
    var spr = data[$ "image"] != undefined ? asset_get_index(data.image) : undefined;
    spr = (spr != undefined and spr != -1) ? spr : sBlank;
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
    var _xc = _x + (_w / 1.5), _yc = _y + (_h / 1.5);
    //draw_rectangle(_x, _y, _x + _w, _y + _h, true);
    switch(name) {
        case "w0":
        case "w1":
        case "w2":
        case "w3":
        case "w4":
        case "w5":
            draw_sprite_centered_ext(sUiEmptySlotWeapon, 0, _xc, _yc, 2, 2, 0, c_white, 0.5);
            var wp = Player_Weapons[real(string_digits(name))];
            if (wp != undefined) {
            	draw_sprite_ext(wp.sprite, wp.level == wp.max_level ? 1 : 0, _x + (_w / 2 ), _y + ((sprite_get_width(wp.sprite) * 2) / 2), 2, 2, 0, c_white, 1);
            	draw_sprite_ext(sUiLevelHeaderPink, 0, _x, _y + _h, 2, 2, 0, c_white, 1);
            	draw_sprite_ext(wp.perk ? sUiDigitPink : sUiDigitWhite, wp.level, _x, _y + _h, 2, 2, 0, c_white, 1);
            } 
            break;
        case "i0":
        case "i1":
        case "i2":
        case "i3":
        case "i4":
        case "i5":
            draw_sprite_centered_ext(sUiEmptySlotItem, 0, _xc, _yc, 2, 2, 0, c_white, 0.5);
            break;
        case "portrait":
            if (GameData.selected_character == noone) {
            	break;
            }
            var port = GameData.characters[$ GameData.selected_character].portrait;
            draw_sprite_stretched(sUiPortraitBg, 0, _x, _y, _w, _h);
            draw_sprite_stretched(port, 0, _x, _y, _w, _h);
            draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
            break;
        case "time":
            var minutes = global.minutes;
            if (minutes < 10) {
            	minutes = $"0{minutes}";
            }
            var seconds = floor(global.seconds);
            if (seconds < 10) {
            	seconds = $"0{seconds}";
            }
            scribble($"{minutes} : {seconds}").scale_to_box(_w, _h, true).draw(_x, _y);
        default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});