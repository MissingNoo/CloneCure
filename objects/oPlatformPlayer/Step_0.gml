var left_right = - input_check("left") + input_check("right");
image_xscale = abs(image_xscale) * sign(left_right);
if (left_right != 0) {
	sprite_index = sTenmaRun;
} else {
	sprite_index = sTenmaIdle;
}