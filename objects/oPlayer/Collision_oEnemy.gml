if (GameData.hp <= 0 or other.attack_frame > AirLib.frame && inv_frame > AirLib.frame) {
	exit;
}
dmg = other.atk;
global.lastenemy = other;
array_foreach(Player_Items, function(e, i) /*=>*/ {
	if (e != undefined) {
		e.on_hurt();
	}
});
array_foreach(Player_Perks, function(e, i) /*=>*/ {
	if (e != undefined and e.level > 0) {
		e.on_hurt();
	}
});
damage_player(dmg);
if (GameData.hp == 0) {
	global.events.broadcast("died");
}
//global.events.broadcast("update_game_ui");
inv_frame = AirLib.frame + 15;
other.attack_frame = AirLib.frame + 25;
audio_play_sound(snd_hurt, 0, 0, GameConfig.sound_volume, 0, random_range(0.8, 1));
