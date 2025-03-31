start_x = lerp(start_x, 0, 0.2);
var up_down = - input_check_pressed("up") + input_check_pressed("down");
selected = clamp(selected + up_down, 0, array_length(btn_array) - 1);
if (up_down != 0) {
	array_foreach(btn_array, function(e, i) {
       oPauseUI.buttons[$ e].keyboard_selected = false;
    });
    buttons[$ btn_array[selected]].keyboard_selected = true;
}