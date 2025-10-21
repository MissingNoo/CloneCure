if (magnetized) {
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	speed = GameData.SPD + 1;
	exit;
}
if (!following) {
	speed = lerp(speed, 0, 0.1);
}

join.count();

if (!is_undefined(near) && !instance_exists(near)) {
	near = undefined;
	speed = 0;
}

if (!is_undefined(near) && place_meeting(x, y, near)) {
	following = false;
	xp += near.xp;
	instance_destroy(near);
	event_perform(ev_create, 0);
}
