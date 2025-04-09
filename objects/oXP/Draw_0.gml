var omat = matrix_get(matrix_world);
var _x = 0;
var _y = 0;
matrix_set(matrix_world, matrix_build(x, y, depth - 10, xrot, yrot, zrot, 1, 1, 1));
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
matrix_set(matrix_world, omat);