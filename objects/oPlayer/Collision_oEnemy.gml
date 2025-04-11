if (other.attack_frame > frame and inv_frame > frame) {
	exit;
}
var dmg = other.atk;
GameData.hp -= dmg;
oGameUI.update_ui();
instance_create_depth(x, y - (sprite_height / 2), depth - 1, oDamageText, {
    dir : abs(image_xscale),
    dmg : dmg
});
inv_frame = frame + 15;
other.attack_frame = frame + 25;
audio_play_sound(snd_hurt, 0, 0, GameConfig.sound_volume, undefined, random_range(0.8, 1));