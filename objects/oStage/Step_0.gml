if (GameData.is_paused) { exit; }

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
    if (array_length(Spawn_List) > 0) {
    	instance_create_layer(_x, _y, "Instances", oEnemy, {
            name : Spawn_List[irandom(array_length(Spawn_List) - 1)]
        });
    }
    
}

if (ds_queue_size(dir_queue) > 0 and !GameData.is_paused) {
	var e = ds_queue_dequeue(dir_queue);
    if (instance_exists(e)) {
        with (e) {
            if (hp <= 0) { exit; }
        	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
            if (x < oPlayer.x) {
            	image_xscale = abs(image_xscale);
            } else if (sign(image_xscale)) {
            	image_xscale = image_xscale * -1;
            }
            ds_queue_enqueue(oStage.dir_queue, self.id);
        }
    }
}