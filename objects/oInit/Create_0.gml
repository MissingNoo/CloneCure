var scale = os_type == os_android ? 1.5 : 0.25;
if (os_type != os_android) {
	display_set_gui_size(1280, 720);
} else {
	display_set_gui_maximise(scale, scale);
}
if (file_exists(game_save_id + "SaveData.json")) {
	SaveData = json_load(game_save_id + "SaveData.json");
	update_save_data();
	struct_foreach(Items, function(name, value) {
		Items[$ name].unlocked = SaveData.unlocked_items[$ name];
	});
	struct_foreach(Weapons, function(name, value) {
		Weapons[$ name].unlocked = SaveData.unlocked_weapons[$ name];
	});
	struct_foreach(AchievementsList, function(name, value) {
		AchievementsList[$ name].unlocked = SaveData.unlocked_achievements[$ name];
	});
	struct_foreach(SaveData.shop.upgrades, function(name, value) {
		try {
			Shop.upgrades[$ name].level = value;
		} catch (error) {} //ignore
	});
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
