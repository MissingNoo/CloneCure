GameData ??= {}
#macro Player_Items global.gamedata.player_items
Player_Items = array_create(6, undefined);
#macro Items global.gamedata.items
Items = {};
function item(_name) : base_item(_name) constructor {
	lex = "Items";
	Items[$ _name] = self; 
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