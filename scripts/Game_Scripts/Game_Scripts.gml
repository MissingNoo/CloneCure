#macro exit_if_paused if (GameData.is_paused) { exit; }
#macro GameConfig global.game_config
#macro weapon_create instance_create_depth(oPlayer.x, oPlayer.y - (oPlayer.sprite_height / 2), oPlayer.depth + 1, oWeapon, 
GameConfig = {
    sound_volume : 1,
    music_volume : 1
}
global.minutes = 0;
global.seconds = 0;

GameData ??= {};
GameData.debug = false;
GameData.xp = 0;
GameData.needed_xp = 79;
GameData.music = undefined;
#macro Spawn_List GameData.spawn_list
Spawn_List = [];
#macro GameData global.gamedata
GameData.selected_character = "noone";
#macro Weapons global.gamedata.weapons
Weapons = {};
#macro Stats global.gamedata.stats
Stats = {};
#macro Player_Weapons global.gamedata.player_weapons
Player_Weapons = array_create(6, undefined);

#region Functions

#endregion
enum weapon_type {
    Multishot,
    Ranged,
    Melee,
}

enum weapon_enchantments {
    Damage,
    Size,
    Crit,
    Projectile,
	Cooldown,
	Knockback,
	Hit_Rate
}

#region Stat upgrade constructor
function stat(_name, _sprite, _weight) constructor {
    name = _name;
    sprite = _sprite;
    weight = _weight;
    type = "Stat";
    lex = "Stats";
    on_bought = function() {};
    static set_function = function(f) {
        on_bought = f;
        return self;
    }
    Stats[$ _name] = self;
}
#endregion
function crit_calc(dmg) {
	var ctrchance = 1 * clamp(GameData.CRT, 0, infinity);
	var rnd = irandom_range(1, 100);
	var was_crit = false;
	if (rnd <= ctrchance) {
		was_crit = true;
		var bonus_crit = 0;
		if (GameData.CRT > 100) {
			bonus_crit = 1 + ((GameData.CRT - 100)/200);
		} 
		dmg = (dmg * 1.5) + bonus_crit;
	}
	return dmg;
}
	
#region Stats
var s = new stat("Max_HP_Up", sHudHPIcon, 2);
    s.set_function(function() {
    	var newhp = GameData.max_hp + round(GameData.max_hp * (player_have_item("Energy_Drink") ? 0.8 : 0.10)); //TODO: see if it's correct?
        GameData.max_hp = newhp;
    });
s = new stat("ATK_Up", sHudATKIcon, 3);
    s.set_function(function() {
        GameData.ATK += 0.08;
    });
s = new stat("SPD_Up", sHudSPDIcon, 4);
    s.set_function(function() {
        GameData.SPD += 0.12;
    });
s = new stat("Crit_Up", sHudCRTIcon, 3);
    s.set_function(function() {
        GameData.CRT += 3;
    });
s = new stat("Pick_Up_Range", sHudPickupIcon, 4);
    s.set_function(function() {
        GameData.Pickup += 20;
    });
s = new stat("Haste_Up", sHudHasteIcon, 2);
    s.set_function(function() {
        GameData.Haste += 5;
    });
#endregion

#region Base Item Constructor
function base_item(_name) constructor {
	name = string_lower(_name);
	sprite = sBlank;
	level = 1;
	max_level = 7;
	cooldown = 1;
	base_cooldown = array_create(7, 1);
	min_cooldown = 1;
	on_cooldown = function(){};
	on_bought = function(){};
	weight = 3;
	unlocked = false;
	/// @function                set_max_level(lvl)
	/// @description             Defines the max level for the item.
	/// @param {real}    lvl     The max level.
	static set_max_level = function(lvl) {
		max_level = lvl;
		return self;
	}
	
	static set_unlocked = function (b) {
		unlocked = b;
		return self;
	}
	
	/// @function                set_on_cooldown(function)
	/// @description             Defines the function executed.
	/// @param {function}    f   The function to be executed
	static set_on_cooldown = function(f) {
		on_cooldown = f;
		return self;
	}
	/// @function                set_on_bought(function)
	/// @description             Defines the function executed when the item is bought.
	/// @param {function}    f   The function to be executed
	static set_on_bought = function(f) {
		on_bought = f;
		return self;
	}
	/// @function                set_sprite(spr)
	/// @description             Set the weapon sprites.
	/// @param {Asset.GMSprite}    spr The thumbnail for the weapon.
	/// @param {Asset.GMSprite}  	 projectile The sprite used for the projectile on map.
	static set_sprite = function(spr) {
		sprite = spr;
		return self;
	}
	
	/// @function                set_cooldown(cooldown, minimum_cooldown)
	/// @description             Defines the cooldown for the weapon.
	/// @param {Any}    _cooldown   The base cooldown levels.
	/// @param {real}    _min_cooldown   The minimum possible cooldown.
	static set_cooldown = function(_cooldown, _min_cooldown) {
		if (!is_array(_cooldown)) {
			_cooldown = array_create(7, _cooldown);
		}
		array_insert(_cooldown, 0, 0);
		base_cooldown = _cooldown;
		cooldown = _cooldown[1];
		min_cooldown = _min_cooldown;
		return self;
	}
	static set_weight = function(amount) {
		weight = amount;
		return self;
	}
}
#endregion

