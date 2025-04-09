oGame.depth = depth + 1;
aa = [scribble_fallback_font, scribble_fallback_bulletpoint, sHFont, sDmgFont];
//display_set_gui_size(1280, 720);
if (!instance_exists(oCam)) {
	instance_create_depth(x, y, depth, oCam);
}
GameData.selected_character = "Amelia_Watson";
char = GameData.characters[$ GameData.selected_character];
GameData.hp = char.hp;
GameData.max_hp = GameData.hp;
GameData.shield = 0;
GameData.max_shield = 0;
GameData.ATK = 0;
GameData.SPD = char.spd;
GameData.CRT = char.crit;
GameData.Pickup = 0;
GameData.Haste = 0;
GameData.xp = 0;
GameData.needed_xp = 79;
GameData.level = 1;
//show_debug_overlay(true);
Player_Weapons[0] = variable_clone(Weapons[$ char.main_weapon]);
//Player_Weapons[0].level = 7;
Player_Weapons[1] = variable_clone(Weapons[$ "BL_Book"]);
//Player_Weapons[1].level = 7;
image_xscale = 1;
image_yscale = 1;
//depth = depth - 10;
inv_frame = 0;
movement = new topdown_movement(self, GameData.SPD);
GameData.strafing = false;
GameData.arrow_dir = 0;
dir = 0;
xrot = -90;
yrot = 0;
zrot = 0;
dbg = dbg_view("Player", true, gui_x_percent(25));
dbg_section("Player Rotation");
var names = ["xrot", "yrot", "zrot"];
for (var i = 0; i < array_length(names); i++) {
	if (is_real(self[$ names[i]])) {
		dbg_slider_int(ref_create(self, names[i]), -500, 500, string_first_letter_upper_case(string_replace_all(names[i], "_", " ")));
	}
}