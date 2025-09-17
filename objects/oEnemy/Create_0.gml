try {
image_alpha = 0.01;
knocktimer = 0;
hit_frame = {};
if (is_undefined(Enemies[$ name])) {
	trace($"No monster named {name}");
	e = "urufugang";
}
e = Enemies[$ name];
boss = e.boss;
miniboss = e.miniboss;
if (boss or miniboss) {
	remove_mob_choice(name);
}
hp = e.hp;
atk = e.atk;
sprite_index = e.sprite;
speed = e.spd;
direction = point_direction(x, y, oPlayer.x, oPlayer.y);
image_xscale = e.scale;
image_yscale = e.scale;
ds_queue_enqueue(oStage.dir_queue, self.id);
was_hit = false;
inv_frame = 0;
attack_frame = 0;
}
catch (error) {
    trace(error);
    show_message(error);
    instance_destroy();	
}