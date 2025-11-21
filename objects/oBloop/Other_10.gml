ui.add_draw("money",
	AirUIFunctionStart
	draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
	airui_draw_sprite_centered("money", sHolocoin, pos, airui_fit.height, 0.5, 1, 0);
	scribble($"[fa_right][fa_middle]{SaveData.money}").draw(_x + _w - 5, _y + _h / 2);
	AirUIFunctionEnd
);
ui.add_draw("shop_title",
	AirUIFunctionStart
	var st = state.get_current_state()
	if (st != "idle" and st != "menu") {
		scribble($"[fa_center][fa_middle]Bloop's Fish Shop'").scale(3).draw(_x + _w / 2, _y + _h / 2);
	}
	AirUIFunctionEnd
);
ui.add_draw("dust",
	AirUIFunctionStart
	draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
	airui_draw_sprite_centered("dust", sSand, pos, airui_fit.height, 0.5, 1, 0);
	scribble($"[fa_right][fa_middle]{SaveData.money}").draw(_x + _w - 5, _y + _h / 2);
	AirUIFunctionEnd
);
ui.add_draw("shop_panel",
	AirUIFunctionStart
	var st = state.get_current_state()
	if (st != "idle" and st != "menu") {
		draw_set_alpha(0.5);
		draw_set_colour(c_black);
		draw_rectangle(_x, _y, _x + _w, _y + _h, false);
		draw_set_colour(c_white);
		draw_set_alpha(1);
		draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
	}
	AirUIFunctionEnd
);
ui.add_element("buy", buy);
ui.add_element("sell", sell);
ui.add_element("exchange", exchange);
ui.add_element("talk", talk);
ui.add_element("quit", quit);
ui.finish();