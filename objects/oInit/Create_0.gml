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