#region Weapon Constructor
function weapon(_name) : base_item(_name) constructor {
	from_skill = false;
	enhacement = 0;
    hits = 0;
    duration = array_create(8, 10);
    hit_cooldown = 10;
    shoots = array_create(8, 1);
    projectile_sprite = sBlank;
    is_perk = false;
    character_name = undefined;
    delay = 0;
    mindmg = [];
    maxdmg = [];
    type = undefined;
    can_enchant = [];
	lex = "Weapons";
	area = [0, 1, 1, 1, 1, 1, 1, 1];
	knockback_duration = array_create(8, 0); 
    knockback_speed = array_create(8, 0);
	sound = undefined;
	collab = false;
	run_create = function(){};
	run_begin_step = function(){};
	run_step = function(){};
	run_end_step = function(){};
	run_on_hit = function(){};
	run_on_animation_end = function(){};
	run_draw = function(){
		draw_self();
	};
    clean_up = function(){};
    Weapons[$ string_lower(name)] = self;
	/// @function                set_create(function)
	/// @description             Defines the function executed when spawned.
	/// @param {function}    f   The function to be executed
	static set_create = function(f) {
		run_create = f;
		return self;
	}
	/// @function                set_begin_step(function)
	/// @description             Defines the function executed before step.
	/// @param {function}    f   The function to be executed
	static set_begin_step = function(f) {
		run_step = f;
		return self;
	}
	/// @function                set_step(function)
	/// @description             Defines the function executed every step.
	/// @param {function}    f   The function to be executed
	static set_step = function(f) {
		run_step = f;
		return self;
	}
	/// @function                set_end_step(function)
	/// @description             Defines the function executed after every step.
	/// @param {function}    f   The function to be executed
	static set_end_step = function(f) {
		run_end_step = f;
		return self;
	}
	/// @function                set_draw(function)
	/// @description             Defines a custom draw function for the weapon.
	/// @param {function}    f   The function to be executed
	static set_draw = function(f) {
		run_draw = f;
		return self;
	}
	/// @function                set_on_hit(function)
	/// @description             Defines the function to be execute when a collision with a enemy happens.
	/// @param {function}    f   The function to be executed
	static set_on_hit = function(f) {
		run_on_hit = f;
		return self;
	}
	/// @function                set_on_animation_end(function)
	/// @description             Defines the function to be execute when the weapon animation ends.
	/// @param {function}    f   The function to be executed
	static set_on_animation_end = function(f) {
		run_on_animation_end = f;
		return self;
	}
	/// @function                set_clean_up(function)
	/// @description             Defines the function executed after destroying.
	/// @param {function}    f   The function to be executed
	static set_clean_up = function(f) {
		clean_up = f;
		return self;
	}
	/// @function                set_area(area)
	/// @description             Defines weapon scale.
	/// @param {Any}     _area The minimum damage for the weapon.
	static set_area = function(_area) {
		if (!is_array(_area)) {
			_area = array_create(8, _area);
		}
		else {
			array_insert(_area, 0, 0);
		}
		area = _area;
		return self;
	}
	static set_type = function(_type) {
		type = _type;
		return self;
	}
	/// @function                set_enchants(amount)
	/// @description             Defines wich enchantments the weapon can be granted.
	/// @param {Array}    list	 Enchantment list
	static set_enchants = function(list) {
		can_enchant = list;
		return self;
	}
	/// @function                set_hits(amount)
	/// @description             Defines how many collisions the projectile can do before vanishing.
	/// @param {Any}    amount  The maximum amount of hits.
	static set_hits = function(amount) {
		if (is_array(amount)) {
			array_insert(amount, 0, 0);
			hits = amount;
		} else {
			hits = array_create(8, amount);
		} 
		return self;
	}
	/// @function                set_duration(amount)
	/// @description             Defines how many frames until the projectile is destroyed.
		/// @param {Any}    amount   The projectile duration.
	static set_duration = function(amount) {
		if (!is_array(amount)) {
			amount = array_create(7, amount);
		}
		array_insert(amount, 0, 0);
		duration = amount;
		return self;
	}
	static set_hit_cooldown = function(amount) {
		hit_cooldown = amount;
		return self;
	}
	static set_shoots = function(amount) {
		if (!is_array(amount)) {
			amount = array_create(7, amount);
		}
		array_insert(amount, 0, 0);
		shoots = amount;
		return self;
	}
	static set_perk = function(boolean, char) {
		is_perk = boolean;
		character_name = char;
		if (boolean) {
			unlocked = true;
		}
		return self;
	}
	static set_delay = function(amount) {
		delay = amount;
		return self;
	}
	/// @function                set_damage(min_damage, max_damage)
	/// @description             Defines the damage for the weapon.
	/// @param {array}     _min  The minimum damage for the weapon.
	/// @param {array}     _max  The max damage for the weapon.
	static set_damage = function(_min, _max) {
		array_insert(_min, 0, 0);
		array_insert(_max, 0, 0);
		mindmg = _min;
		maxdmg = _max;
		return self;
	}
	/// @function                set_sound(snd)
	/// @description             Defines the sound for the weapon.
	/// @param {Asset.GMSound}   snd The sound to play.
	static set_sound = function(snd) {
		sound = snd;
		return self;
	}
	/// @function                set_knockback(duration, speed)
	/// @description             Defines the damage for the weapon.
	/// @param {Any}     _dur	 The minimum damage for the weapon.
	/// @param {Any}     _spd    The max damage for the weapon.
	static set_knockback = function(_dur, _spd) {
		if (is_array(_dur)) {
			array_insert(_dur, 0, 0);
		} else {
			_dur = array_create(8, _dur);
		}
		if (is_array(_spd)) {
			array_insert(_spd, 0, 0);
		} else {
			_spd = array_create(8, _spd);
		}
		knockback_duration = _dur;
		knockback_speed = _spd;
		return self;
	}
	/// @function                set_sprite(spr, projectile)
	/// @description             Set the weapon sprites.
	/// @param {Asset.GMSprite}    spr The thumbnail for the weapon.
	/// @param {Asset.GMSprite}  	 projectile The sprite used for the projectile on map.
	static set_sprite = function(spr, projectile) {
		sprite = spr;
		projectile_sprite = projectile;
		return self;
	}
}
#endregion
#region Weapons
#region Ame Pistol
var w = new weapon("Ame_Pistol");
w.set_sprite(sAmeliaWeapon, sAmeliaWeaponProjectile);
w.set_create(function() /*=>*/ {
    timer = wid.delay;
    remaining = wid.shoots[level] - 1;
    other_dir = direction;
    image_angle = direction;
    speed = 5;
    ricocheted = false;
});
w.set_step(function() /*=>*/ {
    timer = clamp(timer - 1, 0, infinity);
    if (can_spawn_other and timer == 0 and remaining > 0) {
        remaining--;
        timer = wid.delay;
        var inst = weapon_create {
            wid : wid
        });
        inst.direction = other_dir;
        inst.image_angle = other_dir;
    }
});
w.set_on_hit(function() /*=>*/ {
    if (level > 4 and hits <= 0 and !ricocheted) {
        ricocheted = true;
    	hits = 3;
        direction = random(360);
        image_angle = direction;
    }
    //TODO: Level 7, no fucking idea
});
w.set_hits([1, 2, 2, 2, 3, 3, 3]);
w.set_duration(120);
w.set_hit_cooldown(20);
w.set_cooldown([80, 80, 80, 80, 60, 60, 60], 50);
w.set_shoots([3, 5, 5, 5, 5, 5, 5]);
w.set_perk(true, "Amelia");
w.set_delay(6);
w.set_damage([8, 8, 10, 10, 10, 12, 12], [12, 12, 14, 14, 14, 16, 16]);
w.set_type(weapon_type.Multishot);
#endregion

