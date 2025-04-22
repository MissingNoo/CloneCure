coinspr.animate();
var left = input_check_pressed("left");
var up = input_check_pressed("up");
var down = input_check_pressed("down");
var right = input_check_pressed("right");
switch (selecting) {
	case "item":
        var cant = [2, 5, 8, 11];
        if (right and !array_contains(cant, selected_item_num)) {
        	selected_item_num++;
        }
        if (up and selected_item_num - 3 > 0) {
        	selected_item_num -= 3;
        }
        if (down and selected_item_num + 3 < array_length(tab_items) - 1) {
        	selected_item_num += 3;
        }
        var go_to_tab = [0, 3, 6, 9];
        if (left) {
            if (!array_contains(go_to_tab, selected_item_num)) {
            	selected_item_num--;
            } else {
            	selecting = "tab";
            }
        }
        selected_item = tab_items[selected_item_num];
        break;
    case "tab":
        selected_tab = clamp(selected_tab - up + down, 0, 2);
        update_tab();
        if (right) {
        	selecting = "item";
        }
        break;
}
