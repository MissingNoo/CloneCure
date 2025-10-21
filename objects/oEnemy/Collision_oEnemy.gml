if ((lock_dir_frame != 0 or other.lock_dir_frame != 0) and other.name != name) {
	exit;
}
var push = 0.5;

var dir = point_direction(other.x, other.y, x, y);
var hspd = lengthdir_x(push, dir);
var vspd = lengthdir_y(push, dir);

x += hspd;
y += vspd;
