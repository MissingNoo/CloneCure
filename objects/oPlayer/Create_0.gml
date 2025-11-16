instance_create_depth(x, y, depth, oCam);
char = Characters[$ GameData.selected_character];
try {
	sprites = char.skins[$ SaveData.characters[$ GameData.selected_character].lastoutfit];
} catch (error) {
	sprites = {idle: sAmeliaIdle, run: sAmeliaRun};
}
sprite_index = sprites.idle;
GameData.player_origin = {x:x, y:y};
GameData.max_hp = char.hp;
GameData.max_hp_base = GameData.max_hp;
repeat (shop_level("Max_HP_Up")) {
	GameData.max_hp += 4;
}
GameData.hp = GameData.max_hp;
GameData.shield = 0;
GameData.damage_taken = 0;
GameData.max_shield = 0;
GameData.ATK = char.atk + (0.06 * shop_level("ATK_Up"));
GameData.SPD = char.spd + (0.06 * shop_level("SPD_Up"));
GameData.CRT = char.crit + (0.02 * shop_level("Crit_Up"));
GameData.Pickup = 100 + (100 * (0.10 * shop_level("Pick_Up_Range")));
GameData.Haste = 0 + (100 * (0.04 * shop_level("Haste_Up")));
GameData.xp = 0;
GameData.needed_xp = 79;
GameData.level = 1;
GameData.Rerolls = shop_level("Reroll");
GameData.Holds = shop_level("Hold");
GameData.Eliminates = shop_level("Eliminate");
GameData.revives = 0;
GameData.bubba = false;
GameData.burguers = 0;
GameData.used_special = false;
GameData.failed_enchant = 0;
Player_Perks[0] = variable_clone(Perks[$ char.perks[0]]);
Player_Perks[1] = variable_clone(Perks[$ char.perks[1]]);
Player_Perks[2] = variable_clone(Perks[$ char.perks[2]]);
//Player_Perks[0].level = 3;
//show_debug_overlay(true);
Player_Weapons = array_create(6, undefined);

Player_Weapons[0] = variable_clone(Weapons[$ char.main_weapon]);
//Player_Weapons[0] = variable_clone(Weapons[$ "CEO_Tears"]);
Player_Weapons[0].level = 1;
/*Player_Weapons[1] = variable_clone(Weapons[$ "Sausage"]);
Player_Weapons[1].level = 7;
Player_Weapons[2] = variable_clone(Weapons[$ "Wamy_Water"]);
Player_Weapons[2].level = 7;
Player_Weapons[3] = variable_clone(Weapons[$ "Owl_Dagger"]);
Player_Weapons[3].level = 7;
Player_Weapons[1] = variable_clone(Weapons[$ "Sausage"]);*/
//Player_Weapons[1].level = 7;
image_xscale = 1;
image_yscale = 1;
depth = depth - 10;
inv_frame = 0;
movement = new topdown_movement(self, GameData.SPD);
GameData.strafing = false;
GameData.arrow_dir = 0;
dir = 0;
dmg = 0;
xplist = ds_list_create();
healframe = 0;
Player_Items = array_create(6, undefined);
ds_queue_clear(GameData.xp_list);
ds_queue_clear(GameData.dmg_list);
repeat (80) {
	var xx = instance_create_depth(0, 0, depth + 1, oXP, {disabled : true});
	ds_queue_enqueue(GameData.xp_list, xx);
	var yy = instance_create_depth(
		0,
		0,
		depth - 1,
		oDamageText,
		{dir: abs(image_xscale), dmg: 0, critical: false}
	);
}