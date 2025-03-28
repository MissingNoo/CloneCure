if (is_paused) {
    exit;
}
if (room == rStage1) {
	GameData.on_stage = true;
} else {
	GameData.on_stage = false;
}
if (GameData.on_stage and !instance_exists(oGameUI)) {
	instance_create_depth(0, 0, depth - 1, oGameUI);
}
frame++;
global.seconds += 1/60;
if (global.seconds > 60) {
    global.seconds -= 60;
    global.minutes++;
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
