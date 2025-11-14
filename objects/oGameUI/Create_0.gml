md5_frame = AirLib.frame + 60;
current_md5 = "";
last_md5 = "";
kill_enemies = false;
use_old_ui = false;
ui = new window(global.game_uis.stage, false);
ui.fit_to_gui();
lvlup_offset = 0;
#region surfaces
xpsurf = undefined;
#endregion

a = 1;
coinspr = new animated_sprite(sHolocoin);
GameData.kills = 0;
GameData.stage_coins = 0;

items_surf = -1;
draw_item = function (_x, _y, _w, _h, name, struct, header, digit, bg) {
	surface_set_target(items_surf);
	airui_draw_sprite_centered(name + "bg", bg, {left:_x, top:_y, width : _w, height : _h}, airui_fit.height, 0.5, 0.5);
	var wp = struct[real(string_digits(name))];
	if (wp != undefined) {
		var _sw = sprite_get_width(wp.sprite) / 2;
		var _sh = sprite_get_height(wp.sprite) / 2;
		airui_draw_sprite_centered(name, wp.sprite, {left:_x, top:_y, width : _w, height : _h}, airui_fit.height);
		if (struct == Player_Weapons) {
			var ss = gpu_get_scissor();
			var percent = ((wp.cooldown - AirLib.frame) / wp.base_cooldown[wp.level]);
			gpu_set_scissor({x : _x, y: _y, w : _w, h : (_h * percent)});
			gpu_set_fog(true, c_black, 0, 1);
			draw_set_alpha(percent);
			airui_draw_sprite_centered(name, wp.sprite, {left:_x, top:_y, width : _w, height : _h}, airui_fit.height, 1, 0.5);
			draw_set_alpha(1);
			gpu_set_scissor(ss);
			gpu_set_fog(false, c_black, 0, 1);
		}
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
	surface_reset_target()
}
event_user(0);