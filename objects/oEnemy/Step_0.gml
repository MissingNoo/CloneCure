if (hp <= 0) {
	if (image_alpha == 1) {
		instance_create_depth(x, y, depth, oXP, {
			xp : e.experience
		});
	}
    image_alpha -= 0.05;
    x -= image_xscale;
    if (image_alpha <= 0) {
    	instance_destroy();
    }
}