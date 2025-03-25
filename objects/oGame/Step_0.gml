if (keyboard_check_pressed(vk_escape)) {
	if (!instance_exists(oPauseUI)) {
        surf = surface_recreate(surf, surface_get_width(application_surface), surface_get_height(application_surface));
        surface_copy(surf, 0, 0, application_surface);
        instance_deactivate_all(true);
        instance_activate_object(input_controller_object);
        instance_activate_object(oGameUI);
        is_paused = true;
    	instance_create_depth(0, 0, -1100, oPauseUI);
    } else {
    	instance_destroy(oPauseUI);
        is_paused = false;
        instance_activate_all();
    }
}
if (is_paused) { exit; }

if (spawn_frame < frame) {
	var place = irandom_range(1,4);
    var _x = oPlayer.x;
    var _y = oPlayer.y;
    switch (place) {
        case 1:
            _y -= camera_get_view_height(view_camera[0]) - 16;
            _x += random_range(0, camera_get_view_width(view_camera[0]) + 16);
            break;
        case 2:
            _y += camera_get_view_height(view_camera[0]) + 16;
            _x += random_range(0, camera_get_view_width(view_camera[0]) + 16);
            break;
        case 3:
            _x -= camera_get_view_width(view_camera[0]) - 16;
            _y += random_range(0, camera_get_view_height(view_camera[0]) + 16);
            break;
        case 4:
            _x += camera_get_view_width(view_camera[0]) + 16;
            _y += random_range(0, camera_get_view_height(view_camera[0]) + 16);
            break;
    }
    spawn_frame = frame + 120;
    instance_create_layer(_x, _y, "Instances", oEnemy, {
        name : "Urufugang"
    });
}

if (ds_queue_size(dir_queue) > 0 and !is_paused) {
	var e = ds_queue_dequeue(dir_queue);
    if (instance_exists(e)) {
        with (e) {
        	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
            if (x < oPlayer.x) {
            	image_xscale = abs(image_xscale);
            } else if (sign(image_xscale)) {
            	image_xscale = image_xscale * -1;
            }
            ds_queue_enqueue(oGame.dir_queue, self.id);
        }
    }
}