movement.movement();
if (!GameData.strafing) {
	image_xscale = movement.last_h;
}



if (movement.is_moving()) {
	sprite_index = char.run_sprite;
} else {
	sprite_index = char.idle_sprite;
}

array_foreach(Player_Weapons, function(e, i) {
    if (e == undefined) {
    	return;
    }
    if (e.cooldown <= frame) {
    	instance_create_depth(oPlayer.x, oPlayer.y - (sprite_height / 2), oPlayer.depth + 1, oWeapon, {
            wid : e,
            can_spawn_other : true,
			direction : GameData.arrow_dir
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
var left_right = - input_check("left") + input_check("right");
var up_down= - input_check("up") + input_check("down");
GameData.strafing = input_check("accept");
if ((left_right != 0 or up_down != 0) and !GameData.strafing) {
	dir = point_direction(0, 0, left_right, up_down);
	GameData.arrow_dir += angle_difference(dir, GameData.arrow_dir) * 0.25;
}

