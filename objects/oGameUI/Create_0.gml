ui = new window(global.game_uis.stage, false);
ui.fit_to_gui();
xpsurf = undefined;
a = 1;
coinspr = new animated_sprite(sHolocoin);
GameData.kills = 0;
GameData.stage_coins = 0;
uisurf = surface_create(display_get_gui_width(), display_get_gui_height());
update_ui = function() {
	uisurf = surface_recreate(uisurf, display_get_gui_width(), display_get_gui_height());
	surface_set_target(uisurf);
	draw_clear_alpha(c_black, 0);
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
				draw_sprite_stretched(sPortraitFrame, 0, _x, _y, _w, _h);
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
			case "hp":
				draw_healthbar(_x, _y + 2, _x + _w, _y + _h - 6, (GameData.hp / GameData.max_hp) * 100, c_red, #14FF62, #14FF62, 0, 1, 0);
				draw_healthbar(_x, _y + 2, _x + _w, _y + 5, (GameData.hp / GameData.max_hp) * 100, c_red, #8CFFBD, #8CFFBD, 0, 1, 0); 
				draw_healthbar(_x, _y + _h - 6, _x + _w, _y + _h - 4, (GameData.hp / GameData.max_hp) * 100, c_red, #069617, #069617, 0, 1, 0);
				draw_sprite(sHPTitle, 0, _x, _y);
				scribble($"[fa_middle][sHFont]{GameData.hp} / {GameData.max_hp}").scale(1.5).draw(_x + _w + 8, _y + _h / 2 + 2);
				break;
	        default:
				draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
		        break;
	    }
	});
	surface_reset_target();
}
update_ui();