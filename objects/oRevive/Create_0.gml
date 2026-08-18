ui = new window(global.game_uis.revive);
ui.fit_to_gui();
revive_button = new button("[fa_center][fa_middle]Yes");
revive_button.set_function(method(self, function() {
	GameData.revives--;
	GameData.hp = GameData.max_hp / 2;
	with (oEnemy) {
		speed = e.spd;
		image_speed = 1;
		if (!boss || !miniboss) {
			drop = false;
			hp = 0;
		}
	}
	oPlayer.image_alpha = 1;
	instance_destroy(oDeathScreen);
	instance_destroy();
}));
ui.add_element("revive_button", revive_button);
ui.add_draw("text", 
	AirUIFunctionStart
		scribble("[fa_center][fa_middle]Revive?").scale_to_box(_w, _h, true).draw(_x + _w / 2, _y + _h / 2);
	AirUIFunctionEnd
)
ui.finish();