#region BL Book
w = new weapon("BL_Book");
w.set_sprite(sBLBookThumb, sBLBook);
w.set_hits(7);
w.set_duration(120);
w.set_hit_cooldown(20);
w.set_cooldown([360, 360, 300, 300, 300, 300, 300], 300);
w.set_shoots([3, 4, 4, 5, 5, 6, 6]);
w.set_delay(0.1);
w.set_damage([12, 12, 16, 16, 16, 16, 23], [16, 16, 20, 20, 20, 20, 28]);
w.set_type(weapon_type.Multishot);
w.set_weight(3);
w.set_create(function() /*=>*/ {
    var len = [0, 50, 50, 50, 50, 62.5, 62.5, 62.5];
    var spd = [0, 3, 3, 3, 3, 5, 5, 5];
    books = wid.shoots[level];
    orbit_length = len[level];
    spinning_speed = spd[level];
    orbit_place ??= 0;
    if (can_spawn_other) {
        var off_count = 360 / (books);
        var off = 0;
    	repeat (books) {
    	    var inst = weapon_create {
                wid : wid,
                orbit_place : off
            });
            off -= off_count;
        }
    }
	x = oPlayer.x + lengthdir_x(orbit_length, round(orbit_place));
	y = oPlayer.y - 16 + lengthdir_y(orbit_length, round(orbit_place));
});
w.set_step(function() /*=>*/ {
    orbit_place -= spinning_speed;
    x = oPlayer.x + lengthdir_x(orbit_length, round(orbit_place));
	y = oPlayer.y - 16 + lengthdir_y(orbit_length, round(orbit_place));
});
w.set_enchants([
    weapon_enchantments.Damage,
    weapon_enchantments.Size,
    weapon_enchantments.Crit,
    weapon_enchantments.Projectile
]);
#endregion

