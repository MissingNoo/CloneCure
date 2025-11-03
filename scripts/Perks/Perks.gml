GameData ??= {};
GameData.perks = {};
#macro Player_Perks global.gamedata.player_perks
#macro Perks global.gamedata.perks
#macro LastProj global.lastproj

function perk(_name) constructor {
	name = _name;
	level = 0;
	maxlevel = 3;
	sprite = sBlank;
	lex = "Perks";
	effect = function() {};
	before_hit = function() {};
	after_hit = function() {};
	on_bought = function() {};
	Perks[$ name] = self;
}

var i = new perk("null");

i = new perk("The_Ame_Way");
i.before_hit = method(i, function() {
	var bonus_levels = [1, 1.2, 1.4, 1.6];
	var bonus = bonus_levels[level];

	LastProj.dmg = LastProj.dmg * bonus;
	if (
		LastProj.wid.type == weapon_type.Multishot
		|| LastProj.wid.type == weapon_type.Ranged
	) {
		LastProj.crit_chance_bonus += 0.02;
		LastProj.crit_dmg_bonus += 0.05;
	}
});
i.sprite = sAmeliaFpsMastery;

i = new perk("Detective_Eye");
i.sprite = sAmeliaDetectiveEye;
i.on_bought = function() {
	GameData.CRT += 10;
};
i.before_hit = method(i, function() {
	var rnd = irandom(100);
	if (
		level == 3
		&& rnd <= 2
		&& instance_exists(global.lastenemy)
		&& !global.lastenemy.boss
	) {
		global.lastenemy.hp = 0;
	}
});

i = new perk("Bubba");
i.sprite = sAmeliaBubba;
i.on_bought = function() {
	if (!GameData.bubba) {
		instance_create_depth(
			GameData.player_pos.x,
			GameData.player_pos.x,
			GameData.player_pos.depth,
			oBubba
		);
		GameData.bubba = true;
	} else {
		GameData.bubbalevel++;
	}
};

