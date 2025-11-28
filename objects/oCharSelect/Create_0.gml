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
	selected_char = agencie_chars[selected];
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

corps_x_offset = 300;
corps_panel_x_base = undefined;
corps_approach = 30;
event_user(2);

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
event_user(1);
agencie_chars = chars;
select_char();