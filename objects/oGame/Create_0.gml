#macro frame global.current_frame
frame = 0;
surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
is_paused = false;
//depth = oGameUI.depth + 1;
dir_queue = ds_queue_create();
spawn_frame = 0;
last_second = "";
GameData.on_stage = false;