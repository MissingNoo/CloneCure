var left_right = -input_check_pressed("left") + input_check_pressed("right");
//btns.selected = wrap(btns.selected + left_right, 0, array_length(btns.list));
btns.select(left_right);
//if (left_right != 0) {
	//btns.foreach(function(e, i) {
		////e.keyboard_selected = false;
	//});
	//global.currentelement = btns.get_selected();
//}

//if (input_check_pressed("accept")) {
	//btns.get_selected().func();
//}
//start_y = lerp(start_y, 0, 0.1); 
