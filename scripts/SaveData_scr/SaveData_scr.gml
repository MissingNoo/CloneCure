#macro SaveData global.savedata
SaveData = {
	characters: {},
	highscores: {},
	money: 0,
	gacha: {},
	seen_before: [],
	shop: {upgrades: {}},
	unlocked_items: {},
	unlocked_weapons: {},
	unlocked_achievements: {},
	plants : array_create(8, undefined)
};

global.base_data = variable_clone(SaveData);

function update_save_data() {
	struct_foreach(global.base_data, function(name, value) {
		if (is_undefined(SaveData[$ name])) {
			SaveData[$ name] = value;
		}
		if (is_struct(SaveData[$ name])) {
			global.savenext = name;
			struct_foreach(global.base_data[$ name], function(name, value) {
				if (is_undefined(SaveData[$ global.savenext][$ name])) {
					SaveData[$ global.savenext][$ name] = value;
				}
			});
		}
	});
	struct_foreach(Items, function(name, value) {
		if (is_undefined(SaveData.unlocked_items[$ name])) {
			SaveData.unlocked_items[$ name] = false;
		}
	});
	struct_foreach(Weapons, function(name, value) {
		if (is_undefined(SaveData.unlocked_weapons[$ name])) {
			SaveData.unlocked_weapons[$ name] = false;
		}
	});
	struct_foreach(AchievementsList, function(name, value) {
		if (is_undefined(SaveData.unlocked_achievements[$ name])) {
			SaveData.unlocked_achievements[$ name] = false;
		}
	});
	struct_foreach(Characters, function(name, value) {
		if (is_undefined(SaveData.characters[$ name])) {
			SaveData.characters[$ name] = {
				fandomxp: 0,
				outfits: ["base"],
				lastoutfit: "base",
				unlocked: false,
			};
		}

		if (is_undefined(SaveData.characters[$ name][$ "outfits"])) {
			SaveData.characters[$ name][$ "outfits"] = ["base"];
		}
		if (is_undefined(SaveData.characters[$ name][$ "unlocked"])) {
			SaveData.characters[$ name][$ "unlocked"] = false;
		}
		if (is_undefined(SaveData.characters[$ name][$ "lastoutfit"])) {
			SaveData.characters[$ name][$ "lastoutfit"] = "base";
		}
	});
}

update_save_data();
