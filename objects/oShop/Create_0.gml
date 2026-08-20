ui = new window(global.game_uis.shop);
mx = 0;
my = 0;
mxprevious = 0;
myprevious = 0;
ui.fit_to_gui();
tabs = ["ability", "stats", "other"];
selected_tab = 0;
coinspr = new animated_sprite(sHolocoin);
desc_wrap = 620;
item_sprite_x = 40;
item_sprite_y = 40;
item_sprite_scale = 2;
item_s_offset = 5;
cost_xoffset = 130;
cost_yoffset = 65;
cost_scale = 2;
tab_items = [];
selecting = "tab";
buysell = 0;
sc_offset = 0;
sc_yoffset = 0;
sc_item_width = 0;
sc_item_height = 0;
yscroll = 0;

buyfunc = function() {
	var sitem = Shop.upgrades[$ selected_item];
	SaveData.money -= sitem.cost[sitem.level];
	sitem.level++;
};
buybutton = new button("Buy");
buybutton.enabled = true;
buybutton.set_function(method(self, buyfunc));
buybutton
	.set_on_area_function(method(self, function() {
		buysell = 0;
	}));

sellfunc = function() {
	var sitem = Shop.upgrades[$ selected_item];
	sitem.level--;
	SaveData.money += sitem.cost[sitem.level];
};
sellbutton = new button("Refund");
sellbutton.enabled = true;
sellbutton.set_function(method(self, sellfunc));
sellbutton
	.set_on_area_function(method(self, function() {
		buysell = 1;
	}));

update_tab = function() {
	tab_items = [];
	var names = struct_get_names(Shop.upgrades);
	for (var i = 0; i < array_length(names); i++) {
		if (Shop.upgrades[$ names[i]].type == tabs[selected_tab]) {
			array_push(tab_items, names[i]);
		}
	}
	array_sort(tab_items, true);
};
update_tab();
tab_arrow_offset = 0;
tab_arrow_offset_dist = 10;
tab_arrow_offset_speed = 2;
tab_arrow_offset_scale = 3;

selected_item = tab_items[0];
selected_item_num = 0;
text_offset = 30;
text_yoffset = 34;
text_scale = 2;
category_text_offset = 12;
category_text_scale = 2;

coins_offset = 2;
coins_yoffset = 53;
coins_scale = 4;

dbg = dbg_view("Shop", false, gui_x_percent(10));
dbg_section("Positions");
var names = struct_get_names(self);
for (var i = 0; i < array_length(names); i++) {
	if (is_real(self[$ names[i]])) {
		dbg_slider_int(
			ref_create(self, names[i]),
			-50,
			100,
			string_first_letter_upper_case(string_replace_all(names[i], "_", " "))
		);
	}
}
event_user(0);