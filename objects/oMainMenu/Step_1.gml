for (var i = array_length(bars) - 1; i >= 0; i--) {
    bars[i][0] += bars[i][3];
    if (bars[i][0] > gui_x_percent(100)) {
    	array_delete(bars, i, 1);
    }
}
//if (global.reset_button) {
	btns.foreach(function(e, i) {
        if (e.on_area) {
        	oMainMenu.btns.selected = array_get_index(oMainMenu.btns.list, e);
        }
    })
    btns.get_selected().keyboard_selected = true;
//}