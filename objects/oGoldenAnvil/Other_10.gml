ui.add_element("accept", accept);
for (var i = 0; i <= array_length(Player_Weapons); i++) {
	ui.add_draw($"w{i}",
		AirUIFunctionStart
		self[$ name] = area;
		var w = Player_Weapons[real(string_digits(name))];
		airui_draw_sprite_centered("sq", sItemSquare, pos, airui_fit.height, 1, 1, 0);
		if (!is_undefined(w)) {
			airui_draw_sprite_centered(name, w.sprite, pos, airui_fit.height, 0.75, 1, 0);
		}
		AirUIFunctionEnd
	);
}

ui.add_draw("s1",
	AirUIFunctionStart
	s1a = area;
	airui_draw_sprite_centered("sq1", sItemSquare, pos, airui_fit.height, 1, 1, 0);
	if (!is_undefined(s1)) {
		airui_draw_sprite_centered(name, s1.sprite, pos, airui_fit.height, 0.75, 1, 0);
	}
	AirUIFunctionEnd
);
ui.add_draw("s2",
	AirUIFunctionStart
	s2a = area;
	airui_draw_sprite_centered("sq1", sItemSquare, pos, airui_fit.height, 1, 1, 0);
	if (!is_undefined(s2)) {
		airui_draw_sprite_centered(name, s2.sprite, pos, airui_fit.height, 0.75, 1, 0);
	}
	AirUIFunctionEnd
);

ui.finish();
