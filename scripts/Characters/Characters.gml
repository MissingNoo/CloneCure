GameData ??= {};
GameData.characters = {};
function character(_name) constructor {
    name = _name;
    spd = 0;
    idle_sprite = sBlank;
    run_sprite = sBlank;
    main_weapon = "undefined";
    portrait = sBlank;
    GameData.characters[$ _name] = self;
     
    static set_weapon = function(_w) {
        main_weapon = _w;
        return self;
    }

    static set_sprite = function(idle, run, port) {
        idle_sprite = idle;
        run_sprite = run;
        portrait = port;
        return self;
    }
    
    static set_speed = function(s) {
        spd = s;
        return self;
    }
}

var c = new character("Amelia"); 
c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait).set_speed(1.35).set_weapon("Ame_Pistol");