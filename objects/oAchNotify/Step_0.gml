y_offset = clamp(y_offset + (AirLib.frame > timer ? to_lerp : -to_lerp), 0, sprite_height * bg_scale);
if (AirLib.frame > desttimer) {
	instance_destroy();
}