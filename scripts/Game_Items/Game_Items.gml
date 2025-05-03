GameData ??= {}
#macro Player_Items global.gamedata.player_items
Player_Items = array_create(6, undefined);
#macro Items global.gamedata.items
Items = {};
function item(_name) : base_item(_name) constructor {
	lex = "Items";
	on_hit = function(){};
	Items[$ _name] = self;
	
	/// @function                set_on_hit(function)
	/// @description             Defines the function to be execute when a collision with a enemy happens.
	/// @param {function}    f   The function to be executed
	static set_on_hit = function(f) {
		on_hit = f;
		return self;
	}
}

var i = new item("Body_Pillow");
i.set_weight(3);
i.set_sprite(sBodyPillow);
i.set_max_level(5);
i.set_on_bought(method(i, function(){
	var shield_levels = [0, 15, 20, 25, 30, 35]
	GameData.max_shield = shield_levels[level];
}));
i.set_cooldown(15 * 60, 1);
i.set_on_cooldown(method(i, function() {
	GameData.shield = GameData.max_shield;
}));

var i = new item("Headphones");
i.set_weight(4);
i.set_cooldown(1, 1);
i.set_sprite(sHeadPhones);
i.set_max_level(5);
i.set_on_bought(method(i, function(){
	var chances = [0, 15, 20, 25, 30, 35]
	chance = chances[level];
}));
i.set_on_hit(method(i, function() {
	var rnd = irandom_range(0, 100) <= chance;
	if (rnd) {
		oPlayer.dmg = 0;
		var inst = weapon_create { wid : variable_clone(Weapons[$ "Shockwave"]) });
	}
}));