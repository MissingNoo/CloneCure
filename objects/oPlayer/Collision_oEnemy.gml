if (other.attack_frame > frame and inv_frame > frame) {
	exit;
}
dmg = other.atk;
array_foreach(Player_Items, function(e, i) {
	if (e != undefined) {
		e.on_hit();
	}
});
damage_player(dmg);
oGameUI.update_ui();
inv_frame = frame + 15;
other.attack_frame = frame + 25;
audio_play_sound(snd_hurt, 0, 0, GameConfig.sound_volume, undefined, random_range(0.8, 1));