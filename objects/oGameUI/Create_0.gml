md5_frame = AirLib.frame + 60;
current_md5 = "";
last_md5 = "";
kill_enemies = false;
ui = new window(global.game_uis.stage, false);
ui.fit_to_gui();

#region surfaces
xpsurf = undefined;
xplerp = 0;
#endregion

a = 1;
coinspr = new animated_sprite(sHolocoin);
GameData.kills = 0;
GameData.stage_coins = 0;






//draw_weapon = function (_x, _y, _w, _h, name) {
	//airui_draw_sprite_centered(name + "bg", sUiEmptySlotWeapon, {left:_x, top:_y, width : _w, height : _h}, airui_fit.height, 0.5);
	//var wp = Player_Weapons[real(string_digits(name))];
	//if (wp != undefined) {
		//var _sw = sprite_get_width(wp.sprite) / 2;
		//var _sh = sprite_get_height(wp.sprite) / 2;
		//airui_draw_sprite_centered(name, wp.sprite, {left:_x, top:_y, width : _w, height : _h}, airui_fit.height);
		//draw_sprite_stretched(
			//wp.is_perk ? sUiLevelHeaderPink : sUiLevelHeaderWhite,
			//0,
			//_x,
			//_y + _h - sprite_get_height(sUiLevelHeaderPink),
			//_w,
			//sprite_get_height(sUiLevelHeaderPink)
		//);
		//draw_sprite(
			//wp.is_perk ? sUiDigitPink : sUiDigitWhite,
			//wp.level,
			//_x + _w,
			//_y + _h
		//);
	//}
//}

draw_item = function (_x, _y, _w, _h, name, struct, header, digit, bg) {
	airui_draw_sprite_centered(name + "bg", bg, {left:_x, top:_y, width : _w, height : _h}, airui_fit.height, 0.5, 0.5);
	var wp = struct[real(string_digits(name))];
	if (wp != undefined) {
		var _sw = sprite_get_width(wp.sprite) / 2;
		var _sh = sprite_get_height(wp.sprite) / 2;
		airui_draw_sprite_centered(name, wp.sprite, {left:_x, top:_y, width : _w, height : _h}, airui_fit.height);
		draw_sprite_stretched(
			wp.is_perk ? sUiLevelHeaderPink : header,
			0,
			_x,
			_y + _h - sprite_get_height(header),
			_w,
			sprite_get_height(header)
		);
		draw_sprite(
			wp.is_perk ? sUiDigitPink : digit,
			wp.level,
			_x + _w,
			_y + _h
		);
	}
	//draw_sprite_centered_ext(
				//sUiEmptySlotItem,
				//0,
				//_x,
				//_y,
				//2,
				//2,
				//0,
				//c_white,
				//0.5
			//);
			//var ip = Player_Items[real(string_digits(name))];
			//if (ip != undefined) {
				//var _sw = sprite_get_width(ip.sprite) / 2;
				//var _sh = sprite_get_height(ip.sprite) / 2;
				//draw_sprite_ext(
					//ip.sprite,
					//0,
					//_x + (_w / 2),
					//_y + ((sprite_get_width(ip.sprite) * 2) / 2),
					//2,
					//2,
					//0,
					//c_white,
					//1
				//);
				//draw_sprite_ext(
					//sUiLevelHeaderYellow,
					//0,
					//_x,
					//_y + _h,
					//2,
					//2,
					//0,
					//c_white,
					//1
				//);
				//draw_sprite_ext(
					//sUiDigitYellow,
					//ip.level,
					//_x,
					//_y + _h,
					//2,
					//2,
					//0,
					//c_white,
					//1
				//);
			//}
}
event_user(0);