var xp = other.xp;
var shopbonus = 1 + (0.04 * shop_level("EXP_Gain_Up"));
GameData.xp += xp * shopbonus;
instance_destroy(other);