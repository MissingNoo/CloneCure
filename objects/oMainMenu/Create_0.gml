show_message(AchievementsList);
if (!is_undefined(GameData.music)) {
	if (audio_get_name(GameData.music) != "bgm_SSS") {
		audio_stop_sound(GameData.music);
	}
} else {
	GameData.music = audio_play_sound(bgm_SSS, 0, 1, GameConfig.music_volume);
}

if (os_type != os_android && os_type != os_gxgames) {
	cursor_sprite = sCursor;
}
window_set_cursor(cr_none);
GameData.font = font_add_sprite_ext(sDmgFont, "0123456789KO!:", true, 1);
var fstr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]{}()<>=?*:!%0123456789./, \"|-+";
GameData.font2 = font_add_sprite_ext(sHFont, fstr, true, 1);

scribble_font_bake_outline_4dir("sDmgFont", "fDmg", c_black, false);
scribble_font_bake_outline_4dir("sHFont", "ffnt", c_black, false);
scribble_font_set_default("sHFont");
ui = new window(global.game_uis.main_menu, false); //
ui.fit_to_gui();
buttons = {
	button_leaderboards: new button("MainMenu.Leaderboard"),
	button_achievements: new button("MainMenu.Achievements"),
	button_play: new button("MainMenu.Play"),
	button_credits: new button("MainMenu.Credits"),
	button_shop: new button("MainMenu.Shop"),
	button_settings: new button("MainMenu.Settings"),
	button_house: new button("MainMenu.HoloHouse"),
	button_quit: new button("MainMenu.Quit"),
};
struct_foreach(buttons, function(n, e) {
	e.top_spr = asset_get_index(
		$"sTitle{string_first_letter_upper_case(string_replace(n, "button_", ""))}"
	);
	e.custom_draw = method(e, function() {
		var sprw = sprite_get_width_ext(top_spr, 2) / 2;
		var sprh = sprite_get_height_ext(top_spr, 2) / 2;
		draw_sprite_ext(
			top_spr,
			on_area,
			area[0] + sprw,
			area[1] + sprh,
			2,
			2,
			0,
			c_white,
			1
		);
	});
});
btns = new ui_element_list();
btns.add(
	[
		buttons.button_leaderboards,
		buttons.button_achievements,
		buttons.button_shop,
		buttons.button_play,
		buttons.button_house,
		buttons.button_settings,
		buttons.button_credits,
		buttons.button_quit
	]
);
btns.selected = 3;
buttons
	.button_quit
	.set_function(function() {
		game_end();
	});
buttons
	.button_shop
	.set_function(function() {
		room_goto(rShop);
	});

buttons
	.button_play
	.set_function(function() {
		/*var stage = Stages[$ "Stage1"];
	GameData.on_stage = true;
	if (!is_undefined(GameData.music)) { audio_stop_sound(GameData.music); }
	GameData.music = audio_play_sound(stage.music, 0, -1, GameConfig.music_volume);
	global.seconds = 0;
	global.minutes = 0;*/
		frame = 0;
		//room_goto(stage.rm);
		room_goto(rCharSelect);
	});
bars = [];
start_y = 350;
tween(self, "start_y", 0, "ease", 30);
title_x = undefined;
title_x_end = undefined;
chars = struct_get_names(Characters);
array_sort(chars, true);
//repeat (30) {
//array_push(chars, chars[irandom(array_length(chars) - 1)]);
//} 
