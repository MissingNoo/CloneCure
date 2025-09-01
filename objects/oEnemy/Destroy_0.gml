GameData.kills++;
var drop_chance = 1300;
if (player_have_item("Credit_Card")) {
	var drop_chance_buff = get_item_data("Credit_Card").drop_chance_buff ?? 0;
	drop_chance = floor(1300 * (1 - drop_chance_buff)) + 1;
	trace($"New anvil chance 1/{drop_chance}");
}
var anvil_chance = irandom(drop_chance);
if (anvil_chance == 1) {
	instance_create_depth(x, y, depth, oAnvil);
}
