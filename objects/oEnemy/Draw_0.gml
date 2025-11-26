if inv_frame > AirLib.frame gpu_set_fog(true, c_white, 0, 0);
draw_self();
draw();
gpu_set_fog(false, c_white, 0, 0);