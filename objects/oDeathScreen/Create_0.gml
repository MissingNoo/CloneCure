//
titleoffset = 250;
titlespd = 1.5;
//
retry = new button("Retry");
retry.set_function(function() {
    start_stage(room);
});
characterselect = new button("Character Select");
characterselect.set_function(function () {
    room_goto(rCharSelect);
})
mainmenu = new button("Main Menu");
mainmenu.set_function(function () {
    room_goto(rMainMenu);
});
submit = new button("Submit");
//
dbg = dbg_view("oDeath", true);
create_view_from_instance(self);
ui = new window(global.game_uis.death);
ui.fit_to_gui();
ui.add_draw("GameOver", 
	AirUIFunctionStart 
		scribble($"[fa_center][fa_middle][c_white]GAME OVER")
			.scale_to_box(_w, _h, true)
			.draw(_x + _w / 2, (_y + _h / 2) - titleoffset); 
	AirUIFunctionEnd
);
ui.add_draw("Score", 
	AirUIFunctionStart
	scribble($"[fa_center][fa_middle][c_white]Score: 0")
				.scale_to_box(_w, _h, true)
				.draw(_x + _w / 2, _y + _h / 2);
	AirUIFunctionEnd
);
ui.add_draw("Coins", 
	AirUIFunctionStart
		scribble($"[fa_center][fa_middle][c_yellow]Coins Gained: {GameData.stage_coins}")
			.scale_to_box(_w, _h, true)
		.draw(_x + _w / 2, _y + _h / 2);
	AirUIFunctionEnd
);
ui.add_element("Retry", retry);
ui.add_element("CharacterSelect", characterselect);
ui.add_element("MainMenu", mainmenu);
ui.add_element("Submit", submit);
ui.finish();
ui.node_visible("Retry", false);
ui.node_visible("CharacterSelect", false);
ui.node_visible("MainMenu", false);
ui.node_visible("Submit", false);
ui.node_visible("Coins", false);
ui.node_visible("Score", false);
#region Revives
if (GameData.revives > 0) {
	instance_create_depth(x, y, depth, oRevive);
	visible = false;
}
#endregion