if (is_undefined(global[$"gamedata"])) {
	GameData = {};
}
GameData.crops = {};
function crop(_name) constructor {
	sprite = asset_get_index($"sCrop{_name}");
	icon = asset_get_index($"s{_name}Icon");
	seed = asset_get_index($"s{_name}Seed");
	name = string_lower(_name);
	growth_frames = 60;
	next_stage_frame = 0;
	frame = 0;
	watered = false;
	stage = 0;
	GameData.crops[$ name] = self;
	//static set_seed = function (spr) {
		//seed = spr;
		//return self;
	//}
	//static set_sprite = function (spr) {
		//sprite = spr;
		//return self;
	//}
	//static set_icon = function (spr) {
		//icon = spr;
		//return self;
	//}
	static set_growth_frames = function (frames) {
		growth_frames = frames;
		return self;
	}
};

new crop("Wheat").set_growth_frames(minutes_to_frames(5));
new crop("Tomato").set_growth_frames(minutes_to_frames(6));
new crop("Potato").set_growth_frames(minutes_to_frames(6.50));
new crop("Rice").set_growth_frames(minutes_to_frames(7));
new crop("Onion").set_growth_frames(minutes_to_frames(7.50));
new crop("Carrot").set_growth_frames(minutes_to_frames(8));
new crop("GreenBean").set_growth_frames(minutes_to_frames(8.5));
new crop("Pepper").set_growth_frames(minutes_to_frames(9));
new crop("Strawberry").set_growth_frames(minutes_to_frames(9.5));
new crop("Corn").set_growth_frames(minutes_to_frames(10));
new crop("Radish").set_growth_frames(minutes_to_frames(11));
new crop("Garlic").set_growth_frames(minutes_to_frames(12));

