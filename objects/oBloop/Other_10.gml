ui.add_draw("money",
	AirUIFunctionStart
	draw_set_alpha(0.5);
	draw_set_colour(c_black);
	draw_rectangle(_x, _y, _x + _w, _y + _h, false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
	pos = variable_clone(pos);
	pos.left -= _w / 2;
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
	draw_set_alpha(0.5);
	draw_set_colour(c_black);
	draw_rectangle(_x, _y, _x + _w, _y + _h, false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_sprite_stretched(sShopSelected, 0, _x, _y, _w, _h);
	pos = variable_clone(pos);
	pos.left -= _w / 2;
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
ui.add_draw("shop_items",
	AirUIFunctionStart
	if (state.get_current_state() == "buy") {
		buysurfacebase = surface_recreate(buysurfacebase, gui_w, gui_h);
		buysurface = surface_recreate(buysurface, _w, _h);
		var voffset = _h / 3;
		surface_set_target(buysurfacebase);
			draw_clear_alpha(c_black, 0);
			gpu_set_scissor({x : _x, y: _y, w : _w, h : _h});
			var alpha = clamp(abs(sine_wave(current_time  / 725, 3, 1, 0)), 0.4, 0.85);
			draw_set_alpha(alpha);
			draw_rectangle(_x, _y + (voffset * buyselected), _x + _w, _y + (_h / 3) + (voffset * buyselected), false);
			draw_set_alpha(1);
		surface_reset_target();
		surface_set_target(buysurface);
			draw_clear_alpha(c_black, 0);
		surface_reset_target();
		surface_copy_part(buysurface, 0, 0, buysurfacebase, _x, _y, _w, _h);
		draw_surface_stretched(buysurface, _x, _y, _w, _h);
	}
	AirUIFunctionEnd
);
ui.add_element("buy", buy);
ui.add_element("sell", sell);
ui.add_element("exchange", exchange);
ui.add_element("talk", talk);
ui.add_element("quit", quit);
ui.finish();