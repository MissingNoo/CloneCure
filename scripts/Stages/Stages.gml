GameData ??= {}
#macro Stages GameData.stages
Stages = {};
function Stage(_name) constructor {
    name = _name;
    timings = {};
    Stages[$ name] = self;
    
    static add_enemy = function(enemy, time) {
        time = $"m{string_replace(time, ":", "s")}";
        timings[$ time] ??= {};
        timings[$ time][$ "add"] ??= [];
        array_push(timings[$ time][$ "add"], enemy);
    }
    
    static remove_enemy = function(enemy, time) {
        time = $"m{string_replace(time, ":", "s")}";
        timings[$ time] ??= {};
        timings[$ time][$ "remove"] ??= [];
        array_push(timings[$ time][$ "remove"], enemy);
    }
}

var stage1 = new Stage("Stage1");
stage1.add_enemy("Urufugang", "00:01");
stage1.add_enemy("Theo", "00:10");
stage1.remove_enemy("Urufugang", "00:15");