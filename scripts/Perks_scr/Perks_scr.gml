GameData ??= {};
GameData.perks = {};
#macro Player_Perks global.gamedata.player_perks
#macro Perks global.gamedata.perks
#macro LastProj global.lastproj

function perk(_name) constructor {
	name = string_lower(_name);
	level = 0;
	max_level = 3;
	sprite = sBlank;
	lex = "Perks";
	effect = function() {};
	before_hit = function() {};
	after_hit = function() {};
	on_bought = function() {};
	on_hurt = function() {};
	on_kill = function() {};
	
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

i = new perk("Kon_Kon");
i.sprite = sFubukiPerk1;
i = new perk("Friendzone");
i.sprite = sFubukiPerk2;
i = new perk("Fox_King");
i.sprite = sFubukiPerk3;


i = new perk("Dirty_Mind");
i.sprite = sDirtyMind;
i.on_hurt = method(i, function () {
	var chance = [0, 15, 20, 25];
	var negate = irandom(100) <= chance[level];
	if (negate) {
		oPlayer.dmg = (oPlayer.dmg / 2) * -1;
		show_debug_message("[PERK] Dirty Mind negated the damage!");
	}
});

i = new perk("Trash_Bear");
i.sprite = sTrashBear;
i.on_kill = method(i, function (e) {
	var chance = [0, 3, 5, 7];
	if (irandom(100) <= chance[level]) {
		instance_create_depth(e.x, e.y, e.depth, oFood, {sprite_index : sSpaghetti});
	}
});

i = new perk("Brittle_Bones");
i.sprite = sWeakBones;
i.on_hurt = method(i, function () {
	var plus = [0, 2, 3, 4];
	oPlayer.dmg += plus[level];
	Buffs.metronome.base_time = seconds_to_frames(2 + get_perk_level("Brittle_Bones"))
	self[$ "restnotecooldown"] ??= AirLib.frame - 1;
	if (restnotecooldown < AirLib.frame) {
		restnotecooldown = AirLib.frame + 60;
		for (var i = 0; i < 360; i += 90) {
			weapon_create {
				wid : variable_clone(Weapons[$ "rest_note"]),
				direction : i,
				speed : 3
			});
		}
	}
});