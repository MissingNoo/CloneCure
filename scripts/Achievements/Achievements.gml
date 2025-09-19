if (!variable_global_exists("gamedata")) {
	GameData = {};
}
#macro AchievementsList GameData.ach
AchievementsList = {};
function achievement(_name, _sprite) constructor {
	name = _name;
	sprite = _sprite;
	amount = 0;
	unlock_type = "money";
	unlock_name = "";
	
	static unlock = function () {
		switch (unlock_type) {
			case "money":
				SaveData.money += amount;
				break;
			case "weapon":
				Weapons[$ unlock_name].unlocked = true;
				break;
			case "item":
				Items[$ unlock_name].unlocked = true;
				break;
		}
		return self;
	}
	
	static set_item = function (name) {
		unlock_type = "item";
		unlock_name = name;
		show_message("test");
		return self;
	}
	
	static set_weapon = function (name) {
		unlock_type = "weapon";
		unlock_name = name;
		return self;
	}
	
	static set_money = function (amnt) {
		unlock_type = "money";
		amount = amnt;
		return self;
	}
	
	_name = string_lettersdigits(string_lower(string_replace_all(_name, " ", "_")));
	AchievementsList[$_name] = self;
}

var i = new achievement("First Win!", sAchFirstWin);
i.set_money(500);
