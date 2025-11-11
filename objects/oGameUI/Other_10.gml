#region draws
ui.add_draw("w0", 
	AirUIFunctionStart
	draw_weapon(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("w1", 
	AirUIFunctionStart
	draw_weapon(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("w2", 
	AirUIFunctionStart
	draw_weapon(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("w3", 
	AirUIFunctionStart
	draw_weapon(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("w4", 
	AirUIFunctionStart
	draw_weapon(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("w5", 
	AirUIFunctionStart
	draw_weapon(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("i0", 
	AirUIFunctionStart
	draw_item(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("i1", 
	AirUIFunctionStart
	draw_item(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("i2", 
	AirUIFunctionStart
	draw_item(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("i3", 
	AirUIFunctionStart
	draw_item(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("i4", 
	AirUIFunctionStart
	draw_item(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("i5", 
	AirUIFunctionStart
	draw_item(_x, _y, _w, _h, name);
	AirUIFunctionEnd
);
ui.add_draw("kills", 
	AirUIFunctionStart
	var str = $"[fa_middle][fDmg]{GameData.kills}";
	scribble(str).scale(1).draw(round(_x + (_w / 2)), round(_y + (_h / 2)));
	AirUIFunctionEnd
);
ui.add_draw("coin", 
	AirUIFunctionStart
	draw_sprite_stretched(
				coinspr.sprite,
				coinspr.get_frame(),
				_x,
				_y,
				_w,
				_h
			);
	AirUIFunctionEnd
);
ui.add_draw("money", 
	AirUIFunctionStart
	var str = $"[fa_middle][fDmg]{GameData.stage_coins}";
	scribble(str).scale(1).draw(round(_x + (_w / 2)), round(_y + (_h / 2)));
	AirUIFunctionEnd
);
ui.add_draw("hp", 
	AirUIFunctionStart
	draw_healthbar(
				_x,
				_y + 2,
				_x + _w,
				_y + _h - 6,
				(GameData.hp / GameData.max_hp) * 100,
				c_red,
				#14FF62,
				#14FF62,
				0,
				1,
				0
			);
			draw_healthbar(
				_x,
				_y + 2,
				_x + _w,
				_y + 5,
				(GameData.hp / GameData.max_hp) * 100,
				c_red,
				#8CFFBD,
				#8CFFBD,
				0,
				1,
				0
			);
			draw_healthbar(
				_x,
				_y + _h - 6,
				_x + _w,
				_y + _h - 4,
				(GameData.hp / GameData.max_hp) * 100,
				c_red,
				#069617,
				#069617,
				0,
				1,
				0
			);
			draw_sprite(sHPTitle, 0, _x, _y);
			scribble($"[fa_middle][sHFont]{GameData.hp} / {GameData.max_hp}")
				.scale(1.5)
				.draw(_x + _w + 8, _y + _h / 2 + 2);
	AirUIFunctionEnd
);
ui.add_draw("exp", 
	AirUIFunctionStart
	if (surface_exists(xpsurf)) {
		draw_surface_stretched(xpsurf, _x, _y, _w, _h);
	}
	AirUIFunctionEnd
);
ui.add_draw("stage", 
	AirUIFunctionStart
	var minutes = global.minutes;
	if (minutes < 10) {
		minutes = $"0{minutes}";
	}
	var seconds = floor(global.seconds);
	if (seconds < 10) {
		seconds = $"0{seconds}";
	}
	//scribble($"[fDmg]{minutes} : {seconds}").scale_to_box(_w, _h, true).draw(_x, _y);
	var strm = $"[ffnt][fa_middle][fa_center]{minutes}:{seconds}";
	var str = $"[fa_middle][fa_center]{GameData.stage_mode}";
	scribble(str).scale(1).draw(_x + _w / 2, (_y + _h / 2) - string_height_scribble(strm));
	scribble(strm).scale(1).draw(_x + _w / 2, _y + _h / 2);
	AirUIFunctionEnd
);
ui.finish();
#endregion