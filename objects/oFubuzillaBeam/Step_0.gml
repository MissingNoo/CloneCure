if (!instance_exists(owner)) {
	instance_destroy();
	exit;
}
x = owner.x;
y = owner.y - (owner.sprite_height / 2);
