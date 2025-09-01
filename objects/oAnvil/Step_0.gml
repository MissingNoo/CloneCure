if (place_meeting(x, y, oPlayer) && !colliding) {
	colliding = true;
	uses--;
}
if (!place_meeting(x, y, oPlayer) && colliding) {
	colliding = false;
}
if (uses <= 0) {
	instance_destroy();
}
