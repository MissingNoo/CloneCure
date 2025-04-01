key.animate();
var up_down = - input_check_pressed("up") + input_check_pressed("down");
var left_right = - input_check_pressed("left") + input_check_pressed("right");
if (selected_option < 4) {
	selected_option = clamp(selected_option + up_down, 0, 4);
} else {
	if (up_down == -1) {
		selected_option = 3;
		exit;
	}
	selected_option = clamp(selected_option + left_right, 4, 6);
}
switch (selected_option) {
	case 4:
		reroll.keyboard_selected = true;
		eliminate.keyboard_selected = false;
		hold.keyboard_selected = false;
		break;
	case 5:
		reroll.keyboard_selected = false;
		eliminate.keyboard_selected = true;
		hold.keyboard_selected = false;
		break;
	case 6:
		reroll.keyboard_selected = false;
		eliminate.keyboard_selected = false;
		hold.keyboard_selected = true;
		break;
	default:
		reroll.keyboard_selected = false;
		eliminate.keyboard_selected = false;
		hold.keyboard_selected = false;
		break;
}
