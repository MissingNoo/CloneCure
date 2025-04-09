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
	var omat = matrix_get(matrix_world);
	var _x = (x), _y = (y);
	var sprw = sprite_width / 2;
	var sprh = sprite_height;
	var alpha = oPlayer.y < _y and collision_rectangle(_x - sprw,_y - sprh, _x + sprw, _y, oPlayer, false, false) ? 0.75 : 1;
	var _offset = 0;
	switch (sprite_index) {
	    case sTree:
	        _offset = 16;
	        break;
	    default:
	        // code here
	        break;
	}
	_x = 0;
	_y = 0;
	//matrix_set(matrix_world, matrix_build(x, y, depth, 0, 0, 0, 1, 1, 1));
	//draw_sprite_ext(sprite_index, 0, _x, _y + _offset, 1, -0.75, 0, c_black, 0.25);
	matrix_set(matrix_world, matrix_build(x, y, depth, -90, 0, 0, 1, 1, 1));
	draw_sprite_ext(sprite_index, 0, _x, _y, 1, 1, 0, c_white, alpha);
	matrix_set(matrix_world, matrix_build(x, y, depth, -90, 0, 90, 1, 1, 1));
	draw_sprite_ext(sprite_index, 0, _x, _y, 1, 1, 0, c_white, alpha);
	matrix_set(matrix_world, omat);
}