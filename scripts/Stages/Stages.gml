GameData ??= {};
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
	recomendation = [];
	fandom = undefined;
	Stages[$ name] = self;
	array_push(StagesArr, name);

	static add_recomendation = function(spr, level) {
		array_push(recomendation, [spr, level]);
		return self;
	};

	static set_fandom = function(_fandom) {
		fandom = _fandom;
		return self;
	};

	static add_enemy = function(enemy, time) {
		time = $"m{string_replace(time, ":", "s")}";
		timings[$ time] ??= {};
		timings[$ time][$ "add"] ??= [];
		array_push(timings[$ time][$ "add"], enemy);
		return self;
	};

	static remove_enemy = function(enemy, time) {
		time = $"m{string_replace(time, ":", "s")}";
		timings[$ time] ??= {};
		timings[$ time][$ "remove"] ??= [];
		array_push(timings[$ time][$ "remove"], enemy);
		return self;
	};

	static add_script = function(time, f) {
		time = $"m{string_replace(time, ":", "s")}";
		timings[$ time] ??= {};
		timings[$ time][$ "script"] ??= [];
		array_push(timings[$ time][$ "script"], f);
		return self;
	};

	static set_border = function(x1, y1, x2, y2) {
		border = [x1, y1, x2, y2];
		return self;
	};

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
	};

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
	};

	static set_music = function(snd) {
		music = snd;
		return self;
	};

	static set_room = function(r) {
		rm = r;
		return self;
	};

	static set_bg = function(_bg) {
		bg = _bg;
		return self;
	};

	static set_coin_multiplier = function(amount) {
		multiplier = amount;
		return self;
	};
}

var stage1 = new Stage("Stage1");
stage1.add_enemy("Urufugang", "00:01");
stage1
	.add_script("00:08", function() {
		enemy_limit = 100;
		spawn_rate = 150;
		spawn_pattern = "evenSurround";
	});
stage1
	.add_script("00:30", function() {
		//self.AddMobChoice("Deadbeat", 1, 1)
		spawn_rate = 130;
	});
