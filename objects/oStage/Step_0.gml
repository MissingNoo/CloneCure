if (GameData.is_paused) {
	exit;
}
frame_since_last++;
enemy_amount = instance_number(oEnemy);
if (spawn_frame < AirLib.frame) {
	var place = irandom_range(1, 4);
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
	spawn_frame = AirLib.frame + spawn_rate;
	var sstepspawn_amount = max(
		1,
		(
			round(
				(
					spawn_amount
						+ additional_spawn
						+ shop_level("Marketing")
							* (
								GameData.stage_mode == "STAGE"
									|| GameData.stage_mode == "ENDLESS"
							)
				) / reduced_spawn
			)
				+ (GameData.stage_mode == "TIME") * timemode_spawn_scale
		)
	);
	for (
		var stepspawn_amount = sstepspawn_amount;
		stepspawn_amount > 0;
		stepspawn_amount--
	) {
		if (array_length(Spawn_List) > 0 && enemy_amount < enemy_limit) {
			var pos = get_spawn_dir();
			spawn_enemy(pos.x, pos.y, Spawn_List[irandom(array_length(Spawn_List) - 1)]);
			frame_since_last = 0;
			mobs_spawned++;
		}
	}
}
queue_repeats = clamp(queue_repeats + (fps_average > 80 ? 1 : -1), 1, enemy_amount);
repeat (queue_repeats) {
	if (ds_queue_size(dir_queue) > 0 && !GameData.is_paused) {
		var e = ds_queue_dequeue(dir_queue);
		if (instance_exists(e)) {
			with (e) {
				if (hp <= 0) {
					exit;
				}
				if (lock_dir_frame != 0 and AirLib.frame > lock_dir_frame) {
					exit;
				}
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
}
