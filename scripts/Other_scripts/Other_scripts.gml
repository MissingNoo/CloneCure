function pause_game(reason = undefined) {
	var can_unpause = !instance_exists(oLevelUp);
	if (reason == "lvlup") {
		can_unpause = true;
	}
	if (!can_unpause && GameData.is_paused) {
		exit;
	}
	if (GameData.is_paused) {
		instance_destroy(oPauseUI);
		GameData.is_paused = false;
		instance_activate_all();
	} else if (GameData.on_stage) {
		oGame.surf = surface_recreate(
			oGame.surf,
			surface_get_width(application_surface),
			surface_get_height(application_surface)
		);
		switch (os_type) {
			case os_android:
				surface_copy(oGame.surf, 0, 0, GameData.GameSurf);
				break;
			default:
				surface_copy(oGame.surf, 0, 0, application_surface);
				break;
		}

		instance_deactivate_all(true);
		var dont_deactivate = [input_controller_object, oGameUI];
		array_foreach(dont_deactivate, function(e, i) /*=>*/ {
			instance_activate_object(e);
		});
		GameData.is_paused = true;
		switch (reason) {
			case "pause":
				instance_create_depth(0, 0, -1100, oPauseUI);
				break;
		}
	}
}

function damage_player(dmg) {
	if (dmg == 0) {
		exit;
	}
	//var odmg = dmg;
	var defbonus = 0.03 * shop_level("Defense_Up");
	dmg = dmg * (1 - defbonus);
	//trace($"DefBonus: {odmg} - {defbonus}% = {dmg}");
	if (GameData.shield > 0) {
		GameData.shield = clamp(GameData.shield - dmg, 0, GameData.max_shield);
	} else {
		GameData.hp = clamp(round(GameData.hp - dmg), 0, GameData.max_hp);
		GameData.damage_taken += dmg;
	}
	global.events.broadcast("damage_taken", dmg);
	if (dmg > 0) {
		instance_create_depth(
			x,
			y - (sprite_height / 2),
			depth - 1,
			oDamageText,
			{dir: abs(image_xscale), dmg: dmg}
		);
	}
}

/**
 * Checks if player has the item.
 * @param {string} name Item Name
 */
function player_have_item(name) {
	var have = false;
	global.isearch = string_lower(name);
	if (array_find_index(Player_Items, function(e, i) /*=>*/ {
			if (is_undefined(e)) {
				return false;
			}
			return e.name == global.isearch;
		}) != -1) {
		have = true;
	}
	if (array_find_index(Player_Weapons, function(e, i) /*=>*/ {
			if (is_undefined(e)) {
				return false;
			}
			return e.name == global.isearch;
		}) != -1) {
		have = true;
	}
	return have;
}

function get_item_level(itemname) {
	var level = 0;
	global.lvlsearch = string_lower(itemname);
	var item_index = array_find_index(Player_Items, function(e, i) /*=>*/ {
		if (is_undefined(e)) {
			return false;
		}
		return e.name == global.lvlsearch;
	});
	if (item_index != -1) {
		level = Player_Items[item_index].level;
	}
	return level;
}

function get_item_data(itemname) {
	var data = {};
	global.datasearch = string_lower(itemname);
	var item_index = array_find_index(Player_Items, function(e, i) /*=>*/ {
		if (is_undefined(e)) {
			return false;
		}
		return e.name == global.datasearch;
	});
	if (item_index != -1) {
		data = Player_Items[item_index];
	} else {
		trace($"no item with this name {itemname}");
	}
	return data;
}

function shop_level(name) {
	if (!variable_struct_exists(Shop.upgrades, name)) {
		show_debug_message($"{name} doesn't exist on ShopData!");
		return 0;
	}
	return Shop.upgrades[$ name].level;
}
