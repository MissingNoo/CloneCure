if (keyboard_check(vk_shift) && keyboard_check_pressed(vk_enter)) {
	file_copy("/tmp/export.ui", "/tmp/export.ui.bkp");
	oEditableUI.save("/tmp/export.ui");
}
if (keyboard_check(vk_control) && keyboard_check_pressed(vk_enter)) {
	ui.dispose();
	ui = new window(
		json_parse(
			buffer_read(
				buffer_load("/tmp/export.ui"),
				buffer_text
			)
		),
		true
	);
	ui.edit_mode(true);
}