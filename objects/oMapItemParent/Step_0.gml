if (!partc) {
	
	partc = true;
	var nopart = [sBush1, sBush2];
	if (array_contains(nopart, sprite_index)) {
		exit;
	}
	//pFlower1
	_ps = part_system_create();
	part_system_draw_order(_ps, true);
	
	//Emittera
	var _ptype1 = part_type_create();
	part_type_sprite(_ptype1, sFlower1Part, false, true, false)
	part_type_size(_ptype1, 0.5, 1, -0.01, 0);
	part_type_scale(_ptype1, 1, 1);
	part_type_speed(_ptype1, 0.01, 0.01, 0.01, 0.25);
	part_type_direction(_ptype1, 1, 80, 1, 0);
	part_type_gravity(_ptype1, 0.06, random_range(30, 60));
	part_type_orientation(_ptype1, 216, 0, 1, 2, true);
	var color = $FFFFFF;
	switch (sprite_index) {
		case sFlower1:
			color = #E18DCE;
			break;
		case sFlower1_1:
			color = #E18DCE;
			break;
		case sFlower2:
			color = #E18DCE;
			break;
		case sFlower3:
			color = #E18DCE;
			break;
		case sFlower4:
			color = #E6DB5D;
			break;
		case sFlower5:
			color = #E6DB5D;
			break;
		case sFlowerC1:
			color = #ACBCAC;
			break;
	}
	part_type_colour3(_ptype1, color, color, color);
	part_type_alpha3(_ptype1, 1, 0.91, 0);
	part_type_blend(_ptype1, false);
	part_type_life(_ptype1, 30, 80);
	
	var _pemit1 = part_emitter_create(_ps);
	part_emitter_region(_ps, _pemit1, -8, 8, -8, 8, ps_shape_rectangle, ps_distr_gaussian);
	part_emitter_stream(_ps, _pemit1, _ptype1, -60);
	
	
}
if (!is_undefined(_ps)) {
	part_system_position(_ps, x, bbox_top + 3);
}