GameData.on_dialog = false;
instance_create_depth(x, y, depth, oCamWorld);
GameData.selected_character = "A_Debug";
char = Characters[$ GameData.selected_character];
try {
	sprites = char.skins[$ SaveData.characters[$ GameData.selected_character].lastoutfit];
} catch (error) {
	sprites = {idle: sAmeliaIdle, run: sAmeliaRun};
}
sprite_index = sprites.idle;
GameData.player_origin = {x:x, y:y};
image_xscale = 1;
image_yscale = 1;
depth = depth - 1000;
movement = new topdown_movement(self, char.spd);