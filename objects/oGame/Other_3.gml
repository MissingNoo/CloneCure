struct_foreach(Shop.upgrades, function(name, value) {
	SaveData.shop[$ "upgrades"] ??= {};
	SaveData.shop.upgrades[$ name] = value.level;
});
struct_foreach(Items, function(name, value) {
	SaveData.unlocked_items[$ name] = value.unlocked;
});
struct_foreach(Weapons, function(name, value) {
	SaveData.unlocked_weapons[$ name] = value.unlocked;
});
json_save(SaveData, game_save_id + "SaveData.json");
json_save(GameConfig, game_save_id + "Config.json");
