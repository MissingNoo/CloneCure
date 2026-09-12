selected = undefined;
pos = 0;
row = 0;
stats = instance_create_depth(x, y, depth, oPlayerStatsUI);
ui = undefined;
option = 0;
btns = new ui_element_list();
event_user(0);
st = new SnowState("idle");
st.add("idle",
	{
		enter: function () {
			ui.node_visible("Enchant_button", false);
			ui.node_visible("Upgrade_button", false);
		},
		step : function () {
			if (input_check_pressed("up") or input_check_pressed("down")) {
				row = !row;
			}
			var left_right = - input_check_pressed("left") + input_check_pressed("right");
			pos = clamp_wrap(pos + left_right, 0, 5);
			var iw = row == 0 ? Player_Weapons : Player_Items;
			selected = iw[pos];
			if (!is_undefined(selected)) {
				Upgrade_button.enabled = true;
				if (row == 0 and selected.level == selected.max_level) {
					var en_value = 50 + (50 * selected.enhacement);
					Upgrade_button.text = $"ENHANCE ({en_value})";
					if (en_value > GameData.stage_coins) {
						Upgrade_button.enabled = false;
					}
				} else {
					Upgrade_button.text = $"UPGRADE";
				}
			}
			if (input_check_released("cancel")) {
				global.events.broadcast("pause", "anvil");
			}
			if (input_check_released("accept") and !is_undefined(selected)) {
				if (row == 0 or (row == 1 and selected.level < selected.maxlevel)) {
					st.change("selected");
				}
			}
		}
	}
);
st.add("selected", {
	enter: function () {
		ui.node_visible("Enchant_button", true);
		ui.node_visible("Upgrade_button", true);
		option = 0;
		btns.set_selected(option);
	},
	step : function () {
		var _lr = - input_check_pressed("left") + input_check_pressed("right")
		btns.select(_lr);
		if (input_check_released("cancel")) {
			st.change("idle");
		}
	}
})