try {
	image_alpha = 0.01;
	knocktimer = 0;
	hit_frame = {};
	e = Enemies[$ check_enemy(name)];
	boss = e.boss;
	miniboss = e.miniboss;
	expvalue = e.experience;
	lock_dir_frame = 0;
	if (!is_undefined(e.lifetime)) {
		alarm[0] = e.lifetime * 2;
	}
	if (e.lock_dir) {
		lock_dir_frame = AirLib.frame + seconds_to_frames(3);
	}
	if (boss || miniboss) {
		remove_mob_choice(name);
	}
	hp = e.hp;
	atk = e.atk;
	sprite_index = e.sprite;
	speed = e.spd;
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	image_xscale = e.scale;
	image_yscale = e.scale;
	if (oPlayer.x < x) {
		image_xscale = image_xscale * -1;
	}
	ds_queue_enqueue(oStage.dir_queue, self.id);
	was_hit = false;
	inv_frame = 0;
	attack_frame = 0;
	drop = true;
	method(self, e.create_function)();
	step = method(self, e.step_function);
	draw = method(self, e.draw_function);
} catch (error) {
	trace(error);
	show_message(error);
	instance_destroy();
}
/*
//occluder = new BulbDynamicOccluder(oLightController.renderer);
//
////Move the occluder on top of the player
occluder.x = x;
occluder.y = y;
//
////Define a simple rectangular occluder that fits the bounding box of the player's sprite
////Note that edge coordinates are relative to the occluder's x/y position
////N.B. Don't forget to give objPlayer a sprite otherwise this code won't work!
occluder.AddEdge(bbox_left  - x, bbox_top    - y, bbox_right - x, bbox_top    - y);
occluder.AddEdge(bbox_right - x, bbox_top    - y, bbox_right - x, bbox_bottom - y);
occluder.AddEdge(bbox_right - x, bbox_bottom - y, bbox_left  - x, bbox_bottom - y);
occluder.AddEdge(bbox_left  - x, bbox_bottom - y, bbox_left  - x, bbox_top    - y); 

