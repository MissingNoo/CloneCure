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
    
    static draw = function() {
        if (!enabled) {
            exit;
        }
        draw_sprite_ext(sHudJoystick, 0, startx, starty, 0.5, 0.5, 0, c_white, 1);
        var _xlen = clamp(abs(x - startx), 0, sprite_get_width_ext(sHudJoystick, 0.3));
        var _ylen = clamp(abs(y - starty), 0, sprite_get_width_ext(sHudJoystick, 0.3));
        var _x = lengthdir_x(_xlen, point_direction(startx, starty, x, y));
        var _y = lengthdir_y(_ylen, point_direction(startx, starty, x, y));
        draw_sprite_ext(sHudJoystick, 1, startx + _x, starty + _y, 0.5, 0.5, 0, c_white, 1);
    }
}
GameData.touch = {
	left : new touch_control(),
	right : new touch_control()
}