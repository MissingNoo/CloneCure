if (os_type != os_android) {
	cursor_sprite = sCursor;
}
window_set_cursor(cr_none);
GameData.font = font_add_sprite_ext(sDmgFont, "0123456789KO!:", true, 1);
var fstr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]{}()<>=?*:!%0123456789./, \"|-+";
//if (os_type != os_android) {
GameData.font2 = font_add_sprite_ext(sHFont, fstr, true, 1);
scribble_font_bake_outline_4dir("sDmgFont", "fDmg", c_black, true);
scribble_font_set_default("sHFont");	
//oo = 0;
//yy = 0;
var scale = os_type == os_android ? 2 : 1;
display_set_gui_maximise(scale, scale);
ui = new window(global.game_uis.main_menu, false);
ui.fit_to_gui();
buttons = {
    button_leaderboards : new button("Leaderboard"),
    button_achievements : new button("Achievements"),
    button_play : new button("Play"),
    button_credits : new button("Credits"), 
    button_shop : new button("Shop"),
    button_settings : new button("Settings"),
    button_house : new button("Holo House"),
    button_quit : new button("Quit"),
};
btn_array = ["button_leaderboards", "button_achievements", "button_shop", "button_play", "button_house", "button_settings", "button_credits", "button_quit"];
selected = 3;
buttons.button_quit.set_function(function() {
    game_end();
});

buttons.button_play.set_function(function() {
	GameData.on_stage = true;
   room_goto(rStage1);
});

bars = [];
start_y = 350;
title_x = undefined;
title_x_end = undefined;
chars = struct_get_names(Characters);
//repeat (30) {
    //array_push(chars, chars[irandom(array_length(chars) - 1)]);
//}