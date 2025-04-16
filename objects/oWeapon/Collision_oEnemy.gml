var ohit = other.hit_frame[$ $"i{id}"];
if (is_undefined(ohit)) {
	other.hit_frame[$ $"i{id}"] = 0;
	ohit = 0;
}
if (other.inv_frame > frame or ohit > frame or image_alpha == 0 or other.image_alpha != 1) {
	exit;
}
hits--;
on_hit();
other.hit_frame[$ $"i{id}"] = frame + wid.hit_cooldown;

other.inv_frame = frame + 15;
var dmg = irandom_range(wid.mindmg[wid.level], wid.maxdmg[wid.level]);
other.hp -= dmg;
instance_create_depth(other.x, other.y - (other.sprite_height / 2), other.depth - 1, oDamageText, {
    dir : abs(image_xscale),
    dmg : dmg
});
audio_play_sound(choose(snd_hit1, snd_hit2, snd_hit3), 0, 0, GameConfig.sound_volume, undefined, random_range(0.75, 1));