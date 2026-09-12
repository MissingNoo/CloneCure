if (place_meeting(x, y, oPlayer) && !colliding) {
	colliding = true;
	GameData.last_anvil = self;
	GameData.used_anvil = false;
	global.events.broadcast("pause", "anvil");
	alarm[0] = 60;
}
//if (!place_meeting(x, y, oPlayer) && colliding) {
	//colliding = false;
//}
if (GameData.last_anvil == self and GameData.used_anvil) {
	GameData.used_anvil = false;
	uses--;
}
if (uses <= 0) {
	instance_destroy();
}