#region Sausage
w = new weapon("Sausage");
w.set_sprite(sSausageThumb, sSausageSwing);
w.set_damage([14, 17, 17, 17, 23, 23, 11], [18, 21, 21, 21, 28, 28, 15]);
w.set_hits(999);
w.set_cooldown([90, 90, 90, 72, 72, 57, 57], 10);
w.set_shoots([1, 1, 1, 1, 1, 1, 2]);
w.set_delay(10);
w.set_hit_cooldown(30);
w.set_area([1, 1, 1, 1, 1.2, 1.2, 1.2]);
w.set_create(function() /*=>*/ {
	range = [0, 60, 60, 60, 60, 80, 80, 80];
	var on_range = collision_circle(x, y, range[level], oEnemy, true, true);
	if (on_range == noone) {
		instance_destroy();
	} else {
		image_angle = point_direction(x, y, on_range.x, on_range.y);
	}
	sausagetimer = AirLib.frame + wid.delay;
	sausages = wid.shoots[level] - 1;
});
w.set_step(function() /*=>*/ {
	if (sausagetimer < AirLib.frame and can_spawn_other and sausages > 0) {
		sausages--;
		sausagetimer = AirLib.frame + wid.delay;
		var inst = weapon_create {
			wid : wid,
		});
	}
});
w.set_on_animation_end(function() /*=>*/ {
	instance_destroy();
});
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown,
	weapon_enchantments.Knockback
]);
w.set_type(weapon_type.Melee);
w.set_knockback([0, 0, 5, 5, 5, 5, 5], [0, 0, 5, 5, 5, 5, 5]);
w.set_weight(3);
#endregion

#region Wamy Water
w = new weapon("Wamy_Water");
w.set_sprite(sWamyWaterThumb, sWamyWater);
w.set_weight(3);
w.set_create(function(){
	image_angle = GameData.arrow_dir;
});
w.set_on_animation_end(function() /*=>*/ {
	instance_destroy();
});
w.set_damage([9, 11, 11, 11, 11, 15, 15], [13, 15, 15, 15, 15, 19, 19]);
w.set_cooldown([120, 120, 120, 120, 96, 96, 96], 10);
w.set_shoots([1, 1, 1, 1, 1, 1, 1]);
w.set_hits(999);
w.set_hit_cooldown(30);
w.set_area([1.2, 1.2, 1.44, 1.44, 1.44, 1.44, 2]);
w.set_knockback(10, [5, 5, 5, 8, 8, 8, 8]);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown,
	weapon_enchantments.Knockback
]);
w.set_type(weapon_type.Melee);
#endregion

#region Owl Dagger
w = new weapon("Owl_Dagger");
w.set_sprite(sOwlDaggerThumb, sOwlDaggerSlash);
w.set_weight(2);
w.set_create(function() /*=>*/ {
	image_angle = GameData.arrow_dir;
});
w.set_on_animation_end(function() /*=>*/ {
	instance_destroy();
});
w.set_damage([10, 10, 12, 12, 12, 15, 15], [14, 14, 16, 16, 16, 19, 19]);
w.set_cooldown([60, 48, 48, 48, 33, 33, 20], 10);
w.set_shoots([1, 1, 1, 1, 1, 1, 2]);
w.set_delay(6);
w.set_hits(999);
w.set_hit_cooldown(50);
w.set_area([1, 1, 1, 1.2, 1.2, 1.2, 1.2]);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown,
]);
w.set_type(weapon_type.Melee);
#endregion

