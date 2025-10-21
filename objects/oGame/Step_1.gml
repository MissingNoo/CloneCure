bb();
if (os_type == os_android) {
	show_debug_overlay(false);
}
if (keyboard_check_pressed(vk_f9)) {
	show_debug_overlay(false);
}
if (keyboard_check_pressed(vk_f10)) {
	show_debug_overlay(true);
}
exit_if_paused;
if (GameData.on_stage) {
	if (!instance_exists(oGameUI)) {
		instance_create_depth(0, 0, depth - 1, oGameUI);
	}
	if (!instance_exists(oStage)) {
		instance_create_depth(0, 0, depth - 1, oStage);
	}
}
if (room != lastroom) {
	lastroom = room;
}
if (instance_exists(oGameUI)) {
	depth = oGameUI.depth + 1;
}
