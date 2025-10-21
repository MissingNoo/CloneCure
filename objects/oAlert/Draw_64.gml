switch (dir) {
	case 0:
		image_index = 0;
		break;
	case 90:
		image_index = 1;
		break;
	case 180:
		image_index = 2;
		break;
	case 270:
		image_index = 3;
		break;
}
x = gui_w / 2 + lengthdir_x(sprite_width * 2, dir);
y = gui_h / 2 + lengthdir_y(sprite_height * 2, dir);
var x_offset = (dir == 90 or dir == 270) ? -(sprite_width) : 0;
var sx = x_offset;
var y_offset = (dir == 180 or dir == 0) ? -(sprite_height) : 0;
var sy = y_offset;
repeat (3) {
	//draw_line(x + x_offset, y + y_offset, gui_w / 2, gui_h / 2);
	draw_sprite(sprite_index, image_index, x + x_offset, y + y_offset);
	if (sx != 0) {
		x_offset += sprite_width;
	}
	if (sy != 0) {
		y_offset += sprite_height;
	}
}