#region Spider Cooking
w = new weapon("Spider_Cooking");
w.set_sprite(sSpiderCookingThumb, sSpiderCooking);
w.set_weight(4);
w.set_damage([7, 7, 10, 10, 10, 12, 12], [11, 11, 14, 14, 14, 16, 16]);
w.set_cooldown(600, 600);
w.set_shoots(1);
w.set_hits(999);
w.set_area([1.1, 1.265, 1.265, 1.58, 1.58, 1.58, 1.58]);
w.set_duration(601);
w.set_knockback([0, 0, 0, 0, 0, 0, 8], [0, 0, 0, 0, 0, 0, 3]);
w.set_hit_cooldown(36);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Knockback,
	weapon_enchantments.Hit_Rate,
]);
w.set_draw(function() /*=>*/ {
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.5);
});
w.set_create(function() /*=>*/ {
	x = oPlayer.x;
	y = oPlayer.y - 16;
	//ParticleSystem5
	_ps = part_system_create();
	part_system_draw_order(_ps, true);
	
	//Emitter
	var _ptype1 = part_type_create();
	part_type_shape(_ptype1, pt_shape_flare);
	part_type_size(_ptype1, 0.8, 1.2, 0, 0);
	part_type_scale(_ptype1, 0.1, 0.1);
	part_type_speed(_ptype1, 1, 1, 0, 0);
	part_type_direction(_ptype1, 80, 100, 1, 0);
	part_type_gravity(_ptype1, 0, 270);
	part_type_orientation(_ptype1, 0, 0, 0, 0, false);
	part_type_colour3(_ptype1, $9C0761, $9C0761, $9C0761);
	part_type_alpha3(_ptype1, 1, 1, 1);
	part_type_blend(_ptype1, true);
	part_type_life(_ptype1, 10, 30);
	
	var _pemit1 = part_emitter_create(_ps);
	var _size = (sprite_get_width(sSpiderCooking) * image_xscale) / 2;
	part_emitter_region(_ps, _pemit1, -_size, _size, -_size, _size, ps_shape_ellipse, ps_distr_linear);
	part_emitter_stream(_ps, _pemit1, _ptype1, 3);
	
	part_system_position(_ps, x, y);
	depth+=10;
	
});
w.set_step(function() /*=>*/ {
	x = oPlayer.x;
	y = oPlayer.y - 16;
	part_system_position(_ps, x, y);
});
w.set_clean_up(function() /*=>*/ {
	part_system_destroy(_ps);
});
w.set_type(weapon_type.Melee);
#endregion

#region Psycho Axe
w = new weapon("Psycho_Axe");
w.set_sprite(sPsychoAxeThumb, sPsychoAxe);
w.set_create(function() /*=>*/ {
	orbit_length = 0;
	orbit_place = 0;
});
w.set_step(function() /*=>*/ {
	orbit = lengthdir(orbit_length, orbit_place);
	x = xstart + orbit.x;
	y = ystart + orbit.y;
	orbit_place -= 4;
	orbit_length += 0.75;
	//image_angle += 10;
});
w.set_weight(3);
w.set_type(weapon_type.Ranged);
w.set_damage([10, 14, 14, 19, 19, 19, 28], [14, 18, 18, 23, 23, 23, 34]);
w.set_cooldown([240, 240, 192, 192, 192, 192, 192], 10);
w.set_duration([180, 180, 180, 180, 240, 240, 240]);
w.set_hit_cooldown(50);
w.set_shoots(1);
w.set_hits([10, 10, 10, 10, 999, 999, 999]);
w.set_area([1, 1.20, 1.20, 1.44, 1.44, 2.16, 2.16]);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Knockback,
	weapon_enchantments.Cooldown
]);
#endregion

#region Fan Beam
w = new weapon("Fan_Beam");
w.set_sprite(sFanBeamThumb, sFanBeam);
w.set_weight(3);
w.set_on_animation_end(function() /*=>*/ {
	instance_destroy();
});
w.set_damage([27, 27, 27, 36, 36, 36, 36], [33, 33, 33, 44, 44, 44, 44]);
w.set_cooldown([180, 180, 150, 150, 120, 120, 120], 10);
w.set_delay(1);
w.set_area([1, 1.30, 1.30, 1.30, 1.30, 2, 2]);
w.set_shoots([1, 1, 1, 1, 1, 1, 2]);
w.set_type(weapon_type.Ranged);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown
]);
w.set_knockback(10, 15);
w.set_hit_cooldown(60);
w.set_hits(999);
w.set_duration(999);
w.set_create(function() /*=>*/ {
	if (oPlayer.image_xscale < 0 and can_spawn_other) {
		image_xscale = image_xscale * -1;
	}
	if (can_spawn_other and wid.shoots[level] == 2) {
		var inst = weapon_create {
			wid : wid,
			image_xscale : image_xscale * -1,
			image_yscale : image_yscale
		});
	}
});
w.set_step(function() /*=>*/ {
	x = oPlayer.x;
	y = oPlayer.y - 16;
});
#endregion

