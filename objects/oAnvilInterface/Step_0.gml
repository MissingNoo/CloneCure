//airui_hotreload("/home/airgeadlamh/.config/AirLibGMProject//export.ui", 0);
if (input_check_pressed("up") or input_check_pressed("down")) {
	row = !row;
}
var left_right = - input_check_pressed("left") + input_check_pressed("right");
pos = clamp_wrap(pos + left_right, 0, 5);
var iw = row == 0 ? Player_Weapons : Player_Items;
selected = iw[pos];
if (input_check_released("cancel")) {
	global.events.broadcast("pause", "anvil");
}