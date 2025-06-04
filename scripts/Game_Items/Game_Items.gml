GameData ??= {}
#macro Player_Items global.gamedata.player_items
Player_Items = array_create(6, undefined);
#macro Items global.gamedata.items
Items = {};
enum item_type {
	Null,
	Stat,
	Utility,
	Healing,
}
#region Item Constructor
function item(_name) : base_item(_name) constructor {
	type = item_type.Null;
	lex = "Items";
	damage_bonus = 1;
	crit_debuff = 0;
	on_hurt = function(){};
	on_hit = function(){};
	Items[$ _name] = self;
	
	/// @function                set_on_hurt(function)
	/// @description             Defines the function to be execute when a collision with a enemy happens.
	/// @param {function}    f   The function to be executed
	static set_on_hurt = function(f) {
		on_hurt = f;
		return self;
	}
	
	/// @function                set_on_hit(function)
	/// @description             Defines the function to be execute when a collision with a enemy happens.
	/// @param {function}    f   The function to be executed
	static set_on_hit = function(f) {
		on_hit = f;
		return self;
	}
	
	static set_type = function(_type) /*=>*/ {
		type = _type;
		return self;
	}
}
#endregion
#region Items
#region Body Pillow
var i = new item("Body_Pillow");
i.set_weight(3);
i.set_sprite(sBodyPillow);
i.set_max_level(5);
i.set_type(item_type.Utility);
i.set_on_bought(method(i, function(){
	var shield_levels = [0, 15, 20, 25, 30, 35];
	GameData.max_shield = shield_levels[level];
}));
i.set_cooldown(15 * 60, 1);
i.set_on_cooldown(method(i, function() {
	GameData.shield = GameData.max_shield;
}));
#endregion

#region Headphones
i = new item("Headphones");
i.set_weight(4);
i.set_cooldown(1, 1);
i.set_type(item_type.Utility);
i.set_sprite(sHeadPhones);
i.set_max_level(5);
i.set_on_bought(method(i, function(){
	var chances = [0, 15, 20, 25, 30, 35];
	chance = chances[level];
}));
i.set_on_hurt(method(i, function() {
	var rnd = irandom_range(0, 100) <= chance;
	if (rnd) {
		oPlayer.dmg = 0;
		var inst = weapon_create { wid : variable_clone(Weapons[$ "Shockwave"]) });
	}
}));
#endregion

#region Gorilla Paw
i = new item("Gorilla_Paw");
i.set_weight(3);
i.set_sprite(sGorillaPaw);
i.set_type(item_type.Stat);
i.set_max_level(3);
i.set_on_bought(method(i, function(){
	var bonus = [0, 1.2, 1.3, 1.4];
	crit_debuff = [0, 0.20, 0.20, 0.20];
	damage_bonus = bonus[level];
}));
#endregion

#region Chicken Feather
i = new item("Chicken_Feather");
i.set_weight(2);
i.set_type(item_type.Utility);
i.set_sprite(sChickenFeather);
i.set_max_level(3);
i.set_on_bought(function() /*=>*/ {
	GameData.revives++;
});
#endregion

#region Energy Drink
i = new item("Energy_Drink");
i.set_weight(3);
i.set_type(item_type.Stat);
i.set_sprite(sEnergyDrink);
i.set_max_level(3);
i.set_on_bought(method(i, function() /*=>*/ {
	self[$ "curlevel"] ??= 0;
	self[$ "lowered_hp"] ??= false;
	self[$ "hpdiff"] ??= 0;
	self[$ "newhp"] ??= 0;
	var haste_levels = [0, 10, 5, 5];
	var spd_levels = [0, 0.40, 0.10, 0.10];
	var shacklescalc = function() {
		if(player_have_item("Kusogaki_Shackles") and hpdiff != 0){
			var reduction = get_item_data("Kusogaki_Shackles").reduction;
			var hpcalc = GameData.max_hp + abs(hpdiff);
			newhp = hpcalc * (0.8 + (0.2 * (reduction / 100)));
			hpdiff = hpcalc - newhp;
			GameData.max_hp = round(newhp);
		}
	}
	if(curlevel == level){
		shacklescalc();
	} else {
		GameData.Haste += haste_levels[level];
		GameData.SPD += spd_levels[level];
	}
	if(!lowered_hp){
		lowered_hp = true;
		newhp = GameData.max_hp * 0.8;
		hpdiff = GameData.max_hp - newhp;
		GameData.max_hp = newhp;
		shacklescalc();
		GameData.max_hp = round(newhp);
		GameData.hp = clamp(round(GameData.hp), 0, GameData.max_hp);
	}
	curlevel = level;
}));
#endregion

