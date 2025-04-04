GameData ??= {}
#macro Stages GameData.stages
Stages = {};
GameData.stage_mode = "STAGE";
function Stage(_name) constructor {
    name = _name;
    timings = {};
	border = [];
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
	
	static set_border = function(x1, y1, x2, y2){
		border = [x1, y1, x2, y2];
	}
	
	static tp_insts = function(px, py) {
		var insts = [oWeapon, oEnemy, oAnvil];
		for (var i = 0; i < array_length(insts); ++i) {
			with (insts[i]) {
				var xx = x - px;
				var yy = y - py;
				x = oPlayer.x + xx;
				y = oPlayer.y + yy;
				xstart = xstart + xx;
				ystart = ystart + yy;
			}
		}
	}
	
	static tick_border = function() {
		var px = oPlayer.x; 
		var py = oPlayer.y;
		if (oPlayer.x < border[0]) {
			oPlayer.x = border[2];
			tp_insts(px, py);
		}
		if (oPlayer.x > border[2]) {
			oPlayer.x = border[0];
			tp_insts(px, py);
		}
		if (oPlayer.y < border[1]) {
			oPlayer.y = border[3];
			tp_insts(px, py);
		}
		if (oPlayer.y > border[3]) {
			oPlayer.y = border[1];
			tp_insts(px, py);
		}
	}
}

var stage1 = new Stage("Stage1");
stage1.add_enemy("Urufugang", "00:01");
stage1.add_enemy("Theo", "00:10");
stage1.remove_enemy("Urufugang", "00:15");
stage1.set_border(610, 610, 3170, 3170);