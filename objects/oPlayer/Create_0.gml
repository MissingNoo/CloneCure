instance_create_depth(x, y, depth, oCam);
GameData.selected_character = "Amelia";
char = GameData.characters[$ GameData.selected_character];
show_debug_overlay(true);
Player_Weapons[0] = variable_clone(Weapons[$ char.main_weapon]);