var left_right = - input_check_pressed("left") + input_check_pressed("right");
selected = wrap(selected + left_right, 0, array_length(btn_array));
if (left_right != 0) {
	array_foreach(btn_array, function(e, i) {
       oMainMenu.buttons[$ e].keyboard_selected = false;
    });
}
buttons[$ btn_array[selected]].keyboard_selected = true;
if (input_check_pressed("accept")) {
	buttons[$ btn_array[selected]].func();
}
//start_y = lerp(start_y, 0, 0.1);