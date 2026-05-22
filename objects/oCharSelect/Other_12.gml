///Buttons
btnfunc = function() {
	draw_sprite_stretched(
		sUpgradeBackgroundWH,
		3,
		area[0],
		area[1],
		area[2] - area[0],
		area[3] - area[1]
	);
	scribble($"[fa_center][fa_middle]{text}")
		.scale(2)
		.draw((area[0] + area[2]) / 2, area[1] + 25);
	if (on_area) {
		draw_set_alpha(0.25);
		draw_sprite_stretched(
			sUpgradeBackgroundWH,
			0,
			area[0],
			area[1],
			area[2] - area[0],
			area[3] - area[1]
		);
		draw_set_alpha(1);
	}
};
//on_area_func = function() {
	//oCharSelect.time.keyboard_selected = false;
	//oCharSelect.endless.keyboard_selected = false;
	//oCharSelect.stage.keyboard_selected = false;
	//keyboard_selected = true;
	//global.currentelement = array_get_index(oCharSelect.btn, self);
//};

time = new button("Time");
time.custom_draw = method(time, btnfunc);
time.unselect_on_leave = false;
//time.set_on_area_function(method(time, on_area_func));
time.use_text = false;
time.desc = "test";
time.set_function(function() {
	GameData.stage_mode = "TIME";
	forcez = true;
});
endless = new button("Endless");
endless.custom_draw = method(endless, btnfunc);
endless.unselect_on_leave = false;
//endless.set_on_area_function(method(endless, on_area_func));
endless.use_text = false;
endless.desc = "test";
endless
	.set_function(function() {
		GameData.stage_mode = "ENDLESS";
		forcez = true;
	});
stage = new button("Stage");
stage.custom_draw = method(stage, btnfunc);
stage.unselect_on_leave = false;
//stage.set_on_area_function(method(stage, on_area_func));
stage.use_text = false;
stage.desc = "test";
stage
	.set_function(function() {
		GameData.stage_mode = "STAGE";
		forcez = true;
	});
btn = new ui_element_list();
btn.add(
	[
		stage, 
		endless, 
		time
	]
)


corps = [
	{
		name : "ALL",
		sprite : sHudHomeIcon,
		agency : Agencies.Unknown
	},
	{
		name : "Hololive",
		sprite : sHudHoloIcon,
		agency : Agencies.Hololive
	},
	{
		name : "Phase-Connect",
		sprite : sPhaseIcon,
		agency : Agencies.PhaseConnect
	},
	{
		name : "Indie",
		sprite : sStatusIcon,
		agency : Agencies.Indies
	}
]
selected_corp = 0;
select_corp = function (xx) {
	if (xx == 0) {
		return;
	}
	selected_corp = wrap(selected_corp + xx, 0, array_length(corps));
	event_user(0);
	selected = 0;
	select_char();
	charxoff = 1800;
}
up = new button("/\\");
up.set_function(method(self, function () {
	select_corp(-1);
	
}));
down = new button("\\/");
down.set_function(method(self, function () {
	select_corp(1);
}));