gpu_set_fog(inv_frame > AirLib.frame, c_white, 0, 0);
draw_self();
draw();
gpu_set_fog(false, c_white, 0, 0);