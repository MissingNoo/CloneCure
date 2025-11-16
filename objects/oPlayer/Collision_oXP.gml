if other.disabled exit;
var xp = other.xp;
var shopbonus = 1 + (0.04 * shop_level("EXP_Gain_Up"));
GameData.xp += xp * shopbonus;
if (other.sprite_index == sXPMagnet) {
	with (oXP) {
		magnetized = true;
	}
}
ds_queue_enqueue(GameData.xp_list, other.id);
other.disabled = true;
//instance_destroy(other);