#region Glowstick
w = new weapon("Glowstick");
w.set_sprite(sGlowstickThumb, sGlowstick);
w.set_weight(4);
w.set_on_animation_end(function() /*=>*/ {
    if (sprite_index == sGlowstickThumbExplosion) {
    	instance_destroy();
    }
	
});
w.set_damage([10, 12, 12, 12, 12, 17, 17], [14, 16, 16, 16, 16, 21, 21]);
w.set_cooldown(240, 240);
w.set_delay(5);
w.set_area([1, 1, 1, 1.25, 1.25, 1.25, 1.25]);
w.set_shoots([1, 1, 2, 2, 3, 3, 4]);
w.set_type(weapon_type.Multishot);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Knockback,
	weapon_enchantments.Projectile,
	weapon_enchantments.Cooldown
]);
w.set_knockback(10, 15);
w.set_hit_cooldown(30);
w.set_hits([3, 3, 8, 8, 8, 8, 8]);
w.set_duration(180);
w.set_create(function() /*=>*/ {
	exploded = false;
	returned = false;
	sticktimer = AirLib.frame + wid.delay;
	sticks = wid.shoots[level] - 1;
	direction = random(360);
	speed = 8;
});
w.set_step(function() /*=>*/ {
	if (!returned and !exploded and distance_to_point(xstart, ystart) > 70) {
		returned = true;
		//direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	}
	if (returned) {
		if (sprite_index = sGlowstickThumbExplosion) {
			speed = 0;
			exit;
		}
		if (speed > 0) {
			speed = lerp(speed, 0, 0.1);
			if (speed < 0.25) {
				speed = 0;
			}
		} else {
			speed = lerp(speed, -8, 0.05);
		}
	}
	if (sticktimer < AirLib.frame and can_spawn_other and sticks > 0) {
		sticks--;
		sticktimer = AirLib.frame + wid.delay;
		var inst = weapon_create {
			wid : wid,
		});
	}
});
w.set_on_hit(function() {
	if (hits <= 0) {
		speed = 0;
		exploded = true;
		image_index = 0;
		sprite_index = sGlowstickThumbExplosion;
		image_xscale = image_xscale * 1.5;
		image_yscale = image_xscale;
		hits = 999;
	}
	if (sprite_index == sGlowstickThumbExplosion) {
		dmg = dmg * 1.5;
	}
});
#endregion

#region Holo Bomb
w = new weapon("Holo_Bomb");
w.set_sprite(sHolobomb, sHolobomb);
w.set_type(weapon_type.Multishot);
w.set_weight(3)
w.set_cooldown([120, 120, 120, 120, 96, 96, 96], 10);
w.set_max_level(7);
w.set_delay(5);
w.set_shoots([1, 1, 1, 2, 2, 2, 3]);
w.set_hits(9999);
w.set_hit_cooldown(20);
w.set_area([1.44, 1.656, 1.656, 1.656, 1.656, 1.656, 1.656,]);
w.set_duration(630);
w.set_damage([15, 15, 18, 18, 18, 18, 18], [19, 19, 22, 22, 22, 22, 22])
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown,
	weapon_enchantments.Knockback
])
w.set_create(function () {
	x = oPlayer.x + random_range(-50, 50);
	y = oPlayer.y + random_range(-50, 50);
});
w.set_on_hit(function () {
	sprite_index = sBombExplosion;
});
w.set_on_animation_end(function () {
	if (sprite_index == sBombExplosion) {
		instance_destroy();
	}
});
#endregion

#region Shockwave
w = new weapon("Shockwave");
w.set_sprite(sShockwave, sShockwave);
w.set_weight(0);
w.set_hits(999);
w.set_hit_cooldown(60);
w.set_type(weapon_type.Melee);
w.set_damage([0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]);
w.set_on_animation_end(function() /*=>*/ {
	instance_destroy();
});
w.is_perk = true;
w.set_duration(999);
w.set_knockback(10, 10);
#endregion

#region Idol Song
w = new weapon("Idol_Song");
w.set_type(weapon_type.Ranged);
w.set_weight(3);
w.set_max_level(7);
w.set_sprite(sIdolSongThumb, sIdolSong);
w.set_area([1, 1, 1, 1.25, 1.25, 1.56, 1.56]);
w.set_create(function () {
	self[$ "second"] ??= false;
	var spd = [0, 1, 1, 1.2, 1.2, 1.2, 1.2, 1.2];
	speed = spd[level];
	direction = second ? 90 : 270;
	start_x = x;
	var travel = [0, 64, 64, 80, 64, 64, 64, 64];
	travel_width = travel[level];
	if (!second) {
		var inst = weapon_create {
			wid : wid,
			second : true
		});
	}
	
});
w.set_step(function () {
	x = sine_wave(current_time  / 1000, second ? -1 : 1, travel_width, start_x);
});
w.set_damage([11, 14, 14, 14, 14, 14, 22], [15, 18, 18, 18, 18, 18, 27]);
w.set_cooldown([200, 200, 200, 200, 160, 160, 160], 10);
w.set_hit_cooldown(20);
w.set_duration(150);
w.set_hits(9999);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown
]);
#endregion

