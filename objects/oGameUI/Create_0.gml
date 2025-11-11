md5_frame = AirLib.frame + 60;
current_md5 = "";
last_md5 = "";
kill_enemies = false;
ui = new window(global.game_uis.stage, false);
ui.fit_to_gui();

#region surfaces
xpsurf = undefined;
#endregion

a = 1;
coinspr = new animated_sprite(sHolocoin);
GameData.kills = 0;
GameData.stage_coins = 0;

draw_weapon = function (_x, _y, _w, _h, name) {
	sscale = 1;
					var aa = _y + _h / 2;
					do {
						sscale += .01;
					} until (aa - (sprite_get_height_ext(sUiEmptySlotWeapon, sscale) / 2) <= _y);
					sscale -= 0.1;
					draw_sprite_ext(sUiEmptySlotWeapon, 0,
					(_x + _w / 2) - (sprite_get_width_ext(sUiEmptySlotWeapon, sscale) / 2),
					(_y + _h / 2) - (sprite_get_height_ext(sUiEmptySlotWeapon, sscale) / 2),
					sscale / 2,
					sscale / 2,
					0,
					c_white,
					1
				);
			var wp = Player_Weapons[real(string_digits(name))];
			if (wp != undefined) {
				var _sw = sprite_get_width(wp.sprite) / 2;
				var _sh = sprite_get_height(wp.sprite) / 2;
				//draw_sprite_stretched(wp.sprite, wp.level == wp.max_level ? 1 : 0, _x + _sw, _y + _sh, _w - (_sw * 2), _h - (_sh * 2));
				//draw_sprite_ext(wp.sprite, wp.level == wp.max_level ? 1 : 0, _x + (_w / 2 ), _y + ((sprite_get_width(wp.sprite) * 2) / 2), sc, sc, 0, c_white, 1);
				
					sscale = 1;
					var aa = _y + _h / 2;
					do {
						sscale += .01;
					} until (aa - (sprite_get_height_ext(wp.sprite, sscale) / 2) <= _y);
					sscale -= 0.1;
				
				draw_sprite_ext(
					wp.sprite,
					wp.level == wp.max_level ? 1 : 0,
					(_x + _w / 2) - (sprite_get_width_ext(wp.sprite, sscale) / 2),
					(_y + _h / 2) - (sprite_get_height_ext(wp.sprite, sscale) / 2),
					sscale,
					sscale,
					0,
					c_white,
					1
				);
				
				draw_sprite_stretched(
					wp.is_perk ? sUiLevelHeaderPink : sUiLevelHeaderWhite,
					wp.level,
					_x,
					_y + _h,
					_w,
					sprite_get_height(sUiLevelHeaderPink)
				);
				draw_sprite_stretched(
					wp.is_perk ? sUiDigitPink : sUiDigitWhite,
					wp.level,
					_x,
					_y + _h,
					_w,
					sprite_get_height(sUiDigitPink)
				);
			}
}

draw_item = function (_x, _y, _w, _h, name) {
	draw_sprite_centered_ext(
				sUiEmptySlotItem,
				0,
				_x,
				_y,
				2,
				2,
				0,
				c_white,
				0.5
			);
			var ip = Player_Items[real(string_digits(name))];
			if (ip != undefined) {
				var _sw = sprite_get_width(ip.sprite) / 2;
				var _sh = sprite_get_height(ip.sprite) / 2;
				draw_sprite_ext(
					ip.sprite,
					0,
					_x + (_w / 2),
					_y + ((sprite_get_width(ip.sprite) * 2) / 2),
					2,
					2,
					0,
					c_white,
					1
				);
				draw_sprite_ext(
					sUiLevelHeaderYellow,
					0,
					_x,
					_y + _h,
					2,
					2,
					0,
					c_white,
					1
				);
				draw_sprite_ext(
					sUiDigitYellow,
					ip.level,
					_x,
					_y + _h,
					2,
					2,
					0,
					c_white,
					1
				);
			}
}
