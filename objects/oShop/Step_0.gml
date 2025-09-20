coinspr.animate();
var left = input_check_pressed("left");
var up = input_check_pressed("up");
var down = input_check_pressed("down");
var right = input_check_pressed("right");
var confirm = input_check_pressed("accept");
var cancel = input_check_pressed("cancel") or device_mouse_check_button(1, mb_left);
switch (selecting) {
	case "item":
		var cant = [2, 5, 8, 11, 14];
		if (right && !array_contains(cant, selected_item_num)) {
			selected_item_num++;
		}
		if (up && selected_item_num - 3 >= 0) {
			selected_item_num -= 3;
		}
		if (down && selected_item_num + 3 < array_length(tab_items)) {
			selected_item_num += 3;
		}
		var go_to_tab = [0, 3, 6, 9, 12];
		if (left) {
			if (!array_contains(go_to_tab, selected_item_num)) {
				selected_item_num--;
			} else {
				selecting = "tab";
			}
		}
		selected_item_num = clamp(selected_item_num, 0, array_length(tab_items) - 1);
		selected_item = tab_items[selected_item_num];
		if (confirm) {
			selecting = "buysell";
		}
		break;
	case "tab":
		tab_arrow_offset = sine_between(
			current_time / 1000,
			tab_arrow_offset_speed,
			-tab_arrow_offset_dist,
			tab_arrow_offset_dist
		);
		selected_tab = clamp(selected_tab - up + down, 0, 2);
		update_tab();
		if (right) {
			selecting = "item";
		}
		if (cancel) {
			room_goto(rMainMenu);
		}
		break;
	case "buysell":
		if (cancel || device_mouse_check_button_released(0, mb_right)) {
			selecting = "item";
		}
		var sitem = Shop.upgrades[$ selected_item];
		if (sitem.level == array_length(sitem.cost)) {
			buysell = 1;
			buybutton.set_enabled(false);
			sellbutton.set_enabled(true);
		}
		if (sitem.level == 0) {
			buysell = 0;
			buybutton.set_enabled(true);
			sellbutton.set_enabled(false);
		}
		if (between(sitem.level, 1, array_length(sitem.cost) - 1)) {
			buybutton.set_enabled(true);
			sellbutton.set_enabled(true);
		}
		if (right && sellbutton.enabled) {
			buysell = 1;
		}
		if (left && buybutton.enabled) {
			buysell = 0;
		}
		buybutton.keyboard_selected = buysell == 0;
		sellbutton.keyboard_selected = buysell == 1;
		if (confirm) {
			switch (buysell) {
				case 0:
					buybutton.func();
					break;
				case 1:
					sellbutton.func();
					break;
			}
		}
		break;
}
