window_set_caption("VCure");
/// @description Initialize Discord.
if (os_type == os_android || os_type == os_gxgames) {
	instance_destroy();
}
if (os_type != os_linux) {
	instance_destroy();
}
//instance_destroy();
x = -100;
#macro DISCORD_APP_ID "1399120068230647808"

ready = false;

alarm[0] = room_speed * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty)) {
	instance_destroy();
	//show_message_async("NekoPresence init fail.");
}
lastroom = room;
