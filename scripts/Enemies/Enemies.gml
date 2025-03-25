GameData ??= {};
#macro Enemies GameData.enemies
Enemies = {};
function Enemy(_name) constructor {
    name = _name;
    sprite = sUrufu;
    spd = 0;
    hp = 1;
    atk = 0;
    experience = 0;
    weight = 0;
    boss = false;
    scale = 1;
    knockback_immune = false;
    Enemies[$ _name] = self;
}

var e = new Enemy("Urufugang");
e.sprite = sUrufu;
e.hp = 16;
e.spd = .35;
e.atk = 2;
e.experience = 6;
e.weight = 1;
e.scale = 0.75;