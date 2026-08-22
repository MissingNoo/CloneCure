draw_set_color(c_black);
draw_set_alpha(0.65);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);
draw_set_color(c_white);
//var iw = row == 0 ? Player_Weapons : Player_Items;
//if (!is_undefined(iw[pos])) {
	//draw_sprite(iw[pos].sprite, 0, gui_w / 2, gui_h / 2);
//}
if (!is_undefined(ui)) {
	ui.draw();
}
