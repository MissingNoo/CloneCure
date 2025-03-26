if (hp <= 0) {
    image_alpha -= 0.05;
    x -= image_xscale;
    if (image_alpha <= 0) {
    	instance_destroy();
    }
}