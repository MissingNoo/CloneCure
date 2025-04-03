if (file_exists(game_save_id + "SaveData.json")) {
	SaveData = json_load(game_save_id + "SaveData.json");
	update_save_data();
}
#macro frame global.current_frame
frame = 0;
surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
GameData.is_paused = false;
GameData.on_stage = false;
lastroom = room;
function touch_control() constructor {
	enabled = false;
	device = undefined;
	x = 0;
	y = 0;
	startx = undefined;
	starty = undefined;
	
	static get_direction = function() {
		return point_direction(startx, starty, x, y);
	}
	
	static reset = function() {
		x = 0;
		y = 0;
		startx = undefined;
		starty = undefined;
		device = undefined;
		enabled = false;
	}
}
GameData.touch = {
	left : new touch_control(),
	right : new touch_control()
}