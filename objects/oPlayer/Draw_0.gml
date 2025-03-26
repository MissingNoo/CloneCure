draw_sprite_ext(sCharShadow, 0, x, y, 1, 1, 0, c_white, 0.8);
if (hp > 0 and hp < char.hp) {
    draw_healthbar((x - 13), ((y - sprite_height) - 3), (x + 13), ((y - sprite_height) - 6), ((hp / char.hp) * 100), c_red, c_lime, c_lime, 0, 1, 0);
}
if (shield > 0 and hp > 0) {
    draw_healthbar((x - 13), ((y - 19) - 20), (x + 13), ((y - 19) - 23), ((shield / max_shield) * 100), c_red, c_blue, c_blue, 0, 1, 0);
}
gpu_set_fog(inv_frame >= frame, c_white, 0, 0);
draw_self();
gpu_set_fog(false, c_white, 0, 0);
//var strafing = global.strafe ? 1 : 0;
//var _color = c_white;
//if (mouseAim) {
    //_color = c_purple;
	//draw_sprite_ext(sMouseAim, 0, mouse_x, mouse_y, 1, 1, 0, c_white, 1);
//}
//draw_sprite_ext(sArrow,strafing,x,y-16,1,1,global.arrowDir, _color, 1);