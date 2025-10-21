if (instance_number(oStage) > 1) {
	instance_destroy();
}
dir_queue = ds_queue_create();
spawn_frame = 0;
last_second = "";
spawn_rate = 180;
enemy_amount = 0;
spawn_amount = 2;
can_spawn = true;
timemode_spawn_scale = 0;
timemode_rate_scale = 0;
mobs_spawned = 0;
frame_since_last = 0;
enemy_limit = 2000;
additional_spawn = 0;
reduced_spawn = 1;
queue_repeats = 30;
slices = 36;
last_time = "";
global.topBorder = -1;
global.bottomBorder = -1;
global.leftBorder = -1;
global.rightBorder = -1;
event_user(0);
dbg = dbg_view("Stage", false);
create_view_from_instance(self);
