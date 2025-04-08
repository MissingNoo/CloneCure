if (GameData.is_paused) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_x_percent(100), gui_y_percent(100), false);
    draw_set_color(c_white);
	draw_surface(surf, 0, 0);
    exit;
}
if (os_type == os_android) {
	GameData.touch.left.draw();
	GameData.touch.right.draw();
}

//draw_text(gui_x_percent(25), gui_y_percent(30), GameData.t[]=+][AAouch);