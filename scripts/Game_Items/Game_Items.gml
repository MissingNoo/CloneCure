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
i.set_on_bought(method(i, function(recalc = false) /*=>*/ {
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
	if(!recalc){
		GameData.Haste += haste_levels[level];
		GameData.SPD += spd_levels[level];
	} else {
		shacklescalc();
	}
	self[$ "lowered_hp"] ??= false;
	self[$ "hpdiff"] ??= 0;
	self[$ "newhp"] ??= 0;
	if(!lowered_hp){
		lowered_hp = true;
		newhp = GameData.max_hp * 0.8;
		hpdiff = GameData.max_hp - newhp;
		GameData.max_hp = newhp;
		shacklescalc();
		GameData.max_hp = round(newhp);
		GameData.hp = clamp(round(GameData.hp), 0, GameData.max_hp);
	}
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
	if(player_have_item("Energy_Drink")){
		get_item_data("Energy_Drink").on_bought(true);
	}
	if(player_have_item("Breastplate")){
		get_item_data("Breastplate").on_bought(true);
	}
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
i.set_on_bought(method(i, function(recalc = false) /*=>*/ {
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
	if(recalc) {
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

#endregion