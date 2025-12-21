//feather ignore GM1041
ui.draw();
skinuidraw();
stageuidraw();
//st.draw();


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
