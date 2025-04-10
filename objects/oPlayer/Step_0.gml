var near_xp = instance_nearest(x, y, oXP);
if (distance_to_object(near_xp) < 40) {
	with (near_xp) {
		following = true;
		speed = GameData.SPD + 1;
		direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	}
}

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
var touch = GameData.touch.right;
if (touch.enabled) {
	GameData.arrow_dir = touch.get_direction();
	if (abs(angle_difference(180, GameData.arrow_dir)) < 90) {
		movement.last_h = -1;
	} else {
		movement.last_h = 1;
	}
}

if (device_mouse_check_button_released(0, mb_right)) {
	instance_create_depth(mouse_x, mouse_y, depth, oXP, {
		xp : 10
	});
}