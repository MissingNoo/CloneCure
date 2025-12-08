//feather ignore GM1041
ui.draw();
//if (lastw != display_get_gui_width()) {
	//lastw = display_get_gui_width();
	//setmiddle = false;
	//setmiddle2 = false;
	//middle = 0;
	//middle2 = 0;
//}
//ui.foreach(function(name, pos, data) {
	//AirUIDefaultSpr;
	//AirUIArea;
//
	//var char_name = Characters[$ selected_char].uiname;
	//var char_weapon = Weapons[$ Characters[$ selected_char].main_weapon];
	//var chars = struct_get_names(GameData.characters);
	//array_sort(chars, true);
	//if (!ui.node_is_visible(name)) {
		//exit;
	//}
	/*
	switch (name) {
		
		case "stat_hp":
			
			break;
		case "stat_atk":
			_y -= character_selected_offset;
			draw_sprite_ext(sHudATKIcon, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudATKIcon, 2) + 5;
			draw_rectangle(
				_xx,
				_y + _h / 2,
				(_x + _w)
					- (
						100
							- (
								real(
									string_replace(
										Characters[$ selected_char].atk,
										"1.",
										""
									)
								) * 2
							)
					),
				_y + _h,
				false
			);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]ATK").scale(2).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{Characters[$ selected_char].atk}")
				.scale(2)
				.draw(_x + _w, _y + _h / 2 + 2);
			break;
		case "stat_spd":
			_y -= character_selected_offset;
			draw_sprite_ext(sHudSPDIcon, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudSPDIcon, 2) + 5;
			draw_rectangle(
				_xx,
				_y + _h / 2,
				(_x + _w)
					- (
						100
							- (
								real(
									string_replace(
										Characters[$ selected_char].spd,
										"1.",
										""
									)
								) * 1.5
							)
					),
				_y + _h,
				false
			);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]SPD").scale(2).draw(_xx, _y + _h / 2 + 2);
			scribble($"[fa_right][fa_middle]{Characters[$ selected_char].spd}")
				.scale(2)
				.draw(_x + _w, _y + _h / 2 + 2);
			break;
		case "stat_crt":
			_y -= character_selected_offset;
			draw_sprite_ext(sHudCRTIcon, 0, _x, _y, 2, 2, 0, c_white, 1);
			draw_set_color(c_aqua);
			var _xx = _x + sprite_get_width_ext(sHudCRTIcon, 2) + 5;
			draw_rectangle(
				_xx,
				_y + _h / 2,
				(_x + _w)
					- (
						real(string_replace(Characters[$ selected_char].crit, "1.", ""))
							* 4
					),
				_y + _h,
				false
			);
			draw_set_color(c_white);
			draw_rectangle(_xx, _y + _h - 1, _x + _w, _y + _h, false);
			scribble("[fa_middle]CRT").scale(2).draw(_xx, _y + _h / 2 + 2);
			scribble(
				$"[fa_right][fa_middle]{
					string_replace(Characters[$ selected_char].crit, "1.", "")
				}%"
			)
				.scale(2)
				.draw(_x + _w, _y + _h / 2 + 2);
			break;

		default:
			draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
			break;
	}*/
//});

//	ui.draw();
	
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

stageinfo
	.foreach(function(name, pos, data) {
		AirUIArea;
		_x += stageoffset + gui_w;
		area[0] += stageoffset + gui_w;
		area[2] += stageoffset + gui_w;
		switch (name) {
			case "title":
				scribble("[fa_center][fa_middle][c_white]CHOOSE STAGE")
					.scale(3)
					.draw(_x + _w / 2, _y + _h / 2);
				break;
			case "stage_icon":
				if (st.get_current_state() == "Stage") {
					stage_skin_click_area = [_x, _y, _w, _h];
				}
				draw_sprite_stretched(selected_stage.bg, 0, _x, _y, _w, _h);
				draw_sprite_ext(
					sSelectArrow,
					selectarrow.get_frame(),
					_x + _w / 2,
					_y + _h / 2,
					2,
					2,
					0,
					c_white,
					1
				);
				break;
			case "holocoins":
				scribble($"Holocoin: [sHolocoin]x {selected_stage.multiplier}")
					.scale(2)
					.draw(_x, _y);
				break;
			case "upgrades":
				scribble($"Recommended Upgrades:").scale(2).draw(_x, _y);
				for (
					var yo = 0, i = 0;
					i < array_length(selected_stage.recomendation);
					i++
				) {
					var r = selected_stage.recomendation[i];
					var upg = Shop.upgrades[$ r[0]];
					var color = upg.level >= r[1] ? "c_white" : "c_red";
					scribble(
						$"[fa_right][fa_center][{sprite_get_name(upg.sprite)}][{
							color
						}]  x  LV {r[1]}"
					)
						.scale(recscale)
						.draw(_x + _w / 2, _y + yo + recsyoff);
					yo += recyoff;
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
