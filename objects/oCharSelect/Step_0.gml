//btn[stagemodeselected].keyboard_selected = true;
charspr.animate();
selectarrow.animate();
if (left_right == 0) {
	left_right = input_check_pressed("right") - input_check_pressed("left");
}
up_down = input_check_pressed("down") - input_check_pressed("up");
character_selected_offset = lerp(
	character_selected_offset,
	character_was_selected ? character_selected_max_offset : 0,
	0.4
);
stageoffset = lerp(
	stageoffset,
	(skin_was_selected ? 0 : gui_w) - (stagemodewasselected ? gui_w : 0),
	0.4
);
charoffset = lerp(charoffset, 20, 0.3);
charxoff = lerp(charxoff, 0, 0.2);
if (st.get_current_state() == "Skin" || st.get_current_state() == "Stage") {
	var area = stage_skin_click_area;
	var _x = area[0];
	var _y = area[1];
	var _w = area[2];
	var _h = area[3];
	var _x1 = _x;
	var _x2 = _x + _w;
	var _y1 = _y;
	var _w = 50;
	var _y2 = _y + _h;
	if (gui_click(_x1 - _w, _y1, _x1, _y2)) {
		left_right = -1;
	}
	if (gui_click(_x2, _y1, _x2 + _w, _y2)) {
		left_right = 1;
	}
	if (gui_click(_x1, _y1, _x2, _y2)) {
		force_click();
	}

	draw_rectangle(_x1 - _w, _y1, _x1, _y2, true);
	draw_rectangle(_x2, _y1, _x2 + _w, _y2, true);
	draw_set_colour(c_red);
	draw_rectangle(_x1, _y1, _x2, _y2, true);
	draw_set_colour(c_white);
}
st.step();
left_right = 0;

/*
if (keyboard_check_released(ord("Z")) or forcez) {
    forcez = false;
	if (stagemodewasselected) {
		
	}
	
	if (skin_was_selected) {
		btn[stagemodeselected].on_click();
		stagemodewasselected = true;
		exit;
	}
	
	if (!character_was_selected) {
		character_was_selected = true;
		skinui.set_visible(true);
		ui.node_visible("label_title");
		ui.node_visible("char_list_1");
		ui.node_visible("char_list_2");
		exit;
	}
	
	if (character_was_selected) {
		skin_was_selected = true;
		stageui.set_visible(true);
		exit;
	}
}*/
