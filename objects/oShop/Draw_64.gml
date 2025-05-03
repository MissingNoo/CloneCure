mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);
//feather ignore GM1041
//yy += - input_check_pressed("up") + input_check_pressed("down");
//oo += (- input_check_pressed("left") + input_check_pressed("right")) * 0.05;
//show_debug_message($"o {oo}");
ui.foreach(function(name, pos, data) {
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
    //if (!string_contains(name, "grid")) {
        //draw_rectangle(_x, _y, _x + _w, _y + _h, true);	
    //}
    switch(name) {
        case "tabs_panel":
            draw_sprite_stretched(sShopBar, 0, _x, _y, _w, _h);
			if (mouse_in_area_gui([_x, _y, _x + _w, _y + _h]) and mx != mxprevious and selecting != "buysell") {
				selecting = "tab";
			}
            if (selecting == "tab") {
            	draw_sprite_ext(sHoloCursor, 0, _x - sprite_get_width(sHoloCursor) + tab_arrow_offset, _y + _h / 2, tab_arrow_offset_scale, tab_arrow_offset_scale, 0, c_white, 1);
            }
            break;
        case "tabs":
            var _hh = _h / array_length(tabs);
            for (var offset = 0, i = 0; i < array_length(tabs); i++) {
                if (gui_click(_x, _y + offset, _x + _w, _y + offset + _hh) and selecting != "buysell") {
                	selected_tab = i;
                    update_tab();
                }
                
                draw_sprite_stretched(sHudShopCategory, i, _x, _y + offset, _w, _hh);
                var _color = "c_white";
                if (selected_tab == i) {
                	_color = "c_yellow";
                }
                var tabname = lexicon_text($"Shop.Tabs.{tabs[i]}");
            	scribble($"[{_color}][fa_middle]{tabname}").scale(category_text_scale).draw(_x + category_text_offset, _y + _hh / 2 + offset);
                if (_color == "c_white") {
                    draw_set_alpha(0.5);
                    draw_set_color(c_black);
                    draw_rectangle(_x, _y + offset, _x + _w, _y + _hh + offset, false);
                    draw_set_color(c_white);
                    draw_set_alpha(1);
                }
                offset += _hh;
            }
            break;
        case "items_panel":
            var item_width = _w / 3;
            var item_height = (_h / 4);
            var item_names = tab_items;
            for (var offset = 0, yoffset = 0, i = 0; i < array_length(item_names); i++) {
                if (_x + offset > _x + _w) {
                	offset = 0;
                	yoffset += item_height + 2;
                }
                if (mouse_in_area_gui([_x + offset, _y + yoffset, _x + offset + item_width, _y + yoffset + item_height])) {
					if (selecting != "buysell") {
						if (mx != mxprevious) {
							selecting = "item";
		                    selected_item_num = i;
		                	selected_item = item_names[i];
						} 
						if (device_mouse_check_button_released(0, mb_left)) {
							selecting = "buysell";
						}
					}
                }
                //draw_rectangle(_x + offset, _y + yoffset, _x + offset + item_width, _y + yoffset + item_height, true);
                draw_sprite_stretched(sShopItemBG, 0, _x + offset + item_s_offset, _y + yoffset + item_s_offset, item_width - (item_s_offset * 2), item_height - (item_s_offset * 2));
                draw_sprite_stretched(sShopLevel, array_length(Shop.upgrades[$ item_names[i]].cost), _x + offset + item_s_offset, _y + yoffset + item_s_offset, item_width - (item_s_offset * 2), item_height - (item_s_offset * 2));
                draw_sprite_stretched(sShopLevelFill, Shop.upgrades[$ item_names[i]].level, _x + offset + item_s_offset, _y + yoffset + item_s_offset, item_width - (item_s_offset * 2), item_height - (item_s_offset * 2));
                draw_sprite_ext(Shop.upgrades[$ item_names[i]].sprite, 0, _x + offset + item_sprite_x, _y + yoffset + item_sprite_y, item_sprite_scale, item_sprite_scale, 0, c_white, 1);
				if (Shop.upgrades[$ item_names[i]].level < array_length(Shop.upgrades[$ item_names[i]].cost)) {
					scribble($"[c_yellow][fa_middle][fa_center]{Shop.upgrades[$ item_names[i]].cost[Shop.upgrades[$ item_names[i]].level]}").scale(cost_scale).draw(_x + offset + cost_xoffset, _y + yoffset + cost_yoffset);
				} else {
					scribble($"[c_yellow][fa_middle][fa_center]SOLD!").scale(cost_scale).draw(_x + offset + cost_xoffset, _y + yoffset + cost_yoffset);
				}
                if ((selecting == "item" or selecting == "buysell") and selected_item == item_names[i]) {
                	draw_sprite_stretched(sShopItemSelected, 0, _x + offset, _y + yoffset, item_width, item_height);
                }
                //scribble($"[fa_center][fa_middle]{item_names[i]}").draw(_x + offset + item_width / 2, _y + yoffset + item_height / 2);
                offset += item_width + 5;
            }
            break;
        case "item_desc_panel":
            draw_sprite_stretched(sHudUpgrade, 1, _x, _y, _w, _h);
            if (selected_item == "null") {
            	break;
            }
            var iname = lexicon_text($"Shop.Upgrades.{selected_item}.name");
            scribble($"[fa_bottom]{iname}").scale(text_scale).draw(_x + text_offset, _y + text_yoffset);
            break;
        case "item_desc":
			if (selecting == "buysell") { break; }
            scribble(lexicon_text($"Shop.Upgrades.{selected_item}.desc")).wrap(desc_wrap).scale(text_scale).draw(_x, _y);
            break;
        case "item_icon":
            if (selected_item == "null") {
            	break;
            }
            draw_sprite_stretched(sItemSquare, 0, _x, _y, _w + 5, _h + 5);
            draw_sprite_ext(Shop.upgrades[$ selected_item].sprite, 0, _x + _w / 2, _y + _h / 2, item_sprite_scale, item_sprite_scale, 0, c_white, 1);
            break;
        case "holocoins":
            draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
            draw_sprite_ext(coinspr.sprite, coinspr.get_frame(), _x - 30, _y + _h / 2, 3, 3, 0, c_white, 1);
			scribble($"[fa_right][fa_bottom]{SaveData.money}").scale(coins_scale).draw(_x + _w - coins_offset, _y + coins_yoffset);
            break;
		case "buy":
			buybutton.position(_x, _y, _x + _w, _y + _h);
			buybutton.set_selected_area(_x - 10, _y - 5, _x + _w + 10, _y + _h + 5);
			if (selecting == "buysell") {
				buybutton.draw();
			}
			break;
		case "refund":
			sellbutton.position(_x, _y, _x + _w, _y + _h);
			sellbutton.set_selected_area(_x - 10, _y - 5, _x + _w + 10, _y + _h + 5);
			if (selecting == "buysell") {
				sellbutton.draw();	
			}
			break;
        default:
	        break;
    }
});