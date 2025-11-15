md5_frame = 0;
last_md5 = "";

//display_set_gui_maximise(1.5, 1.5);
force_click = function() {
	if (gui_can_interact()) {
		forcez = true;
	}
};
stage_skin_click_area = [0, 0, 0, 0];
lastw = 0;
force_x = false;
setmiddle = false;
setmiddle2 = false;
middle = 0;
middle2 = 0;
selectarrow = new animated_sprite(sSelectArrow);
charportround = 3;
forcez = false;
repeat (6) {
	instance_create_depth(irandom(gui_w), 0, 1000, oTriangle);
}

skinui = new window(global.game_uis.skin_area);
skinui.fit_to_gui();
skinui.set_visible(false);
stageui = new window(global.game_uis.stage_mode);
stageui.fit_to_gui();
stageui.set_visible(false);

stageinfo = new window(global.game_uis.stage_info);
stageinfo.fit_to_gui();

chars = struct_get_names(Characters);
array_sort(chars, true);
selected_char = "Amelia_Watson";
charspr = new animated_sprite(Characters[$ selected_char].idle_sprite);
selected = 0;
char1o = 92;
char1yo = 70;

charxoff = 200;

recsyoff = 30;
recyoff = 40;
recscale = 2;

selected_skin = 0;
selected_skin_name = "base";

select_char = function() {
	if (selected < 0 || selected > struct_names_count(Characters) - 1) {
		exit;
	}
	selected_char = chars[selected];
	GameData.selected_character = selected_char;
	//charspr.set_sprite(Characters[$ selected_char].idle_sprite);
	selected_skin_name = SaveData.characters[$ selected_char].lastoutfit;
	selected_skin = array_get_index(
		Characters[$ selected_char].skinorder,
		selected_skin_name
	);
	charspr.set_sprite(Characters[$ selected_char].skins[$ selected_skin_name].idle);
	charoffset = -(
		sprite_get_width_ext(Characters[$ selected_char].title_sprite, charscale) + 20
	);
};
mx = 0;
my = 0;
lmxx = 0;
lmy = 0;
character_was_selected = false;
character_selected_offset = 0;
character_selected_max_offset = 430;
skin_was_selected = false;

stagenum = 0;
selected_stage = Stages[$ StagesArr[stagenum]];
stageoffset = gui_w;
stagemode = false;
stagemodeselected = 0;
stagemodewasselected = false;

button_scale = 1;
button_text_y = 1;
btnfunc = function() {
	draw_sprite_stretched(
		sUpgradeBackgroundWH,
		3,
		area[0],
		area[1],
		area[2] - area[0],
		area[3] - area[1]
	);
	scribble($"[fa_center][fa_middle]{text}")
		.scale(2)
		.draw((area[0] + area[2]) / 2, area[1] + 25);
	if (on_area) {
		draw_set_alpha(0.25);
		draw_sprite_stretched(
			sUpgradeBackgroundWH,
			0,
			area[0],
			area[1],
			area[2] - area[0],
			area[3] - area[1]
		);
		draw_set_alpha(1);
	}
};
//on_area_func = function() {
	//oCharSelect.time.keyboard_selected = false;
	//oCharSelect.endless.keyboard_selected = false;
	//oCharSelect.stage.keyboard_selected = false;
	//keyboard_selected = true;
	//global.currentelement = array_get_index(oCharSelect.btn, self);
//};

time = new button("Time");
time.custom_draw = method(time, btnfunc);
//time.set_on_area_function(method(time, on_area_func));
time.use_text = false;
time.desc = "test";
time.set_function(function() {
	GameData.stage_mode = "TIME";
	forcez = true;
});
endless = new button("Endless");
endless.custom_draw = method(endless, btnfunc);
//endless.set_on_area_function(method(endless, on_area_func));
endless.use_text = false;
endless.desc = "test";
endless
	.set_function(function() {
		GameData.stage_mode = "ENDLESS";
		forcez = true;
	});
stage = new button("Stage");
stage.custom_draw = method(stage, btnfunc);
//stage.set_on_area_function(method(stage, on_area_func));
stage.use_text = false;
stage.desc = "test";
stage
	.set_function(function() {
		GameData.stage_mode = "STAGE";
		forcez = true;
	});
btn = new ui_element_list();
btn.add(
	[
		stage, 
		endless, 
		time
	]
)

charscale = 4;
chary = 180;
charoffset = 0;

skinselect = false;
skin_scale = 6;
dbg = dbg_view("CharSelect", false, gui_x_percent(50));
dbg_section("Position");
create_view_from_instance(self);
left_right = 0;
up_down = 0;

ui = new window(variable_clone(global.game_uis.select), false);
ui.fit_to_gui();
event_user(0);
//ui.node_visible("label_title", true);
//ui.node_visible("char_list_1_panel", true);
//ui.node_visible("char_list_2_panel", true);

st = new SnowState("Char");
st.add("Char", {
	enter: function() {
		charxoff = 1800;
		skinui.set_visible(false);
		ui.node_visible("label_title", true);
		ui.node_visible("char_list_1_panel", true);
		ui.node_visible("char_list_2_panel", true);
		character_was_selected = false;
	},
	step: function() {
		if (
			input_check_pressed("cancel")
			|| device_mouse_check_button_pressed(0, mb_right)
			|| force_x
		) {
			room_goto(rMainMenu);
		}
		if (input_check_pressed("accept") || forcez) {
			character_was_selected = true;
			st.change("Skin");
		}
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
	leave: function() {},
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
		if (input_check_pressed("accept") || forcez) {
			if (
				array_contains(
					SaveData.characters[$ selected_char].outfits,
					selected_skin_name
				)
			) {
				skin_was_selected = true;
				st.change("StageMode");
			}
		}
		if (
			input_check_pressed("cancel")
			|| device_mouse_check_button_pressed(0, mb_right)
			|| force_x
		) {
			st.change("Char");
		}
	},
	leave: function() {
		forcez = false;
		ui.node_visible("label_title", false);
		ui.node_visible("char_list_1_panel", false);
		ui.node_visible("char_list_2_panel", false);
	},
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
		if (input_check_pressed("accept") || forcez) {
			stagemodewasselected = true;
			st.change("Stage");
		}
		if (
			input_check_pressed("cancel")
			|| device_mouse_check_button_pressed(0, mb_right)
			|| force_x
		) {
			st.change("Skin");
		}
		stagemodeselected = wrap(stagemodeselected + left_right, 0, 3);
		//for (var i = 0; i < array_length(btn); i++) {
			//btn[i].keyboard_selected = i == stagemodeselected;
		//}
	},
	leave: function() {
		forcez = false;
	},
});
st.add("Stage", {
	step: function() {
		stagenum = clamp_wrap(stagenum + left_right, 0, array_length(StagesArr) - 1);
		selected_stage = Stages[$ StagesArr[stagenum]];
		if (input_check_pressed("accept") || forcez) {
			st.change("GO");
		}
		if (
			input_check_pressed("cancel")
			|| device_mouse_check_button_pressed(0, mb_right)
			|| force_x
		) {
			st.change("StageMode");
		}
	},
	leave: function() {
		forcez = false;
	},
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
		if (
			input_check_pressed("cancel")
			|| device_mouse_check_button_pressed(0, mb_right)
			|| force_x
		) {
			st.change("Stage");
		}
	},
});
select_char();