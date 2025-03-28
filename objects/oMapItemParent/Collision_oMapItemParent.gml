if (!cancollide) {
    exit;
}
//if (other.x == x or other.y == y) {
var dont = [sTree, sDeadTree];
if (!array_contains(dont, sprite_index) and distance_to_object(other) < 2) {
	other.cancollide = false;
    instance_destroy();
}