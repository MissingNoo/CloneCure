function GrabDirection() {
	with (oStage) {
		
	
	var amountOfQuadrants = array_length(selectableQuadrants);
	if (amountOfQuadrants == 0) {
		array_copy(selectableQuadrants, 0, selectableQuadrantsContainer, 0, 4);
		amountOfQuadrants = array_length(selectableQuadrants);
	}
	var randomQuadrant = irandom(amountOfQuadrants - 1);
	var randomQuadrantIndex = selectableQuadrants[randomQuadrant];
	array_delete(selectableQuadrants, randomQuadrant, 1);
	var amountOfSlices = array_length(directions[randomQuadrantIndex]);
	if (amountOfSlices == 0) {
		array_copy(
			directions[randomQuadrantIndex],
			0,
			directionsContainer[randomQuadrantIndex],
			0,
			quadrantSize
		);
		amountOfSlices = array_length(directions[randomQuadrantIndex]);
	}
	var randomSliceIndex = irandom(amountOfSlices - 1);
	var randomSlice = directions[randomQuadrantIndex][randomSliceIndex];
	array_delete(directions[randomQuadrantIndex], randomSliceIndex, 1);
	return randomSlice;
	}
}

function spawn_enemy(_x, _y, name, dataset = {}) {
	name = string_lower(name);
	var e = instance_create_layer(_x, _y, "Instances", oEnemy, {name});
	var datanames = variable_struct_get_names(dataset);
	for (var i = 0; i < array_length(datanames); i++) {
		var cur = datanames[i];
		switch (cur) {
			case "id":
			case "dir":
			case "amount":
			case "spacing":
			case "level":
				continue;
			case "dirMoving":
				e.lock_dir_frame = 1;
				cur = "direction";
			default:
				break;
		}
		e[$cur] = dataset[$datanames[i]];
	}
	if (!is_undefined(dataset[$"spawnOverride"])) {
		datanames = variable_struct_get_names(dataset.spawnOverride);
		for (var i = 0; i < array_length(datanames); i++) {
			var cur = datanames[i];
			switch (cur) {
				case "HP":
					cur = "hp";
					break;
				case "ignoreHalu":
					cur = "ignore_halu";
					break;
				case "knockbackImmune":
					cur = "knockback_immune";
					break;
				case "canFreeze":
					cur = "can_freeze";
					break;
				case "lifeTime":
					e.alarm[0] = dataset.spawnOverride.lifeTime;
					continue;
				default:
					break;
			}
			e[$cur] = dataset.spawnOverride[$datanames[i]];
		}
	}
}

function get_spawn_dir() {
	var pos = {};
	var dir = GrabDirection();
	if (instance_exists(oPlayer)) {
		pos.x = round(
			oPlayer.x + lengthdir_x((camera_get_view_width(view_camera[0]) / 1.5), dir)
		);
		pos.y = round(
			oPlayer.y + lengthdir_y((camera_get_view_height(view_camera[0]) / 1.5), dir)
		);
	}
	return pos;
}

function clumped_spawn(name, count) {
	trace($"Spawned {count} {name}");
	var pos = get_spawn_dir();
	oStage.mobs_spawned += count;
	repeat (count) {
		spawn_enemy(pos.x, pos.y, name);
	}
}
