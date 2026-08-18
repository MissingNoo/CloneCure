function prop_start() {
	var _y = 0;
	part = undefined;
	switch (sprite_index) {
		case sFlower1:
			part = part_system_create(pFlower1);
			_y = sprite_get_height(sprite_index) / 1.3;
			break;
		case sBush1:
			part = part_system_create(pFlower1);
			break;
		case sBush2:
			part = part_system_create(pFlower1);
			break;
		default:
			// code here
			break;
	}
	if (part != undefined) {
		part_system_position(part, x, y - _y);
	}
}

function prop_draw() {
	//var sprw = sprite_width / 2;
	//var sprh = sprite_height;
	var a = false;
	if (instance_exists(oPlayer)) {
		a = oPlayer.y < y;
	}
	
	var player_obj = oPlayer;
	if (instance_exists(oPlayerWorld)) {
		player_obj = oPlayerWorld;
	}
	
	var alpha = a && place_meeting(x, y, player_obj) ? 0.75 : 1;
	
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 0.75, 0, c_black, 0.25);
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);
}
