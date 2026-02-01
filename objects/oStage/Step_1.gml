if (GameData.is_paused) {
	exit;
}

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
if (
	GameData.on_stage
	&& !is_undefined(Stages[$ GameData.stage_name][$ "timings"][$ time])
	&& last_time != time
) {
	var arr = Stages[$ GameData.stage_name][$ "timings"][$ time][$ "add"];
	if (!is_undefined(arr)) {
		array_foreach(arr, function(e, i) {
			add_mob_choice(e);
		});
	}
	arr = Stages[$ GameData.stage_name][$ "timings"][$ time][$ "remove"];
	if (!is_undefined(arr)) {
		array_foreach(arr, function(e, i) {
			remove_mob_choice(e);
		});
	}
	arr = Stages[$ GameData.stage_name][$ "timings"][$ time][$ "script"];
	global.dd = Stages[$ GameData.stage_name][$ "timings"][$ time][$ "data"];
	if (!is_undefined(arr)) {
		array_foreach(arr, function(e, i) {
			var dd = global.dd[i];
			if (!is_method(e)) {
				method(instance_find(oStage, 0), e)(dd);
			} else {
				e(dd);
			}
			//trace("ran script");
		});
	}
}
last_time = time;
#endregion

#region Border
Stages[$ GameData.stage_name].tick_border();
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
last_second = seconds;