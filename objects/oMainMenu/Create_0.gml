GameData.font = font_add_sprite_ext(sDmgFont, "0123456789KO!", true, 1);
scribble_font_bake_outline_4dir("sDmgFont", "fDmg", c_black, true);
//oo = 0;
//yy = 0;
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
   room_goto(Room1);
});

bars = [];