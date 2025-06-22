if (y > gui_h + 50) {
	y = -50;
	x = irandom_range(0, gui_w);
}
image_angle += rot_spd * dir;