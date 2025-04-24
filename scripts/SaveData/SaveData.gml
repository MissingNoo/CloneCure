#macro SaveData global.savedata 
SaveData = {
	characters : {},
	highscores : {},
	money : 0,
	gacha : {},
	seen_before : [],
	shop : {
        upgrades : {}
    }
}

global.base_data = variable_clone(SaveData);

function update_save_data() {
	struct_foreach(global.base_data, function(name, value) {
		if (is_undefined(SaveData[$ name])) {
			SaveData[$ name] = value;
		}
        if (is_struct(SaveData[$ name])) {
            global.savenext = name;
        	struct_foreach(global.base_data[$ name], function(name, value){
                if (is_undefined(SaveData[$ global.savenext][$ name])) {
                	SaveData[$ global.savenext][$ name] = value;
                } 
            });
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