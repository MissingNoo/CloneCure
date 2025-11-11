#region draws
ui.add_draw("killspr", 
	AirUIDefaultDraw
);
ui.add_draw("got_items", 
	AirUIDefaultDraw
);
for (var i = 0; i <= 5; i++) { //Add weapon and items draw func
	ui.add_draw($"w{i}", 
		AirUIFunctionStart
		draw_item(_x, _y, _w, _h, name, Player_Weapons, sUiLevelHeaderWhite, sUiDigitWhite, sUiEmptySlotWeapon);
		AirUIFunctionEnd
	);
	ui.add_draw($"i{i}", 
		AirUIFunctionStart
		draw_item(_x, _y, _w, _h, name, Player_Items, sUiLevelHeaderYellow, sUiDigitYellow, sUiEmptySlotItem);
		AirUIFunctionEnd
	);
}
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
	draw_healthbar(
				_x,
				_y + 2,
				_x + _w,
				_y + _h - 6,
				(GameData.xp / GameData.needed_xp) * 100,
				c_red,
				#5EDDEE,
				#5EDDEE,
				0,
				1,
				0
			);
			draw_healthbar(
				_x,
				_y + 2,
				_x + _w,
				_y + 5,
				(GameData.xp / GameData.needed_xp) * 100,
				c_red,
				#90E4F0,
				#90E4F0,
				0,
				1,
				0
			);
			draw_healthbar(
				_x,
				_y + _h - 6,
				_x + _w,
				_y + _h - 4,
				(GameData.xp / GameData.needed_xp) * 100,
				c_red,
				#56C3D8,
				#56C3D8,
				0,
				1,
				0
			);
	draw_sprite(sXPTitle, 0, _x, _y);
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