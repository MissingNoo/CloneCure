GameData ??= {};
GameData.characters = {};
#macro Characters GameData.characters
function character(_name) constructor {
    name = _name;
    spd = 0;
    idle_sprite = sBlank;
    run_sprite = sBlank;
    title_sprite = sBlank;
    main_weapon = "undefined";
    portrait = sBlank;
    hp = 10;
    atk = 1;
    crit = 1;
    ball_size = 1;
    flat = false;
    unlocked_by_default = true;
    unlocked = false;
    agency = undefined;
    locked_color = undefined;
    
    GameData.characters[$ _name] = self;
     
    static set_weapon = function(_w) {
        main_weapon = _w;
        return self;
    }

    static set_sprite = function(idle, run, port, title) {
        idle_sprite = idle;
        run_sprite = run;
        portrait = port;
        title_sprite = title;
        var surf = surface_create(1, 1);
        surface_set_target(surf);
        draw_sprite_centered(title, 0, 0, 33);
        surface_reset_target();
        locked_color = surface_getpixel(surf, 0, 0);
        surface_free(surf);
        return self;
    }
    
    static set_speed = function(s) {
        spd = s;
        return self;
    }
    static set_hp = function(s) {
        hp = s;
        return self;
    }
    static set_crit = function(s) {
        crit = s;
        return self;
    }
    static set_atk = function(s) {
        atk = s;
        return self;
    }
    static set_ballsize = function(s) {
        ball_size = s;
        return self;
    }
    static set_flat = function(s) {
        flat = s;
        return self;
    }
    static set_unlocked_default = function(s) {
        unlocked_by_default = s;
        unlocked = s;
        return self;
    }
    static set_unlocked = function(s) {
        unlocked = s;
        return self;
    }
    static set_agency = function(s) {
        agency = s;
        return self;
    }
}

var c = new character("Amelia_Watson");
c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait, sTitleAme)
    .set_speed(1.35)
    .set_weapon("Ame_Pistol")
    .set_hp(75)
    .set_atk(1.30)
    .set_crit(1.10)
    .set_ballsize(3)
    .set_flat(false)
    .set_unlocked_default(true)

c = new character("Aki_Rosenthal");
c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait, sTitleAki)

c = new character("Takanashi_Kiara");
c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait, sTitleKiara)

c = new character("Tenma_Maemi");
c.set_sprite(sTenmaIdle, sTenmaRun, sTenmaSake, sTitleTenma);