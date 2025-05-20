if (other.attack_frame > AirLib.frame and inv_frame > AirLib.frame) {
	exit;
}
dmg = other.atk;
array_foreach(Player_Items, function(e, i) /*=>*/ {
	if (e != undefined) {
		e.on_hit();
	}
});
damage_player(dmg);
oGameUI.update_ui();
inv_frame = AirLib.frame + 15;
other.attack_frame = AirLib.frame + 25;
audio_play_sound(snd_hurt, 0, 0, GameConfig.sound_volume, 0, random_range(0.8, 1));