var _x = (x), _y = (y);
draw_sprite_ext(sCharShadow, 0, _x, _y, 1, 1, 0, c_white, 0.8);
if (GameData.hp > 0 and GameData.hp < GameData.max_hp) {
    draw_healthbar((_x - 13), ((_y - sprite_height) - 3), (_x + 13), ((_y - sprite_height) - 6), ((GameData.hp / GameData.max_hp) * 100), c_red, c_lime, c_lime, 0, 1, 0);
}
if (GameData.shield > 0 and GameData.hp > 0) {
    draw_healthbar((_x - 13), ((_y - 19) - 20), (_x + 13), ((_y - 19) - 23), ((GameData.shield / GameData.max_shield) * 100), c_red, c_blue, c_blue, 0, 1, 0);
}
gpu_set_fog(inv_frame >= frame, c_white, 0, 0);
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
gpu_set_fog(false, c_white, 0, 0);
var _color = c_white;
//if (mouseAim) {
    //_color = c_purple;
	//draw_sprite_ext(sMouseAim, 0, mouse_x, mouse_y, 1, 1, 0, c_white, 1);
//}
draw_sprite_ext(sArrow, GameData.strafing, x, y - (sprite_height / 2), 1, 1, GameData.arrow_dir, _color, 1);