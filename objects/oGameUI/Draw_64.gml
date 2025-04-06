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
            	draw_sprite_ext(wp.perk ? sUiLevelHeaderPink: sUiLevelHeaderWhite, 0, _x, _y + _h, 2, 2, 0, c_white, 1);
            	draw_sprite_ext(wp.perk ? sUiDigitPink : sUiDigitWhite, wp.level, _x, _y + _h, 2, 2, 0, c_white, 1);
            } 
            break;
        case "i0":
        case "i1":
        case "i2":
        case "i3":
        case "i4":
        case "i5":
			//TODO: items
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
		case "stage":
			var str = $"[fa_middle][fa_center]{GameData.stage_mode}"
			scribble(str).scale(1).draw(_x - (string_width_scribble(str) / 2), _y);
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
            //scribble($"[fDmg]{minutes} : {seconds}").scale_to_box(_w, _h, true).draw(_x, _y);
			var str = $"[fDmg][fa_middle][fa_center]{minutes}:{seconds}";
            scribble(str).scale(1).draw(_x, _y);
		case "xp":
			xpsurf = surface_recreate(xpsurf, sprite_get_width(spr), sprite_get_height(spr));
			surface_set_target(xpsurf);
			draw_sprite(spr, 0, 0, 0);
			draw_sprite_part(sExpBar, -1, 0, 0, ((GameData.xp / GameData.needed_xp) * sprite_get_width(sExpBar)), sprite_get_height(sExpBarBG), 0, 0);
			draw_sprite(sExpBarBG, 1, 0, 0);
			surface_reset_target();
			draw_surface_stretched(xpsurf, 0, 0, gui_x_percent(100), surface_get_height(xpsurf) * 1.5);
			break;
		case "killspr":
			draw_sprite_stretched(sHuddefeatedEnemies, 0, _x, _y, _w, _h);
			break;
		case "kills":
			var str = $"[fa_middle][fDmg]{GameData.kills}";
            scribble(str).scale(1).draw(round(_x + (_w / 2)), round(_y + (_h / 2)));
			break;
		case "coin":
			draw_sprite_stretched(coinspr.sprite, coinspr.get_frame(), _x, _y, _w, _h);
			break;
		case "money":
			var str = $"[fa_middle][fDmg]{GameData.stage_coins}";
            scribble(str).scale(1).draw(round(_x + (_w / 2)), round(_y + (_h / 2)));
			break;
        default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});