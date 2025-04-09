if (!following) { 	
	speed = lerp(speed, 0, 0.1);
}

join.count();

if (!is_undefined(near) and !instance_exists(near)) {
	near = undefined;
	speed = 0;
}

if (!is_undefined(near) and place_meeting(x, y, near)) {
	following = false;
	xp += near.xp;
	instance_destroy(near);
	event_perform(ev_create, 0);
}
zrot-=2;