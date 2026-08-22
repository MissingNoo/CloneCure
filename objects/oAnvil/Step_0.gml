if (place_meeting(x, y, oPlayer) && !colliding) {
	colliding = true;
	global.lastanvil = self;
	global.events.broadcast("pause", "anvil");
	alarm[0] = 60;
}
//if (!place_meeting(x, y, oPlayer) && colliding) {
	//colliding = false;
//}
if (uses <= 0) {
	instance_destroy();
}
