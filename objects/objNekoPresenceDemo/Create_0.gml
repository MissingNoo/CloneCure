window_set_caption("VCure");
/// @description Initialize Discord.
if (os_type == os_android or os_type == os_gxgames) {
	instance_destroy();
}
x = -100;
#macro DISCORD_APP_ID "1399120068230647808"

ready = false;

alarm[0] = room_speed * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	instance_destroy();
	//show_error("NekoPresence init fail.", false);
}
lastroom = room;