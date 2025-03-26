var left_right = - input_check_pressed("left") + input_check_pressed("right");
selected = clamp(selected + left_right, 0, array_length(btn_array) - 1);
if (left_right != 0) {
	array_foreach(btn_array, function(e, i) {
       oMainMenu.buttons[$ e].keyboard_selected = false;
    });
}
buttons[$ btn_array[selected]].keyboard_selected = true;