#region Kusogaki Shackles
i = new item("Kusogaki_Shackles");
i.set_weight(1);
i.set_type(item_type.Utility);
i.set_sprite(sKusogakiShackles);
i.set_max_level(3);
i.set_on_bought(method(i, function() /*=>*/ {
	var reductions = [0, 33, 66, 100];
	reduction = reductions[level];
	array_foreach(Player_Items, function(e, p) /*=>*/ {
		if (!is_undefined(e) and e.name != "Kusogaki_Shackles") { e.on_bought(); }
	});
}));
#endregion

#region Researcher's Coat
i = new item("Researcher_Coat");
i.set_weight(2);
i.set_type(item_type.Stat);
i.set_sprite(sResearcherCoat);
i.set_max_level(3);
i.set_cooldown(120, 120);
i.set_on_bought(method(i, function() /*=>*/ {
	var lv = [0, 2, 3, 4];
	max_percent = lv[level];
	self[$ "percent"] ??= 1;
}));
i.set_on_cooldown(method(i, function() /*=>*/ {
	if (GameData.hp == GameData.max_hp) {
		percent = clamp(percent + 1, 1, max_percent);
	}
	GameData.xp += GameData.needed_xp * (percent / 100);
	trace(percent);
}));
i.set_on_hurt(method(i, function() /*=>*/ {
	percent = 1;
}));
#endregion

#region Breastplate
i = new item("Breastplate");
i.set_weight(2);
i.set_type(item_type.Utility);
i.set_sprite(sBreastplate);
i.set_max_level(3);
i.set_cooldown(120, 120);
i.set_on_bought(method(i, function() /*=>*/ {
	self[$ "curlevel"] ??= 0;
	var rebound_lv = [0, 50, 60, 70];
	rebound_chance = rebound_lv[level];
	var multiplier_lv = [0, 2, 2.5, 3];
	multiplier = multiplier_lv[level];
	var shacklescalc = function() {
		if(player_have_item("Kusogaki_Shackles") and spddiff != 0){
			var reduction = get_item_data("Kusogaki_Shackles").reduction;
			var spdcalc = GameData.SPD + abs(spddiff);
			newspd = spdcalc * (0.9 + (0.1 * (reduction / 100)));
			spddiff = spdcalc - newspd;
			GameData.SPD = newspd;
		}
	}
	if(curlevel == level) {
		shacklescalc();
	}
	self[$ "lowered_spd"] ??= false;
	if (!lowered_spd) {
		lowered_spd = true;
		newspd = GameData.SPD * 0.9;
		spddiff = GameData.SPD - newspd;
		GameData.SPD = newspd;
		shacklescalc();
	}
	curlevel = level;
}));
i.set_on_hurt(method(i, function() /*=>*/ {
	oPlayer.dmg = oPlayer.dmg * 0.75;
	if (irandom_range(0, 100) <= rebound_chance) {
		var odmg = oPlayer.dmg * multiplier;
		var inst = global.lastenemy;
		if (instance_exists(inst)) {
			inst.hp -= odmg;
			instance_create_depth(inst.x, inst.y - (inst.sprite_height / 2), inst.depth - 1, oDamageText, {
			    dir : abs(oPlayer.image_xscale),
			    dmg : odmg
			});
		}
	}
}));
#endregion

#region Beetle
i = new item("Beetle");
i.set_weight(3);
i.set_type(item_type.Stat);
i.set_sprite(sBeetle);
i.set_max_level(3);
i.set_on_bought(method(i, function(recalc = false) /*=>*/ {
	var multiplier_lv = [0, 1.33, 1.66, 2];
	multiplier = multiplier_lv[level];
}));
i.set_on_hit(method(i, function() /*=>*/ {
	var projectile = global.lastproj;
	if (instance_exists(projectile) and projectile.wid.from_skill) {
		projectile.dmg = projectile.dmg * multiplier;
	}
}));
#endregion

