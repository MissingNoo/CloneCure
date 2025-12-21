///States
state_order = ["Char", "Skin", "StageMode", "Stage", "GO"];
current_state = 0;
confirm_state = function (confirm_overwrite = undefined, cancel_overwrite = undefined) {
	if (input_check_pressed("accept") || forcez) {
		if (is_undefined(confirm_overwrite)) {
			current_state = array_get_index(state_order, st.get_current_state());
			current_state++;
			st.change(state_order[current_state]);
		} else {
			confirm_overwrite();
		}
		
	}
	if (
		 input_check_pressed("cancel")
			|| device_mouse_check_button_pressed(0, mb_right)
			|| force_x
		) {
		if (is_undefined(cancel_overwrite)) {
			current_state = array_get_index(state_order, st.get_current_state());
			current_state--;
			st.change(state_order[current_state]);
		} else {
			cancel_overwrite();
		}
	}
}
///States
st = new SnowState("Char");
st.add("Char", {
	enter: function() {
		charxoff = 1800;
		skinui.set_visible(false);
		ui.node_visible("label_title", true);
		ui.node_visible("char_list_1_panel", true);
		ui.node_visible("char_list_2_panel", true);
		character_was_selected = false;
		stagemodewasselected = false;
		stageui.set_visible(false);
		skinui.set_visible(false);
	},
	step: function() {
		confirm_state(undefined, function () {
			room_goto(rMainMenu);
		})
		if (up_down == 1) {
			if (selected <= 10) {
				up_down = 10;
			} else {
				up_down = 9;
			}
		}
		if (up_down == -1) {
			if (selected <= 19) {
				up_down = -10;
			} else {
				up_down = -9;
			}
		}
		selected = clamp_wrap(selected + left_right + up_down, 0, 46);
		if (left_right != 0 || up_down != 0) {
			select_char();
		}
	},
	leave: function() {
		character_was_selected = true;
	},
	draw: function () {}
});
st.add("Skin", {
	enter: function() {
		skin_was_selected = false;
		skinui.set_visible(true);
		ui.node_visible("label_title", false);
		ui.node_visible("char_list_1_panel", false);
		ui.node_visible("char_list_2_panel", false);
	},
	step: function() {
		//var _left_right = - input_check_pressed("left") + input_check_pressed("right");
		if (left_right != 0) {
			selected_skin = wrap(
				selected_skin + left_right,
				0,
				array_length(Characters[$ selected_char].skinorder)
			);
			selected_skin_name = Characters[$ selected_char].skinorder[selected_skin];
			if (
				array_contains(
					SaveData.characters[$ selected_char].outfits,
					selected_skin_name
				)
			) {
				SaveData.characters[$ selected_char].lastoutfit = selected_skin_name;
			}
			charspr.set_sprite(
				Characters[$ selected_char].skins[$ selected_skin_name].idle
			);
		}
		confirm_state(function () {
			if (
				array_contains(
					SaveData.characters[$ selected_char].outfits,
					selected_skin_name
				)
			) {
				skin_was_selected = true;
				st.change("StageMode");
			}
		});
	},
	leave: function() {
		forcez = false;
		ui.node_visible("label_title", false);
		ui.node_visible("char_list_1_panel", false);
		ui.node_visible("char_list_2_panel", false);
	},
	draw: function () {skinuidraw();}
});
st.add("StageMode", {
	enter: function() {
		forcez = false;
		stagemodewasselected = false;
		stageui.set_visible(true);
		global.currentelement = endless;
	},
	step: function() {
		btn.select(left_right);
		confirm_state(function () {
			stagemodewasselected = true;
			st.change("Stage");
		});
		stagemodeselected = wrap(stagemodeselected + left_right, 0, 3);
		//for (var i = 0; i < array_length(btn); i++) {
			//btn[i].keyboard_selected = i == stagemodeselected;
		//}
	},
	leave: function() {
		forcez = false;
	},
	draw: function () {}
});
st.add("Stage", {
	step: function() {
		stagenum = clamp_wrap(stagenum + left_right, 0, array_length(StagesArr) - 1);
		selected_stage = Stages[$ StagesArr[stagenum]];
		confirm_state();
	},
	leave: function() {
		forcez = false;
	},
	draw: function () {}
});
st.add("GO", {
	enter: function() {
		GameData.on_stage = true;
		GameData.stage_name = selected_stage.name;
		if (!is_undefined(GameData.music)) {
			audio_stop_sound(GameData.music);
		}
		GameData.music = audio_play_sound(
			selected_stage.music,
			0,
			true,
			GameConfig.music_volume
		);
		global.seconds = 0;
		global.minutes = 0;
		GameData.mouseAim = false;
		room_goto(selected_stage.rm);
	},
	step: function() {
		//confirm_state();
	},
	draw: function () {}
});