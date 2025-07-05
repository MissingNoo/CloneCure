btn[stagemodeselected].keyboard_selected = true;
charspr.animate();
var left_right = input_check_pressed("right") - input_check_pressed("left");
var up_down = input_check_pressed("down") - input_check_pressed("up");
if (left_right != 0 or up_down != 0) {
	if (!character_was_selected) {
		if (up_down == 1) {
			if (selected <= 10) {
				up_down = 10;
			} else {
				up_down = 9
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
		select_char();
		exit;
	}
	
	if (skin_was_selected) {
		stagemodeselected = wrap(stagemodeselected + left_right, 0, 3);
		for (var i = 0; i < array_length(btn); i++) {
			btn[i].keyboard_selected = i == stagemodeselected;
		}
		exit;
	}
}

if (keyboard_check_released(ord("X")) or device_mouse_check_button_released(0, mb_right)) {
	if (stagemodewasselected) {
		stagemodewasselected = false;
		exit;
	}
	
	if (skin_was_selected) {
		skin_was_selected = false;
		exit;
	}
	
	if (character_was_selected) {
		character_was_selected = false;
		skinui.set_visible(false);
		ui.node_visible("label_title");
		ui.node_visible("char_list_1");
		ui.node_visible("char_list_2");
		exit;
	}
	
	
}
if (keyboard_check_released(ord("Z")) or forcez) {
    forcez = false;
	if (stagemodewasselected) {
		GameData.on_stage = true;
		if (!is_undefined(GameData.music)) { audio_stop_sound(GameData.music); }
		GameData.music = audio_play_sound(selected_stage.music, 0, -1, GameConfig.music_volume);
		global.seconds = 0;
		global.minutes = 0;
		room_goto(selected_stage.rm);
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
}

character_selected_offset = lerp(character_selected_offset, character_was_selected ? character_selected_max_offset : 0, 0.4);
stageoffset = lerp(stageoffset, (skin_was_selected ? 0 : gui_w) - (stagemodewasselected ? gui_w : 0), 0.4);
charoffset = lerp(charoffset, 20, 0.3);