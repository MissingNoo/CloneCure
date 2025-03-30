var scale = os_type == os_android ? 2 : 1;
display_set_gui_maximise(scale, scale);
#macro frame global.current_frame
frame = 0;
surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
GameData.is_paused = false;
GameData.on_stage = false;
lastroom = room;