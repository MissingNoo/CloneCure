ui = new window(global.game_uis.shop);
ui.fit_to_gui();
tabs = ["ability", "stats", "other"];
selected_tab = 0;
coinspr = new animated_sprite(sHolocoin);
item_sprite_x = 40;
item_sprite_y = 40;
item_sprite_scale = 2;
selected_item = "Special_Attack";
text_offset = 30;
text_yoffset = 34;
text_scale = 2;
dbg = dbg_view("Shop", true, gui_x_percent(50));
dbg_section("Positions");
var names = struct_get_names(self);
for (var i = 0; i < array_length(names); i++) {
	if (is_real(self[$ names[i]])) {
		dbg_slider_int(ref_create(self, names[i]), -50, 100, string_first_letter_upper_case(string_replace_all(names[i], "_", " ")));
	}
}