if (keyboard_check_pressed(vk_f1)) {
	debug_rooms();
}
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
    e.cooldown = clamp(e.cooldown - 1, 0, infinity);
    if (e.cooldown == 0) {
    	instance_create_depth(oPlayer.x, oPlayer.y - (sprite_height / 2), oPlayer.depth + 1, oWeapon, {
            wid : Weapons[$ e.name]
        });
        e.cooldown = e.base_cooldown[e.level];
    }
});