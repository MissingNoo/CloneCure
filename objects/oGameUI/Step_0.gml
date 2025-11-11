
//if (os_type == os_android) {
//display_set_gui_size(display_get_width(), display_get_height());
//ui.fit_to_gui();
//}
//if (keyboard_check_released(vk_backspace)) {
//surface_free(itemssurf);
//}
//display_set_gui_size(window_get_width(), window_get_height());
//ui.fit_to_gui();
a += (-keyboard_check_pressed(vk_pageup) + keyboard_check_pressed(vk_pagedown)) * 0.1;
a += -keyboard_check_pressed(vk_home) + keyboard_check_pressed(vk_end);
coinspr.animate();
