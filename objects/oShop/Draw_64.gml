//feather ignore GM1041
//yy += - input_check_pressed("up") + input_check_pressed("down");
//oo += (- input_check_pressed("left") + input_check_pressed("right")) * 0.05;
//show_debug_message($"o {oo}");
ui.foreach(function(name, pos, data) {
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
    if (!string_contains(name, "grid")) {
        draw_rectangle(_x, _y, _x + _w, _y + _h, true);	
    }
    
    switch(name) {
        case "tabs":
            var _hh = _h / array_length(tabs);
            draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
            for (var offset = 0, i = 0; i < array_length(tabs); i++) {
            	scribble($"[fa_center][fa_middle]{tabs[i]}").draw(_x + _w / 2, _y + _hh / 2 + offset);
                draw_rectangle(_x, _y + offset, _x + _w, _y + _hh + offset, true);
                offset += _hh;
            }
            break;
        case "items_panel":
            var item_width = _w / 3;
            var item_height = (_h / 4);
            var item_names = struct_get_names(Shop.upgrades);
            array_sort(item_names, true);
            for (var offset = 0, yoffset = 0, i = 0; i < array_length(item_names); i++) {
            	if (Shop.upgrades[$ item_names[i]].type != tabs[selected_tab]) {
                	continue;
                }
                if (_x + offset > _x + _w) {
                	offset = 0;
                	yoffset += item_height + 2;
                }
                //draw_rectangle(_x + offset, _y + yoffset, _x + offset + item_width, _y + yoffset + item_height, true);
                draw_sprite_stretched(sShopItemBG, 0, _x + offset, _y + yoffset, item_width, item_height);
                draw_sprite_ext(Shop.upgrades[$ item_names[i]].sprite, 0, _x + offset + item_sprite_x, _y + yoffset + item_sprite_y, item_sprite_scale, item_sprite_scale, 0, c_white, 1);
                //scribble($"[fa_center][fa_middle]{item_names[i]}").draw(_x + offset + item_width / 2, _y + yoffset + item_height / 2);
                offset += item_width + 5;
            }
            break;
        case "item_desc_panel":
            draw_sprite_stretched(sHudUpgrade, 1, _x, _y, _w, _h);
            if (selected_item == "null") {
            	break;
            }
            scribble($"[fa_bottom]{lexicon_text(Shop.upgrades[$ selected_item].name)}").scale(text_scale).draw(_x + text_offset, _y + text_yoffset);
            break;
        case "item_desc":
            scribble("Lorem Ipsum").scale(text_scale).draw(_x, _y);
            break;
        case "item_icon":
            if (selected_item == "null") {
            	break;
            }
            draw_sprite_stretched(sItemSquare, 0, _x, _y, _w, _h);
            draw_sprite_ext(Shop.upgrades[$ selected_item].sprite, 0, _x + _w / 2, _y + _h / 2, item_sprite_scale, item_sprite_scale, 0, c_white, 1);
            break;
        case "holocoins":
            draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
            draw_sprite_ext(coinspr.sprite, coinspr.get_frame(), _x - 30, _y + _h / 2, 3, 3, 0, c_white, 1);
            break;
        default:
	        break;
    }
});