#region Blacksmith_Gear
i = new item("Blacksmith_Gear");
i.set_weight(1);
i.set_type(item_type.Utility);
i.set_sprite(sBlacksmithGear);
i.set_max_level(3);
i.set_on_bought(method(i, function(recalc = false) /*=>*/ {
	var enchant_lv = [0, 0, .5, 1];
	enchant = enchant_lv[level];
}));
#endregion

#region Candy Kingdom Sweets
i = new item("Candy_Kingdom_Sweets");
i.set_sprite(sCandySweets)
.set_type(item_type.Stat)
.set_max_level(3)
.set_weight(2)
.set_on_bought(method(i, function() /*=>*/ {
	self[$ "curlevel"] ??= 0;
	var haste_levels = [0, 40, 10, 10];
	multiplier = 0.75;
	if(player_have_item("Kusogaki_Shackles")){
		var reduction = get_item_data("Kusogaki_Shackles").reduction;
		multiplier = 0.75 + (0.25 * (reduction / 100));
	}
	if (curlevel != level) {
		GameData.Haste += haste_levels[level];
	}
	curlevel = level;
}))
.set_on_hit(method(i, function() /*=>*/ {
	trace($"mult: {multiplier}");
	var projectile = global.lastproj;
	if (instance_exists(projectile)) {
		projectile.dmg = projectile.dmg * multiplier;
	}
}));
#endregion

#region Corporate Pin
i = new item("Corporate_Pin");
i.set_sprite(sCorporatePin)
.set_type(item_type.Stat)
.set_max_level(3)
.set_weight(3) //TODO: Unknown?
.set_on_bought(method(i, function() /*=>*/ {
	var multiplier_lv = [0, 0.02, 0.025, 0.03];
	multiplier = multiplier_lv[level];
}));
#endregion

#region Credit Card
//TODO:    Enhancing cost reduction
i = new item("Credit_Card");
i.set_sprite(sCreditCard)
.set_type(item_type.Utility)
.set_max_level(5)
.set_weight(3)
.set_on_bought(method(i, function() /*=>*/ {
	var drop_levels = [0, 0.18, 0.28, 0.38, 0.45, 0.5];
	var reduction_levels = [0, 20, 25, 30, 35, 40];
	reduction = reduction_levels[level];
	drop_chance_buff = drop_levels[level];
	var anvil_timers = [[0, 0], [120, 240], [105, 210], [90, 180], [75, 150], [60, 120]];
	var anvil_time = anvil_timers[level];
	var anvil_create = time_source_create(time_source_game, irandom_range(anvil_time[0], anvil_time[1]), time_source_units_seconds, function() {
		instance_create_depth(oPlayer.x, oPlayer.y - 80, oPlayer.depth, oAnvil);
	});
	time_source_start(anvil_create);
}));
#endregion

#region Face Mask
i = new item("Face_Mask");
i.set_sprite(sFaceMask)
.set_type(item_type.Stat)
.set_max_level(1)
.set_weight(1)
.set_on_bought(method(i, function() /*=>*/ { 
	self[$ "curlevel"] ??= 0;
	multiplier = 1.30;
	taken_multiplier = 1.30;
	var shacklescalc = function() {
		if(player_have_item("Kusogaki_Shackles")){
			var reduction = get_item_data("Kusogaki_Shackles").reduction;
			taken_multiplier = real($"1.{string_replace(string(30 - (30 * reduction / 100)), ".", "")}");
		}
	}
	if(curlevel == level) {
		shacklescalc();
	}
	shacklescalc();
	if (curlevel != level) {
		GameData.Haste += 10;
	}
	curlevel = level;
}))
.set_on_hurt(method(i, function() {
	oPlayer.dmg = oPlayer.dmg * taken_multiplier;
}))
.set_on_hit(method(i, function() {
	var projectile = global.lastproj;
	if (instance_exists(projectile)) {
		projectile.dmg = projectile.dmg * multiplier;
	}
}))
#endregion

#endregion