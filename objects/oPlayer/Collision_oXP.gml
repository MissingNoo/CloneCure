var xp = other.xp;
var shopbonus = 1 + (0.04 * shop_level("EXP_Gain_Up"));
GameData.xp += xp * shopbonus;
if (other.sprite_index == sXPMagnet) {
	with (oXP) {
		magnetized = true;
	}
}
instance_destroy(other);
