switch (room) {
	case rCharSelect:
	case rMainMenu:
		GameData.on_stage = false;
		reset_cursor();
		break;
}
