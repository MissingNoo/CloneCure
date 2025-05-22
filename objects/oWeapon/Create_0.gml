sprite_index = wid.projectile_sprite;
c = method(self, wid.run_create);
bs = method(self, wid.run_begin_step);
s = method(self, wid.run_step);
es = method(self, wid.run_end_step);
d = method(self, wid.run_draw);
on_hit = method(self, wid.run_on_hit);
clean_up = method(self, wid.clean_up);
on_animation_end = method(self, wid.run_on_animation_end);
level = wid.level;
max_projectiles = wid.shoots[level];
if (image_xscale == 1) {
	image_xscale = image_xscale * wid.area[level];
	image_yscale = image_yscale * wid.area[level];
}
c();
hit_frame = 0;
hits = wid.hits[level];
last_frame = AirLib.frame + wid.duration[level];
if (wid.sound != undefined) {
	audio_play_sound(wid.sound, 0, 0, GameConfig.sound_volume);
}
dmg = 0;