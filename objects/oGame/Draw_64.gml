if (GameData.is_paused) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_color(c_white);
	draw_surface_stretched(surf, 0, 0, display_get_gui_width(), display_get_gui_height());
	draw_set_color(c_red);
    draw_rectangle(5, 5, display_get_gui_width() - 5, display_get_gui_height() - 5, true);
    draw_set_color(c_white);
    exit;
}
GameData.touch.left.draw();
GameData.touch.right.draw();
//draw_text(gui_x_percent(25), gui_y_percent(30), GameData.t[]=+][AAouch);