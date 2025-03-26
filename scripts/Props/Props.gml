function prop_start(){
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

function prop_draw(){
	if (!instance_exists(oPlayer)) {
	    return;
	}
	var sprw = sprite_width / 2;
	var sprh = sprite_height;
	var alpha = oPlayer.y < y and collision_rectangle(x- sprw,y - sprh, x + sprw, y, oPlayer, false, false) ? 0.75 : 1;
	var _offset = 0;
	switch (sprite_index) {
	    case sTree:
	        _offset = 16;
	        break;
	    default:
	        // code here
	        break;
	}
	
	draw_sprite_ext(sprite_index, 0, x, y + _offset, 1, -0.75, 0, c_black, 0.25);
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, alpha);
}