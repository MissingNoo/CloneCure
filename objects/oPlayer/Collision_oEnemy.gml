if (other.attack_frame > frame and inv_frame > frame) {
	exit;
}
hp -= other.atk;
inv_frame = frame + 15;
other.attack_frame = frame + 25;
audio_play_sound(snd_hurt, 0, 0, GameConfig.sound_volume, undefined, random_range(0.8, 1));