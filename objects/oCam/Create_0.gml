aspect = display_get_aspect_ratio();
baseW = 640;
baseH = 360;
if (os_type == os_android) {
	do {
		baseW += .1;
	} until (baseW / baseH == aspect);
}
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, baseW, baseH, 0, oCam, -1, -1, 400, 250);

xoffset = 0;
yoffset = 0;
//Second player small cam
// if (!instance_exists(oOtherCam)) {
// 	instance_create_depth(x, y, depth, oOtherCam, {inst : oPlayer});
// 	view_visible[1] = true;
// 	view_camera[1] = camera_create_view(0, 0, baseW, baseH, 0, oOtherCam, -1, -1, 400, 250);
// }
// game_width, game_height are your base resolution (ideally constants)
game_width = camera_get_view_width(view_camera[0]);
game_height = camera_get_view_height(view_camera[0]);
camera_set_view_size(view_camera[0], game_width, game_height);
camera_set_view_size(view_camera[1], game_width, game_height);

GameData.GameSurf = -1;
GameData.GameSurf2 = -1;
