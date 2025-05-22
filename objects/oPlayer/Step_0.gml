if (keyboard_check_pressed(ord("C"))) {
	instance_create_depth(x, y + 40, depth, oAnvil);
}
if (keyboard_check_pressed(ord("O"))) {
	Player_Weapons[0].level++;
}
if (keyboard_check_pressed(ord("I"))) {
	Player_Weapons[0].level--;
}
#region Revives
if(GameData.hp <= 0 and GameData.revives > 0) {
	//TODO: revive window
	GameData.revives--;
	GameData.hp = GameData.max_hp / 2;
	with (oEnemy) {
		if(!boss){
			hp = 0;
		}
	}
}
#endregion
#region Regeneration
if (healframe < AirLib.frame) {
	healframe = AirLib.frame + seconds_to_frames(5);
	GameData.hp += shop_level("Regeneration");
}
#endregion
var basespd = GameData.SPD;
movement.set_speed(basespd);
Player_Weapons[0].level = clamp(Player_Weapons[0].level, 1, 7);
ds_list_clear(xplist);
var pickrange = 40 * (GameData.Pickup / 100);
var xps = collision_circle_list(x, y, pickrange, oXP, false, true, xplist, true);
for (var i = 0; i < ds_list_size(xplist); i++) {
	with (xplist[| i]) {
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

array_foreach(Player_Weapons, function(e, i) /*=>*/ {
    if (is_undefined(e)) {
    	return;
    }
    if (e.cooldown <= AirLib.frame) {
    	instance_create_depth(oPlayer.x, oPlayer.y - (sprite_height / 2), oPlayer.depth + 1, oWeapon, {
            wid : e,
            can_spawn_other : true,
			direction : GameData.arrow_dir
        });
		var cool = e.base_cooldown[e.level];
		var newcool = clamp(round(cool / (1 + (GameData.Haste / 100))), e.min_cooldown, infinity);
		//trace($"Cooldown: {cool} : {newcool}");
        e.cooldown = AirLib.frame + cool;
    }
});
array_foreach(Player_Items, function(e, i) /*=>*/ {
    if (is_undefined(e)) {
    	return;
    }
    if (e.cooldown <=  AirLib.frame) {
		e.on_cooldown();
        e.cooldown = AirLib.frame + e.base_cooldown[e.level];
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
GameData.arrow_dir = point_direction(x, y, mouse_x, mouse_y);
if (device_mouse_check_button_released(0, mb_right)) {
	instance_create_depth(mouse_x, mouse_y, depth, oXP, {
		xp : 10
	});
}