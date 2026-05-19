grv = clamp(grv+0.5, 0, instance_place(x, y + 1, oCol) ? 0 : 6);

var left_right = - input_check("left") + input_check("right");
var up= - input_check_pressed("up");
if (up == -1) {
	grv = 0;
}
if (sign(left_right) != 0) {
	image_xscale = abs(image_xscale) * sign(left_right);
}

vh = spd * left_right;
if up !=0 vv = ((3) * up) + grv;
vv = clamp(vv+0.05, -10, 6);
if (left_right != 0) {
	sprite_index = sTenmaRun;
} else {
	sprite_index = sTenmaIdle;
}
move_and_collide_simple(vh, vv, oCol)