GameData.player_pos = {x, y, depth};

spd = char.spd;
movement.set_speed(spd);
if (!GameData.on_dialog) {
	movement.movement();
}
if (movement.is_moving()) {
	sprite_index = sprites.run;
} else {
	sprite_index = sprites.idle;
}
image_xscale = movement.last_h == 1 ? 1 : -1;

//occluder.x = x;
//occluder.y = y;
light.x = x;
light.y = y - sprite_height / 2;
light.angle = point_direction(x, y, mouse_x, mouse_y);