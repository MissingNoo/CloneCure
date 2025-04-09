var omat = matrix_get(matrix_world);
var _x = (x), _y = (y);
matrix_set(matrix_world, matrix_build(x, y, oPlayer.depth, -90, 0, 0, 1, 1, 1));
_x = 0;
_y = 0;
gpu_set_fog(inv_frame > frame, c_white, 0, 0);
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
gpu_set_fog(false, c_white, 0, 0);
matrix_set(matrix_world, omat);