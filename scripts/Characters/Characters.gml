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
    crt = 1;
    ball_size = 1;
    flat = false;
    unlocked_by_default = true;
    agency = undefined;
    
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
        crt = s;
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
    static set_unlocked = function(s) {
        unlocked_by_default = s;
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
    .set_unlocked(true)

c = new character("Aki_Rosenthal");
c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait, sTitleAki)

c = new character("Kiara_Takanashi");
c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait, sTitleKiara)