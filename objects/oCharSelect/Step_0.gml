selected = wrap(selected + input_check_pressed("right") - input_check_pressed("left"), 0, struct_names_count(GameData.characters));
selected_char = chars[selected];
GameData.selected_character = selected_char;
if (keyboard_check(ord("Z"))) {
	var stage = Stages[$ "Stage1"];
	GameData.on_stage = true;
	if (!is_undefined(GameData.music)) { audio_stop_sound(GameData.music); }
	GameData.music = audio_play_sound(stage.music, 0, -1, GameConfig.music_volume);
	global.seconds = 0;
	global.minutes = 0;
	room_goto(stage.rm); 
}