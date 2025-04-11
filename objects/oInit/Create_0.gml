var scale = os_type == os_android ? 1.5 : 1;
if (os_type != os_android) {
	display_set_gui_size(1280, 720);
}
else {
	display_set_gui_maximise(scale, scale);
}
if (file_exists(game_save_id + "SaveData.json")) {
	SaveData = json_load(game_save_id + "SaveData.json");
	update_save_data();
}
if (file_exists(game_save_id + "Config.json")) {
	GameConfig = json_load(game_save_id + "Config.json");
	//update_save_data();
}
#region Lexicon Initialization
lexicon_index_declare_from_json("english.json");
lexicon_language_set("English");
#endregion
room_goto(rMainMenu);