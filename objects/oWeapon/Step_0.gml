s();
if (hits <= 0) {
	image_alpha = 0;
}
if (last_frame < frame) {
	instance_destroy();
}