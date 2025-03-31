for (var i = array_length(bars) - 1; i >= 0; i--) {
    bars[i][0] += bars[i][3];
    if (bars[i][0] > gui_x_percent(100)) {
    	array_delete(bars, i, 1);
    }
}
//if (global.reset_button) {
	array_foreach(btn_array, function(e, i) {
        if (oMainMenu.buttons[$ e].on_area) {
        	oMainMenu.selected = array_get_index(oMainMenu.btn_array, e);
        }
    });
    buttons[$ btn_array[selected]].keyboard_selected = true;
//}