if (md5_frame < AirLib.frame) {
	current_md5 = md5_file("/home/airgeadlamh/export.ui");
	if (current_md5 != last_md5) {
		show_debug_message("reloading ui");
		f = json_parse(
				buffer_read(
					buffer_load("/home/airgeadlamh/export.ui"),
					buffer_text
				)
			);
		ui = new window(f, false);
		ui.fit_to_gui();
		event_user(0);
	}
	last_md5 = md5_file("/home/airgeadlamh/export.ui");
}
