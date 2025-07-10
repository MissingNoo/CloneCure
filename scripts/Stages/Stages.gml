GameData ??= {}
#macro Stages GameData.stages
#macro StagesArr GameData.stagesArr
Stages = {};
StagesArr = [];
GameData.stage_mode = "STAGE";
function Stage(_name) constructor {
    name = _name;
    timings = {};
	border = [];
	music = undefined;
	rm = undefined;
	multiplier = 1;
	bg = sStage1Port;
    Stages[$ name] = self;
    array_push(StagesArr, name);
    static add_enemy = function(enemy, time) {
        time = $"m{string_replace(time, ":", "s")}";
        timings[$ time] ??= {};
        timings[$ time][$ "add"] ??= [];
        array_push(timings[$ time][$ "add"], enemy);
		return self;
    }
    
    static remove_enemy = function(enemy, time) {
        time = $"m{string_replace(time, ":", "s")}";
        timings[$ time] ??= {};
        timings[$ time][$ "remove"] ??= [];
        array_push(timings[$ time][$ "remove"], enemy);
		return self;
    }
	
	static set_border = function(x1, y1, x2, y2){
		border = [x1, y1, x2, y2];
		return self;
	}
	
	static tp_insts = function(px, py) {
		var insts = [oWeapon, oEnemy, oAnvil, oXP];
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
	
	static set_music = function(snd) {
		music = snd;
		return self;
	}
	
	static set_room = function(r) {
		rm = r;
		return self;
	}
	
	static set_bg = function(_bg) {
		bg = _bg;
		return self;
	}
	
	static set_coin_multiplier = function(amount) {
		multiplier = amount;
		return self;
	}
}

var stage1 = new Stage("Stage1");
stage1.add_enemy("Urufugang", "00:01");
stage1.add_enemy("DarkShrimp", "00:10");
stage1.remove_enemy("Urufugang", "00:15");
stage1.set_border(610, 610, 3170, 3170);
stage1.set_music(bgm_suspect);
stage1.set_room(rStage1);
stage1.set_bg(sStage1Port);
stage1.set_coin_multiplier(1.25);

var stage2 = new Stage("Stage2");
stage2.add_enemy("Urufugang", "00:01");
stage2.set_border(610, 610, 3170, 3170);
stage2.set_music(bgm_suspect);
stage2.set_room(rStage1);
stage2.set_bg(sStage2Port);
stage2.set_coin_multiplier(1.60);