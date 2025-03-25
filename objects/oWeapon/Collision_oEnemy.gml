if (other.was_hit or hit_frame > frame or image_alpha == 0) {
	exit;
}
hits--;
hit_frame = frame + wid.hit_cooldown;
other.was_hit = true;
other.inv_frame = frame + 10;
other.hp -= irandom_range(wid.mindmg[wid.level], wid.maxdmg[wid.level]);
audio_play_sound(choose(snd_hit1, snd_hit2, snd_hit3), 0, 0, GameConfig.sound_volume, undefined, random_range(0.75, 1));