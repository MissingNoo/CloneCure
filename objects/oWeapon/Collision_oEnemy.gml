var ohit = other.hit_frame[$ $"i{id}"];
if (is_undefined(ohit)) {
	other.hit_frame[$ $"i{id}"] = 0;
	ohit = 0;
}
if (
	other.inv_frame > AirLib.frame
	|| ohit > AirLib.frame
	|| image_alpha == 0
	|| ghost
	|| other.image_alpha != 1
) {
	exit;
}
hits--;
other.hit_frame[$ $"i{id}"] = AirLib.frame + wid.hit_cooldown;

other.inv_frame = AirLib.frame + 15;
dmg = irandom_range(wid.mindmg[wid.level], wid.maxdmg[wid.level]);
global.lastenemy = other;
on_hit();
//Growth
if (wid.is_perk) {
	dmg += (((0.1 * shop_level("Growth")) * GameData.level) / max_projectiles)
		* wid.hit_cooldown
	< 20
		? wid.hit_cooldown / 20
		: 1;
}

var BaseATK = GameData.ATK;
var damage_bonus = 1;

for (var i = 0; i < array_length(Player_Items); i++) {
	if (!is_undefined(Player_Items[i])) {
		damage_bonus += Player_Items[i].damage_bonus - 1; //INFO: -1 for only the decimal point
	}
}
//trace($"Damage Bonus: {BaseATK} + {damage_bonus}");
dmg = (dmg * BaseATK) * damage_bonus;
var was_crit = false;
var before = dmg;
dmg = crit_calc(dmg);
if (dmg != before) {
	was_crit = true;
}
global.lastproj = self;
array_foreach(Player_Items, function(e, i) /*=>*/ {
	if (e != undefined) {
		e.on_hit();
	}
});

array_foreach(Player_Perks, function(e, i) /*=>*/ {
	if (e.level > 0) {
		e.before_hit();
	}
});

other.hp -= dmg;
global.events.broadcast("damage_dealt", dmg);
array_foreach(Player_Perks, function(e, i) /*=>*/ {
	if (e.level > 0) {
		e.after_hit();
	}
});

instance_create_depth(
	other.x,
	other.y - (other.sprite_height / 2),
	other.depth - 1,
	oDamageText,
	{dir: abs(image_xscale), dmg: dmg, critical: was_crit}
);

audio_play_sound(
	choose(snd_hit1, snd_hit2, snd_hit3),
	0,
	0,
	GameConfig.sound_volume,
	undefined,
	random_range(0.75, 1)
);

if (wid.knockback_speed[level] != 0 && other.knocktimer < AirLib.frame) {
	other.knocktimer = AirLib.frame + wid.knockback_duration[level];
	var push = wid.knockback_speed[level];

	var dir = point_direction(x, y, other.x, other.y);
	var hspd = lengthdir_x(push, dir);
	var vspd = lengthdir_y(push, dir);

	other.x += hspd;
	other.y += vspd;
}
