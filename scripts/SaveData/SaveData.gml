#macro SaveData global.savedata 
SaveData = {
	characters : {},
	highscores : {},
	money : 0,
	gacha : {},
	seen_before : [],
	shop : {}
}

global.base_data = variable_clone(SaveData);

function update_save_data() {
	struct_foreach(global.base_data, function(name, value) {
		if (is_undefined(SaveData[$ name])) {
			SaveData[$ name] = value;
		}
	});
	struct_foreach(Characters, function(name, value) {
		if (is_undefined(SaveData.characters[$ name])) {
			SaveData.characters[$ name] = {
				fandomxp : 0,
				outfits : ["base"]
			}
		}
	});
	
}