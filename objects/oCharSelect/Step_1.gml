mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);
if (device_mouse_check_button_pressed(1, mb_left)) {
	force_x = true;
}