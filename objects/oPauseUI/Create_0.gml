ui = new window(global.game_uis.pause, false);
ui.fit_to_gui();
buttons = {
    button_character : new button("Character"),
    button_stamps : new button("Stamps"),
    button_collabs : new button("Collabs"),
    button_resume : new button("Resume"),
    button_settings : new button("Settings"),
    button_quit : new button("Quit"),
};
btn_array = struct_get_names(buttons);
selected = 0;
buttons.button_quit.set_function(function() {
    game_end();
});
