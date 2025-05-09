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
	on_hit = function(){};
	Items[$ _name] = self;
	
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
i.set_on_hit(method(i, function() {
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
	var haste_levels = [0, 10, 5, 5];
	var spd_levels = [0, 0.40, 0.10, 0.10];
	GameData.Haste += haste_levels[level];
	GameData.SPD += spd_levels[level];
	self[$ "lowered_hp"] ??= false;
	if(!lowered_hp){
		lowered_hp = true;
		GameData.max_hp = GameData.max_hp * 0.8;
		GameData.hp = clamp(GameData.hp, 0, GameData.max_hp);
	}
}));
#endregion
#endregion