event_inherited();
buyselected = 0;
image_xscale = -1;
visible = true;
ui = new window(global.game_uis.bloop);
buy = new button("Buy");
buy.set_function(method(self, function () {
	state.change("buy");
}));
sell = new button("Sell");
exchange = new button("Exchange");
talk = new button("Talk");
quit = new button("Quit");
quit.set_function(method(self, function () {
	state.change("idle");
}));
btns = new ui_element_list();
btns.add(buy).add(sell).add(exchange).add(talk).add(quit);
btns.foreach(function (e, i) {
	e.unselect_on_leave = false;
});
can_open = true;
state = new SnowState("idle");
enable_buttons = function (boolean) {
	GameData.bloopbool = boolean;
	btns.foreach(function (e, i) {
		e.enabled = GameData.bloopbool;
	});
}
state.add("idle",
{
	enter : function () {
		GameData.on_dialog = false;
		call_later(10, time_source_units_frames, method(self, function () {
			can_open = true;
		}));
	},
	step : function () {
		if (distance_to_object(oPlayerWorld) < 20 and input_check_released("accept")) {
			state.change("menu");
		}
	},
	leave : function () {
		GameData.on_dialog = true;
		can_open = false;
	},
	update : function () {}
});
state.add("menu",
{
	enter : function () {
		btns.select("reset");
		enable_buttons(true);
	},
	step : function () {
		if (state.get_current_state() == "menu") {
			btns.select(- input_check_pressed("up") + input_check_pressed("down"));
		}
		if (input_check_pressed("cancel")) {
			state.change(state.get_current_state() == "menu" ? "idle" : "menu");
		}
	},
	leave : function () {
		enable_buttons(false);
	},
	update : function () {}
});
state.add_child("menu", "buy",
{
	enter : function () {},
	step : function () {
		state.inherit();
		buyselected = clamp(buyselected - input_check_pressed("up") + input_check_pressed("down"), 0, 5);
	},
	update : function () {}
});
state.add_child("menu", "sell",
{
	enter : function () {},
	step : function () {
		state.inherit();
	},
	update : function () {}
});
buysurfacebase = -1;
buysurface = -1;