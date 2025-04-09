baseW = 640;
baseH = 360;
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, baseW, baseH, 0, oCam, -1, -1, 400, 250);
xoffset = 0;
yoffset = 0;
xx = 0;
yy = 0;
/// @description 
// Camera
camera	= view_camera[0];

// Set up 3D camera
camDist	= -400; // Distance
camFov	= 50; // Field of view
camAsp	= camera_get_view_width(camera) / camera_get_view_height(camera); // Aspect ratio

camDistRaw = camDist; // Raw value, used as interpolation target
camDistFar = camDist; // Far distance
camDistFoc = camDist / 4; // Focused distance
camFocused = false; // Is it focused on the player?

// Rotation
camSensitivityX = 1;
camSensitivityY = 1;

camAngleXRaw = 90;
camAngleYRaw = -50;
camAngleX = camAngleXRaw;
camAngleY = camAngleYRaw;

// Vars
mouse_x_prev = 0;
mouse_y_prev = 0;

// Feather disable once GM1041
dbg = dbg_view("Cam", true, gui_x_percent(25));
dbg_section("Cam Options");
var names = struct_get_names(self);
for (var i = 0; i < array_length(names); i++) {
	if (is_real(self[$ names[i]])) {
		dbg_slider_int(ref_create(self, names[i]), -500, 500, string_first_letter_upper_case(string_replace_all(names[i], "_", " ")));
	}
}