var left_right = - input_check("left") + input_check("right");
var up_down = - input_check("up") + input_check("down");
var moving = abs(left_right) + abs(up_down);

if (left_right != 0) {
    image_xscale = left_right;
}

if (moving != 0) {
	sprite_index = char.run_sprite;
} else {
	sprite_index = char.idle_sprite;
}

move_and_collide(left_right * char.spd, up_down * char.spd, oGameUI);

array_foreach(Player_Weapons, function(e, i) {
    if (e == undefined) {
    	return;
    }
    if (e.cooldown <= frame) {
    	instance_create_depth(oPlayer.x, oPlayer.y - (sprite_height / 2), oPlayer.depth + 1, oWeapon, {
            wid : e
        });
        e.cooldown = frame + e.base_cooldown[e.level];
    }
});

//occluder.x = x;
//occluder.y = y;
light.x = x;
light.y = y - sprite_height / 2;
//light1.x = x;
//light1.y = y - sprite_height / 2;
light.angle = point_direction(x, y, mouse_x, mouse_y);