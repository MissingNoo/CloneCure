if (GameData.is_paused) { exit; }

#region spawn list
var minutes = global.minutes;
if (minutes < 10) {
	minutes = $"0{minutes}";
}
var seconds = floor(global.seconds);
if (seconds < 10) {
	seconds = $"0{seconds}";
}
var time = $"m{minutes}s{seconds}";
if (GameData.on_stage and !is_undefined(Stages[$ "Stage1"][$ "timings"][$ time]) and last_second != seconds) {
	last_second = seconds;
	var arr = Stages[$ "Stage1"][$ "timings"][$ time][$ "add"];
	if (!is_undefined(arr)) {
		array_foreach(arr, function(e, i){
			if (!array_contains(Spawn_List, e)) {
				var weight = Enemies[$ e].weight;
				show_debug_message($"Added {e} to spawn list with weight {weight}");
				repeat (weight) {
					array_push(Spawn_List, e);
				}
			}
		});
	}
	arr = Stages[$ "Stage1"][$ "timings"][$ time][$ "remove"];
	if (!is_undefined(arr)) {
		array_foreach(arr, function(e, i){
			show_debug_message($"Removed {e} from spawn list");
			var index = array_get_index(Spawn_List, e);
			do {
				array_delete(Spawn_List, index, 1);
				index = array_get_index(Spawn_List, e);
			} until (index == -1)
		});
	} 
}
#endregion

#region Border
Stages[$ "Stage1"].tick_border();
//var insts = [oEnemy, oAnvil, oUpgradeNew, oDropParent, oBubba, oBubbaBark, oMascot, oChest];
if (oPlayer.x > room_width / 2) {
with (oMapItemParent) {
		if (x < 1100) {
			x += 2560;
		}
	}
}
if (oPlayer.x < room_width / 2) {
	with (oMapItemParent) {
		if (x >= 2655) {
			x -= 2560;
		}
	}
}
if (oPlayer.y > room_height / 2) {
	with (oMapItemParent) {
		if (y < 1100) {
			y += 2560;
		}
	}
}
if (oPlayer.y < room_height / 2) {
	with (oMapItemParent) {
		if (y >= 2655) {
			y -= 2560;
		}
	}
}
#endregion