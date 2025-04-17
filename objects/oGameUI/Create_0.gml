ui = new window(global.game_uis.stage, false);
ui.fit_to_gui();
tempui = new window(global.game_uis.stage, false);
tempui.fit_to_dimension(1280, 720);

#region surfaces
xpsurf = undefined;
tempsurf = surface_create(1280, 720);
itemssurf = surface_create(2,2);
surface_free(itemssurf);
#endregion

a = 1;
coinspr = new animated_sprite(sHolocoin);
GameData.kills = 0;
GameData.stage_coins = 0;

update_items = function(w, h) {
	tempsurf = surface_recreate(tempsurf, 1280, 720);
	var got = tempui.get_child("got_panel");
	var temppos = flexpanel_node_layout_get_position(got, false);
	itemssurf = surface_recreate(itemssurf, temppos.width, temppos.height); 
	surface_set_target(tempsurf);
	draw_clear_alpha(c_black, 0);
	tempui.foreach(function(name, pos, data) {
		var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
		var _xc = _x + (_w / 1.5), _yc = _y + (_h / 1.5);
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
					var _sw = sprite_get_width(wp.sprite) / 2;
					var _sh = sprite_get_height(wp.sprite) / 2;
	            	//draw_sprite_stretched(wp.sprite, wp.level == wp.max_level ? 1 : 0, _x + _sw, _y + _sh, _w - (_sw * 2), _h - (_sh * 2));
	            	//draw_sprite_ext(wp.sprite, wp.level == wp.max_level ? 1 : 0, _x + (_w / 2 ), _y + ((sprite_get_width(wp.sprite) * 2) / 2), sc, sc, 0, c_white, 1);
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
		}
	});
	surface_reset_target();
	surface_set_target(itemssurf);
	draw_clear_alpha(c_black, 0);
	draw_surface_part(tempsurf, temppos.left, temppos.top, temppos.width, temppos.height, 0, 0);
	surface_reset_target();
}
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
	        case "got_panel":
				update_items();
				draw_surface_stretched(itemssurf, _x, _y, _w, _h);
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