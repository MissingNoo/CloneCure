if (!cancollide) {
    exit;
}

var anyway = [sBush1, sBush2];
if ((other.sprite_index == sprite_index) or array_contains(anyway, other.sprite_index)) {
	other.cancollide = false;
    instance_destroy();
}