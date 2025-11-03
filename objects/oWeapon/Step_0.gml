s();
if (AirLib.frame > after_next_frame) {
	after_next_frame = AirLib.frame + afterimage.delay;
	var b = {
		index : floor(image_index),
		x : x, y : y, xs : image_xscale, ys : image_yscale, rot: image_angle
	};
	array_push(afterimage_array, variable_clone(b));
	if (array_length(afterimage_array) >= afterimage.amount) {
		array_shift(afterimage_array);
	}
}

if (last_frame < AirLib.frame) {
	instance_destroy();
}
