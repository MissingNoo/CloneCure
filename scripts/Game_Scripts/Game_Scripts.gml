#macro GameConfig global.game_config
#macro weapon_create instance_create_depth(oPlayer.x, oPlayer.y - (oPlayer.sprite_height / 2), oPlayer.depth + 1, oWeapon, 
GameConfig = {
    sound_volume : 1,
    music_volume : 1
}
global.minutes = 0;
global.seconds = 0;

GameData ??= {};
GameData.xp = 0;
GameData.needed_xp = 79;
GameData.music = undefined;
#macro Spawn_List GameData.spawn_list
Spawn_List = [];
#macro GameData global.gamedata
GameData.selected_character = "noone";
#macro Weapons global.gamedata.weapons
Weapons = {};
#macro Player_Weapons global.gamedata.player_weapons
Player_Weapons = array_create(6, undefined);
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
	Knockback
}
function weapon(_name) constructor {
    name = _name;
    run_create = function(){};
    run_begin_step = function(){};
    run_step = function(){};
    run_end_step = function(){};
    run_on_hit = function(){};
    run_on_animation_end = function(){};
    run_draw = function(){
        draw_self();
    };
    sprite = sBlank;
    level = 1;
    max_level = 7;
    cooldown = 0;
    base_cooldown = [];
    min_cooldown = 0;
    hits = 0;
    duration = 10;
    hit_cooldown = 10;
    shoots = 1;
    projectile_sprite = sBlank;
    perk = false;
    character_name = undefined;
    delay = 0;
    mindmg = [];
    maxdmg = [];
    type = undefined;
    can_enchant = [];
    weight = 3;
	lex = "Weapons"
	area = [0, 1, 1, 1, 1, 1, 1, 1];
    
    Weapons[$ name] = self;
	/// @function                set_sprite(spr, projectile)
	/// @description             Set the weapon sprites.
	/// @param {Asset.GMSprite}    spr The thumbnail for the weapon.
	/// @param {Asset.GMSprite}  	 projectile The sprite used for the projectile on map.
    static set_sprite = function(spr, projectile) {
        sprite = spr;
        projectile_sprite = projectile;
        return self;
    }
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
	/// @function                set_cooldown(cooldown, minimum_cooldown)
	/// @description             Defines the cooldown for the weapon.
	/// @param {array}    _cooldown   The base cooldown levels.
	/// @param {real}    _min_cooldown   The minimum possible cooldown.
    static set_cooldown = function(_cooldown, _min_cooldown) {
        array_insert(_cooldown, 0, 0);
        base_cooldown = _cooldown;
        cooldown = _cooldown[1];
        min_cooldown = _min_cooldown;
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
    static set_duration = function(amount) {
        duration = amount;
        return self;
    }
    static set_hit_cooldown = function(amount) {
        hit_cooldown = amount;
        return self;
    }
    static set_shoots = function(amount) {
        array_insert(amount, 0, 0);
        shoots = amount;
        return self;
    }
    static set_perk = function(boolean, char) {
        perk = boolean;
        character_name = char;
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
	/// @function                set_area(area)
	/// @description             Defines weapon scale.
	/// @param {array}     _area The minimum damage for the weapon.
    static set_area = function(_area) {
        array_insert(_area, 0, 0);
        area = _area;
        return self;
    }
    static set_type = function(_type) {
        type = _type;
        return self;
    }
    static set_enchants = function(list) {
        can_enchant = list;
        return self;
    }
    static set_weight = function(amount) {
        weight = amount;
        return self;
    }
}
#region Ame Pistol
var w = new weapon("Ame_Pistol");
w.set_sprite(sAmeliaWeapon, sAmeliaWeaponProjectile);
w.set_create(function(){
    timer = wid.delay;
    remaining = wid.shoots[level] - 1;
    other_dir = direction;
    image_angle = direction;
    speed = 5;
    ricocheted = false;
});
w.set_step(function() {
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
w.set_on_hit(function() {
    if (level > 4 and hits <= 0 and !ricocheted) {
        ricocheted = true;
    	hits = 3;
        direction = random(360);
        image_angle = direction;
    }
    //TODO: Level 7, no fucking idea
});
w.set_hits([1, 2, 2, 2, 3, 3, 3])
w.set_duration(120)
w.set_hit_cooldown(20)
w.set_cooldown([80, 80, 80, 80, 60, 60, 60], 50)
w.set_shoots([3, 5, 5, 5, 5, 5, 5])
w.set_perk(true, "Amelia")
w.set_delay(6)
w.set_damage([8, 8, 10, 10, 10, 12, 12], [12, 12, 14, 14, 14, 16, 16])
w.set_type(weapon_type.Multishot)
#endregion

#region BL Book
w = new weapon("BL_Book");
w.set_sprite(sBLBookThumb, sBLBook)
w.set_hits(7)
w.set_duration(120)
w.set_hit_cooldown(20)
w.set_cooldown([360, 360, 300, 300, 300, 300, 300], 300)
w.set_shoots([3, 4, 4, 5, 5, 6, 6])
w.set_delay(0.1)
w.set_damage([12, 12, 16, 16, 16, 16, 23], [16, 16, 20, 20, 20, 20, 28])
w.set_type(weapon_type.Multishot)
w.set_weight(3)
w.set_create(function(){
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
})
w.set_step(function(){
    orbit_place -= spinning_speed;
    x = oPlayer.x + lengthdir_x(orbit_length, round(orbit_place));
	y = oPlayer.y - 16 + lengthdir_y(orbit_length, round(orbit_place));
})
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
w.set_create(function(){
	range = [0, 60, 60, 60, 60, 80, 80, 80];
	var on_range = collision_circle(x, y, range[level], oEnemy, true, true);
	if (on_range == noone) {
		instance_destroy();
	} else {
		image_angle = point_direction(x, y, on_range.x, on_range.y);
	}
	sausagetimer = frame + wid.delay;
	sausages = wid.shoots[level] - 1;
});
w.set_step(function() {
	if (sausagetimer < frame and can_spawn_other and sausages > 0) {
		sausages--;
		sausagetimer = frame + wid.delay;
		var inst = weapon_create {
			wid : wid,
		});
	}
});
w.set_on_animation_end(function(){
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
#endregion