//feather ignore GM1041
xpsurf = surface_recreate(xpsurf, sprite_get_width(sExpBarBG), sprite_get_height(sExpBarBG));
surface_set_target(xpsurf);
draw_sprite(sExpBarBG, 0, 0, 0);
draw_sprite_part(sExpBar, -1, 0, 0, ((GameData.xp / GameData.needed_xp) * sprite_get_width(sExpBar)), sprite_get_height(sExpBarBG), 0, 0);
draw_sprite(sExpBarBG, 1, 0, 0);
surface_reset_target();
draw_surface_stretched(xpsurf, 0, 0, gui_x_percent(100), surface_get_height(xpsurf) * 1.5);

var str = $"[fa_middle][fa_center]{GameData.stage_mode}"
scribble(str).scale(1).draw(gui_x_percent(50), gui_y_percent(8));
var minutes = global.minutes;
if (minutes < 10) {
	minutes = $"0{minutes}";
}
var seconds = floor(global.seconds);
if (seconds < 10) {
	seconds = $"0{seconds}";
}
//scribble($"[fDmg]{minutes} : {seconds}").scale_to_box(_w, _h, true).draw(_x, _y);
var str = $"[fDmg][fa_middle][fa_center]{minutes}:{seconds}";
scribble(str).scale(1).draw(gui_x_percent(50), gui_y_percent(10));
draw_surface(uisurf, 0, 0);