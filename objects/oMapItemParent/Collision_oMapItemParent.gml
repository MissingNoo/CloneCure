if (!cancollide) {
    exit;
}
//if (other.x == x or other.y == y) {
var dont = [sTree, sDeadTree];
if (distance_to_object(other) < 5 and (other.sprite_index != sprite_index and !array_contains(dont, sprite_index))) {
	other.cancollide = false;
    instance_destroy();
}