//undone

#region Bounce Ball
w = new weapon("Bounce_Ball"); //TODO: Knockback
w.set_type(weapon_type.Multishot);
w.set_sprite(sBounceBallThumb, sBounceBall);
w.set_weight(4);
w.set_cooldown([120, 120, 120, 120, 120, 102, 102], 102);
w.set_hits(999);
w.set_area(0.6); //TODO: area by character size
w.set_hit_cooldown(30);
w.set_damage([10, 12, 12, 12, 12, 12, 17], [14, 16, 16, 16, 16, 16, 21]);
w.set_delay(5);
w.set_shoots([1, 1, 2, 2, 3, 3, 4])
w.set_duration(180);
w.set_enchants([
	weapon_enchantments.Damage,
	//weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Projectile,
	weapon_enchantments.Cooldown
]);
w.set_create(function () {
	timer = AirLib.frame + wid.delay;
	balls = wid.shoots[level] - 1;
	y = oPlayer.y - 200;
	x = oPlayer.x + random_range(-200, 200);
	//x = mouse_x;
	vspeed = 8
	hdest = 0;
	dir = choose(-1, 1);
	rotspd = irandom_range(1, 3) * dir;
});
w.set_step(function (){
	image_angle += rotspd;
	vspeed = approach(vspeed, 8, 0.5);
	hspeed = approach(hspeed, 0, 0.1);
	if (can_spawn_other and balls > 0 and timer < AirLib.frame) {
		balls--;
		timer = AirLib.frame + wid.delay;
		weapon_create {
			wid : wid,
		});
	}
});
w.set_on_hit(function () {
	var e = global.lastenemy;
	vspeed = -4;
	hspeed += irandom_range(3, 7) * (x > e.x ? 1 : -1);
});
#endregion

#region CEO Tears
w = new weapon("CEO_Tears");
w.set_type(weapon_type.Multishot);
w.set_sprite(sCeoTearsThumb, sCeoTears);
w.set_weight(2);
w.set_cooldown([30, 30, 30, 20, 20, 10, 10], 1);
w.set_hits(1);
w.set_hit_cooldown(30);
w.set_damage([8, 10, 10, 10, 12, 12, 12], [12, 14, 14, 14, 16, 16, 16]);
w.set_delay(1);
w.set_duration(90);
w.set_area(0.9);
w.set_shoots([1, 1, 2, 2, 2, 2, 4]);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Projectile,
	weapon_enchantments.Cooldown,
]);
w.set_create(function () {
	var s = [0, 4, 4, 4, 4, 5, 5, 5];
	timer = AirLib.frame + wid.delay;
	tears = wid.shoots[level] - 1;
	var e = instance_nearest_nth(x, y, oEnemy, irandom_range(0, instance_number(oEnemy)));
	if (instance_exists(e)) {
		direction = point_direction(x, y, e.x, e.y);
		image_angle = direction;
		speed = s[level];
	}
});
w.set_step(function () {
	if (can_spawn_other and tears > 0 and timer < AirLib.frame) {
		tears--;
		timer = AirLib.frame + wid.delay;
		weapon_create {
			wid : wid,
		});
	}
});
#endregion

#region Cutting Board
w = new weapon("Cutting_Board");
w.set_sprite(sCuttingBoardThumb, sCuttingBoard);
w.set_type(weapon_type.Ranged);
w.set_weight(2);
w.set_cooldown([180, 180, 180, 180, 180, 150, 150], 0);
w.set_shoots([1, 1, 1, 1, 1, 1, 3]);
w.set_hits(999);
w.set_damage([11, 11, 14, 14, 23, 23, 23], [15, 15, 18, 18, 28, 28, 28]);
w.set_delay(1);
w.set_area([1, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3]);
w.set_duration(120);
w.set_knockback(20, 7);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown,
]);
w.set_create(function(){
	if (Characters[$ GameData.selected_character].flat) {
		image_xscale = image_xscale * 1.3;
		image_yscale = image_yscale * 1.3;
	}
	if (can_spawn_other) {
		direction = GameData.arrow_dir + 180;
	}
	image_angle = direction;
	speed = 7;
	if (can_spawn_other and wid.shoots[level] - 1 > 0) {
		weapon_create {
			wid : wid,
			direction : direction - 90
		});
		weapon_create {
			wid : wid,
			direction : direction + 90
		});
	}
});
w.set_step(function () {
	speed = approach(speed, 0, 0.3);
});
#endregion

