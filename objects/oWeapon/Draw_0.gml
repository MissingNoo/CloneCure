var a = 0.3;
for (var i = array_length(afterimage_array) - 1; i >= 0; i--) {
	var e = afterimage_array[i];
	draw_sprite_ext(sprite_index, e.index, e.x, e.y, e.xs, e.ys, e.rot, c_yellow, a);
	a -= 0.05;
}
d();

