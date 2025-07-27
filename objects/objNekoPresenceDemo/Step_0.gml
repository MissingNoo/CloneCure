/// @description Update NekoPresence so async events will execute.
if (room != lastroom) {
	lastroom = room;
	switch (room) {
		case rMainMenu:
			np_setpresence("On the main menu", "", "", "");
			break;
		case rCharSelect:
			np_setpresence("Selecting a character", "", "", "");
			break;
		case rStage1:
			np_setpresence(string_replace($"{GameData.selected_character} - {GameData.stage_name}" , "_", " "), "Saving the fans!", "", "");
			break;
		case rShop:
			np_setpresence("Shopping", "", "", "");
			break;
	}
	
}
np_update();