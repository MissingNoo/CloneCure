stats = new window(global.game_uis.character_stats, false);
stats.fit_to_gui();

line_start = 45;
line_end = 8;
line_y = 2;
text_scale = 2;
text_y = 17;

start_x = -300;

icon_x_offset = 3;
icon_y_offset = 13;
icon_scale = 2;
dbg = dbg_view("stats", true, gui_x_percent(65));
dbg_section("Position");
dbg_slider_int(ref_create(self, "line_start"), 0, 50, "Line Start");
dbg_slider_int(ref_create(self, "line_end"), 0, 50, "Line End");
dbg_slider_int(ref_create(self, "line_y"), 0, 50, "Line Y");
dbg_slider(ref_create(self, "text_scale"), 0, 50, "Text Scale");
dbg_slider_int(ref_create(self, "text_y"), 0, 50, "Text Y");
dbg_slider_int(ref_create(self, "icon_x_offset"), 0, 50, "Icon X");
dbg_slider_int(ref_create(self, "icon_y_offset"), 0, 50, "Icon Y");
dbg_slider_int(ref_create(self, "icon_scale"), 0, 50, "Icon Scale");
dbg_slider_int(ref_create(self, "start_x"), -500, 0, "start_x");