#region Elite Lava Bucket
w = new weapon("Elite_Lava_Bucket");
w.set_sprite(sEliteLavaBucketThumb, sLavaBucket);
w.set_type(weapon_type.Multishot);
w.set_weight(3);
w.set_cooldown([300, 300, 300, 300, 300, 300, 300], 0);
w.set_shoots([1, 1, 2, 2, 2, 3, 4]);
w.set_hits(999);
w.set_damage([6, 6, 6, 10, 14, 14, 11], [10, 10, 10, 14, 18, 18, 15]);
w.set_delay(5);
w.set_area([0.9, 1.1, 1.1, 1.1, 1.1, 1.1, 1.1]);
w.set_duration([180, 180, 180, 270, 270, 270, 270]);
w.set_knockback(0, 0);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Cooldown,
	weapon_enchantments.Hit_Rate,
]);
w.set_create(function(){
	direction = random(360);
	speed = 6;
	timer = AirLib.frame + wid.delay;
	buckets = wid.shoots[level] - 1;
	slow_spd = random_range(0.1, 0.3);
	depth = oPlayer.depth - 30;
	ghost = true;
});
w.set_step(function () {
	if (can_spawn_other and buckets > 0 and AirLib.frame > timer) {
		buckets--;
		timer = AirLib.frame + wid.delay;
		weapon_create {
			wid : wid,
		});
	}
	speed = approach(speed, 0, slow_spd);
	if (speed == 0 and sprite_index == sLavaBucket) {
		ghost = false;
		sprite_index = sLavaPoolStart;
		y -= sprite_get_height_ext(sLavaPoolStart, wid.area[level]) / 2;
	}
	if (last_frame < AirLib.frame) {
		last_frame = AirLib.frame + 9999;
		image_index = 0;
		sprite_index = sLavaPoolEnd;
	}
});
w.set_on_animation_end(function () {
	switch (sprite_index) {
		case sLavaPoolStart:
			sprite_index = sLavaPoolLoop;
			break;
		case sLavaPoolEnd:
			instance_destroy();
			break;
	}
});
#endregion


#region EN Curse
w = new weapon("EN_Curse");
w.set_sprite(sENCurseThumb, sENCurse);
w.set_type(weapon_type.Multishot);
w.set_weight(2);
w.set_cooldown([110, 110, 110, 110, 110, 93, 93], 1);
w.set_shoots([1, 1, 1, 1, 2, 2, 3]);
w.set_hits(1);
w.set_damage([12, 17, 17, 17, 17, 17, 17], [16, 21, 21, 21, 21, 21, 21]);
w.set_delay(0);
w.set_area(1.5);
w.set_duration(90);
w.set_knockback(20, 7);
w.set_enchants([
	weapon_enchantments.Damage,
	weapon_enchantments.Size,
	weapon_enchantments.Crit,
	weapon_enchantments.Projectile,
	weapon_enchantments.Cooldown,
]);
w.set_create(function(){
	direction = GameData.arrow_dir;
	if (!can_spawn_other) {
		direction = random(360);
	}
	image_angle = direction;
	speed = 7;
	curses = wid.shoots[level] - 1;
	chance = [0, 0.7, 0.8, 0.8, 0.8, 0.9, 0.9, 0.9];
	multiplier = 0;
});
w.set_step(function () {
	if (can_spawn_other and curses > 0) {
		curses--;
		weapon_create {
			wid : wid,
		});
	}
});
w.set_on_hit(function () {
	var rnd = random_range(0, 1);
	if (rnd <= chance[level]) {
		hits++;
		if (level == 7) {
			multiplier++;
			repeat (multiplier) {
				dmg = dmg * 1.1;
			}
		}
		var nearest = instance_nearest_nth(x, y, oEnemy, 2);
		if (nearest != noone) {
			direction = point_direction(x, y, nearest.x, nearest.y);
			image_angle = direction;
		}
	}
});
#endregion
/*
#region Plug Type Asacoco
w = new weapon("Plug_Type_Asacoco");
w.set_type(weapon_type.Multishot);
w.set_sprite();
w.set_weight();
w.set_cooldown([], 0);
w.set_hits();
w.set_damage([], []);
w.set_delay();
w.set_duration();
w.set_enchants([]);
w.set_create();
w.set_step();
#endregion
#region X-Potato
w = new weapon("X-Potato");
w.set_type(weapon_type.Multishot);
w.set_sprite();
w.set_weight();
w.set_cooldown([], 0);
w.set_hits();
w.set_damage([], []);
w.set_delay();
w.set_duration();
w.set_enchants([]);
w.set_create();
w.set_step();
#endregion

#region description

#endregion

#endregion