stage1
	.add_script("01:00", function() {
		enemy_limit = 300;
		spawn_rate = 100;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("01:30", function() {
		enemy_limit = 550;
		spawn_rate = 80;
		spawn_amount = 5;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("02:30", function() {
		spawn_amount = 3;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("04:20", function() {
		spawn_rate = 80;
		spawn_amount = 7;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("05:00", function() {
		enemy_limit = 400;
		spawn_amount = 6;
	});
stage1
	.add_script("07:00", function() {
		spawn_rate = 90;
	});
stage1
	.add_script("08:30", function() {
		enemy_limit = 800;
		spawn_rate = 100;
		spawn_amount = 27;
		currentSpawnPattern = "evenSurround";
		//self.RemoveMobChoice("Deadbeat");
		//self.AddMobChoice("Deadbeat", 8, 3);
		//self.RemoveMobChoice("Takodachi");
		//self.RemoveMobChoice("BigBubba");
		//self.RemoveMobChoice("Shrimp");
	});
stage1
	.add_script("08:45", function() {
		enemy_limit = 500;
		spawn_rate = 120;
		spawn_amount = 4;
		currentSpawnPattern = "evenSurround";
		//self.AddMobChoice("Shrimp", 1, 2);
		//self.AddMobChoice("BigBubba", 5, 1);
		//self.AddMobChoice("Takodachi", 3, 2);
		//self.RemoveMobChoice("Deadbeat");
		//self.AddMobChoice("AngelFairy", 2, 1);
		//self.AddMobChoice("DevilFairy", 2, 1);
	});
stage1
	.add_script("09:30", function() {
		enemy_limit = 1000;
		spawn_rate = 90;
		spawn_amount = 7;
		currentSpawnPattern = "evenSurround";
		//self.AddMobChoice("KFP", 1, 2);
	});
stage1
	.add_script("10:00", function() {
		enemy_limit = 1000;
		spawn_rate = 150;
		spawn_amount = 4;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("10:30", function() {
		enemy_limit = 1000;
		spawn_rate = 100;
		spawn_amount = 10;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("11:00", function() {
		enemy_limit = 1000;
		spawn_rate = 60;
		spawn_amount = 10;
		currentSpawnPattern = "evenSurround";
		//self.RemoveMobChoice("Deadbeat");
		//self.RemoveMobChoice("Takodachi");
		//self.RemoveMobChoice("BigBubba");
		//self.RemoveMobChoice("Shrimp");
		//self.RemoveMobChoice("KFP");
		//self.RemoveMobChoice("AngelFairy");
		//self.RemoveMobChoice("DevilFairy");
		//self.AddMobChoice("Rats", 1, 1);
	});
stage1
	.add_script("11:20", function() {
		enemy_limit = 1000;
		spawn_rate = 90;
		spawn_amount = 8;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("12:00", function() {
		enemy_limit = 1000;
		spawn_rate = 110;
		spawn_amount = 9;
		currentSpawnPattern = "evenSurround";
		//self.AddMobChoice("Kromies", 1, 1);
	});
stage1
	.add_script("14:00", function() {
		enemy_limit = 150;
		spawn_rate = 75;
		spawn_amount = 10;
		currentSpawnPattern = "horizontalSurround";
		//self.RemoveMobChoice("Rats");
		//self.RemoveMobChoice("Kromies");
		//self.AddMobChoice("ShrimpGang", 1, 1, {dir: 0, pattern: "directionalSurround"});
		//self.AddMobChoice(
		//"DeadbeatGang",
		//1,
		//1,
		//{dir: 180, pattern: "directionalSurround"}
		//);
	});
stage1
	.add_script("15:00", function() {
		enemy_limit = 300;
		spawn_rate = 100;
		spawn_amount = 7;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("15:45", function() {
		enemy_limit = 300;
		spawn_rate = 120;
		spawn_amount = 9;
		currentSpawnPattern = "evenSurround";
		//self.RemoveMobChoice("ShrimpGang");
		//self.RemoveMobChoice("DeadbeatGang");
		//self.AddMobChoice("Saplings", 4, 1);
		//self.AddMobChoice("Hoomans", 1, 1);
	});
stage1
	.add_script("18:00", function() {
		enemy_limit = 200;
		spawn_rate = 150;
		spawn_amount = 10;
		currentSpawnPattern = "evenSurround";
		//self.RemoveMobChoice("Rats");
		//self.AddMobChoice("Sanalites", 2, 1);
	});
stage1
	.add_script("19:00", function() {
		enemy_limit = 200;
		spawn_rate = 80;
		spawn_amount = 8;
		currentSpawnPattern = "evenSurround";
		//self.RemoveMobChoice("Sanalites");
		//self.RemoveMobChoice("Saplings");
		//self.RemoveMobChoice("Hoomans");
		//self.AddMobChoice("Kromies", 5, 2);
		//self.AddMobChoice("Saplings", 5, 2);
	});
stage1
	.add_script("20:00", function() {
		enemy_limit = 200;
		spawn_rate = 80;
		spawn_amount = 5;
		currentSpawnPattern = "evenSurround";
		//self.RemoveMobChoice("Deadbeat");
		//self.RemoveMobChoice("Takodachi");
		//self.RemoveMobChoice("BigBubba");
		//self.RemoveMobChoice("Shrimp");
		//self.RemoveMobChoice("KFP");
		//self.RemoveMobChoice("AngelFairy");
		//self.RemoveMobChoice("DevilFairy");
		//self.RemoveMobChoice("Kromies");
		//self.RemoveMobChoice("Saplings");
		//self.RemoveMobChoice("Hoomans");
		//self.AddMobChoice("BigBubba", 1, 2);
		with (oEnemy) {
			if (!boss /*&& isEnemy*/) {
				self.hp = 0;
			}
		}
	});
stage1
	.add_script("21:00", function() {
		enemy_limit = 300;
		spawn_rate = 70;
		spawn_amount = 7;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("22:00", function() {
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 8;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("23:00", function() {
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		currentSpawnPattern = "evenSurround";
		//self.AddMobChoice("ShrimpGang", 1, 2);
		//self.AddMobChoice("DeadbeatGang", 1, 2);
		//self.AddMobChoice("Takodachi", 1, 3);
		//self.AddMobChoice("KFP", 1, 3);
		//self.AddMobChoice("BigBubba", 1, 3);
		//self.AddMobChoice("AngelFairy", 1, 2);
		//self.AddMobChoice("DevilFairy", 1, 2);
		//self.AddMobChoice("Rats", 1, 3);
		//self.AddMobChoice("Kromies", 1, 3);
		//self.AddMobChoice("Hoomans", 1, 2);
		//self.AddMobChoice("Saplings", 1, 3);
		//self.AddMobChoice("Sanalites", 1, 2);
	});
stage1
	.add_script("24:00", function() {
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("25:00", function() {
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("26:00", function() {
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("27:00", function() {
		enemy_limit = 300;
		spawn_rate = 55;
		spawn_amount = 6;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("28:00", function() {
		enemy_limit = 300;
		spawn_rate = 50;
		spawn_amount = 6;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("29:00", function() {
		enemy_limit = 300;
		spawn_rate = 45;
		spawn_amount = 5;
		currentSpawnPattern = "evenSurround";
	});
stage1
	.add_script("30:00", function() {
		enemy_limit = 200;
		spawn_rate = 60;
		spawn_amount = 5;
		with (oEnemy) {
			if (!boss /*&& isEnemy*/) {
				self.hp = 0;
			}
		}
		currentSpawnPattern = "evenSurround";
		//self.RemoveMobChoice("DeadbeatGang");
		//self.RemoveMobChoice("Takodachi");
		//self.RemoveMobChoice("BigBubba");
		//self.RemoveMobChoice("ShrimpGang");
		//self.RemoveMobChoice("KFP");
		//self.RemoveMobChoice("AngelFairy");
		//self.RemoveMobChoice("DevilFairy");
		//self.RemoveMobChoice("Kromies");
		//self.RemoveMobChoice("Saplings");
		//self.RemoveMobChoice("Sanalites");
		//self.RemoveMobChoice("Hoomans");
		//self.RemoveMobChoice("Rats");
		//self.AddMobChoice("Yagoos", 1, 1);
	});

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
stage2.add_recomendation("SPD_Up", 6);
stage2.add_recomendation("ATK_Up", 6);
stage2.set_fandom(1);
