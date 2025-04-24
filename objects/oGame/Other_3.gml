struct_foreach(Shop.upgrades, function(name, value) {
    SaveData.shop[$ "upgrades"] ??= {}; 
    SaveData.shop.upgrades[$ name] = value.level;
});
json_save(SaveData, game_save_id + "SaveData.json");
json_save(GameConfig, game_save_id + "Config.json");