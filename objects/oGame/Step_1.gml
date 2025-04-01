if (keyboard_check_pressed(vk_f10)) {
	instance_create_depth(x, y, depth - 1, oLevelUp);
}
if (GameData.is_paused) {
    exit;
}
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
	global.seconds = 0;
	global.minutes = 0;
	frame = 0;
}
frame++;
global.seconds += 1/60;
if (global.seconds > 60) {
    global.seconds -= 60;
    global.minutes++;
}