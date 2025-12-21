///UI State Draw
skinuidraw = function () {
	skinui
	.foreach(function(name, pos, data) {
		AirUIArea;
		_y += character_selected_max_offset - character_selected_offset;
		_x -= gui_w - stageoffset;
		switch (name) {
			case "skin_area":
				if (st.get_current_state() == "Skin") {
					stage_skin_click_area = [_x, _y, _w, _h];
				}
				draw_sprite_stretched(sCharacterselected, 0, _x, _y, _w, _h);
				var defog = false;
				if (
					!array_contains(
						SaveData.characters[$ selected_char].outfits,
						selected_skin_name
					)
				) {
					gpu_set_fog(true, c_black, 0, 0);
					defog = true;
				}
				draw_sprite_centered_ext(
					charspr.sprite,
					charspr.get_frame(),
					(_x + _w / 2) + ((charspr.width * skin_scale) / 2),
					(_y + _h / 2) + (charspr.height * skin_scale),
					skin_scale,
					skin_scale,
					0,
					c_white,
					1
				);
				if (defog) {
					gpu_set_fog(false, c_black, 0, 0);
				}
				if (array_length(Characters[$ selected_char].skinorder) > 1) {
					draw_sprite_ext(
						sSelectArrow,
						selectarrow.get_frame(),
						_x + _w / 2,
						_y + _h / 2,
						3,
						3,
						0,
						c_white,
						1
					);
				}

				break;
			case "back_panel":
				draw_set_color(c_black);
				draw_set_alpha(0.5);
				draw_rectangle(_x, _y, _x + _w, _y + _h, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
				break;
		}
	});

}

stageuidraw = function () {
	stageui
	.foreach(function(name, pos, data) {
		AirUIArea;
		_x += stageoffset;
		area[0] += stageoffset;
		area[2] += stageoffset;

		switch (name) {
			case "time":
				time.position_area(area);
				time.draw();
				break;
			case "endless":
				endless.position_area(area);
				endless.draw();
				break;
			case "stage":
				stage.position_area(area);
				stage.draw();
				break;
			case "back_panel":
				draw_set_color(c_black);
				draw_set_alpha(0.5);
				draw_rectangle(_x, _y, _x + _w, _y + _h, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
				break;
		}
	});

}