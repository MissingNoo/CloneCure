event_inherited();
cancollide = true;
part = undefined;
var col = instance_nearest(x, y, oMapItemParent);
if (col != noone and distance_to_object(col) <= 20) {
	if (col.sprite_index == sprite_index) {
		instance_destroy(col);
	}
}