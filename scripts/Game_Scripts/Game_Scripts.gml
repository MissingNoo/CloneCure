#macro GameConfig global.game_config
GameConfig = {
    sound_volume : 1
}
global.minutes = 0;
global.seconds = 0;

GameData ??= {};
#macro Spawn_List GameData.spawn_list
Spawn_List = [];
#macro GameData global.gamedata
GameData.selected_character = "noone";
#macro Weapons global.gamedata.weapons
Weapons = {};
#macro Player_Weapons global.gamedata.player_weapons
Player_Weapons = array_create(6, undefined);
function weapon(_name) constructor {
    name = _name;
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
    run_create = function(){};
    run_begin_step = function(){};
    run_step = function(){};
    run_end_step = function(){};
    run_draw = function(){
        //draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);
        draw_self();
    };
    Weapons[$ name] = self;
    static set_sprite = function(spr, projectile) {
        sprite = spr;
        projectile_sprite = projectile;
        return self;
    }
    static set_create = function(f) {
        run_create = f;
        return self;
    }
    static set_begin_step = function(f) {
        run_step = f;
        return self;
    }
    static set_step = function(f) {
        run_step = f;
        return self;
    }
    static set_end_step = function(f) {
        run_end_step = f;
        return self;
    }
    static set_draw = function(f) {
        run_draw = f;
        return self;
    }
    static set_cooldown = function(_cooldown, _min_cooldown) {
        base_cooldown = _cooldown;
        cooldown = _cooldown[0];
        min_cooldown = _min_cooldown;
        return self;
    }
    static set_hits = function(amount) {
        hits = amount;
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
    static set_damage = function(_min, _max) {
        mindmg = _min;
        maxdmg = _max;
        return self;
    }
}

var w = new weapon("Ame_Pistol");
w.set_sprite(sAmeliaWeapon, sAmeliaWeaponProjectile)
.set_create(function(){
    timer = wid.delay;
    remaining = wid.shoots[wid.level] - 1;
    direction = point_direction(x, y, mouse_x, mouse_y);
    image_angle = direction;
    speed = 5;
})
.set_step(function() {
    timer = clamp(timer - 1, 0, infinity);
    if (can_spawn_other and timer == 0 and remaining > 0) {
        remaining--;
        timer = wid.delay;
        var inst = instance_create_depth(oPlayer.x, oPlayer.y - (oPlayer.sprite_height / 2), oPlayer.depth + 1, oWeapon, {
            wid : wid,
            can_spawn_other : false
        });
        inst.direction = direction;
        inst.image_angle = direction;
    }
})
.set_hits([0, 1, 2, 2, 2, 3, 3, 3])
.set_duration(120)
.set_hit_cooldown(20)
.set_cooldown([0, 80, 80, 80, 80, 60, 60, 60], 50)
.set_shoots([0, 3, 5, 5, 5, 5, 5, 5])
.set_perk(true, "Amelia")
.set_delay(6)
.set_damage([0, 8, 8, 10, 10, 10, 12, 12], [0, 12, 12, 14, 14, 14, 16, 16]);