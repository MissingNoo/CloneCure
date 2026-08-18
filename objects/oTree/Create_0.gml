// Inherit the parent event
event_inherited();

var col = collision_circle(x, y, 20, oTree, true, true);
if (col != noone and distance_to_object(col) <= 20) {
	if (col.sprite_index == sprite_index) {
		instance_destroy(col);
	}
}