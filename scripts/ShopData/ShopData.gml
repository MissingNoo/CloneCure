#macro Shop global.shopdata
function shop_upgrade(_name, _sprite, _cost) constructor {
    name = _name;
    sprite = _sprite;
    cost = _cost;
    type = undefined;
    level = 0;
    Shop.upgrades[$ name] = self;
}
function shop_ability(_name, _sprite, _cost) : shop_upgrade(_name, _sprite, _cost) constructor {
    type = "ability";
}
function shop_stat(_name, _sprite, _cost) : shop_upgrade(_name, _sprite, _cost) constructor {
    type = "stats";
}
function shop_other(_name, _sprite, _cost) : shop_upgrade(_name, _sprite, _cost) constructor {
    type = "other";
}
Shop = {
    upgrades : {}
};

new shop_ability("Special_Attack", sHudSpecialUnlockIcon, [500]);
new shop_ability("Growth", sHudGrowthIcon, [500, 10000, 50000]);
new shop_ability("Reroll", sHudRerollIcon, [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000]);
new shop_ability("Eliminate", sHudHPIcon, [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000]);
new shop_ability("Stamps", sHudHPIcon, [500]);
new shop_ability("Hold", sHudHPIcon, [5000, 10000, 15000, 20000, 25000]);
new shop_ability("Customize", sHudHPIcon, [50000]);
new shop_ability("Supports", sHudHPIcon, [1000]);
new shop_ability("Material_Find", sHudHPIcon, [20000]);
new shop_ability("Fan_Letters", sHudHPIcon, [50000]);
new shop_ability("Enchantments", sHudHPIcon, [1000]);
new shop_ability("Fandom", sFollowingFan, [2000]);

new shop_stat("Max_HP_Up", sHudHPIcon, [200, 500, 1200, 2750, 6000, 12000, 18000, 24000, 30000, 36000]);
new shop_stat("ATK_Up", sHudATKIcon, [300, 750, 1800, 4100, 9100, 18000, 25000, 31000, 37000, 43000]);
new shop_stat("SPD_Up", sHudSPDIcon, [200, 500, 1200, 2750, 6000, 12000, 18000, 24000, 30000, 36000]);
new shop_stat("Crit_Up", sHudCRTIcon, [300, 750, 1800, 4100, 9100]);
new shop_stat("Pick_Up_Range", sHudPickupIcon, [200, 500, 1200, 2750, 6000, 12000, 18000, 24000, 30000, 36000]);
new shop_stat("Haste_Up", sHudHasteIcon, [400, 1000, 2400, 5500, 12000]);
new shop_stat("Regeneration", sHudRegenerationIcon, [200, 500, 1200, 2750, 6000]);
new shop_stat("Defense_Up", sHudDefenseIcon, [500, 1250, 3000, 6900, 15000]);
new shop_stat("Special_Cooldown_Reduction", sHudSpecialCooldownIcon, [500, 1250, 3000, 6900, 15000]);
new shop_stat("Skill_Up", sHudHPIcon, [500, 1250, 3000, 6900, 15000, 20000, 30000, 40000, 50000, 60000]); //TODO: icon
new shop_stat("EXP_Gain_Up", sXP, [300, 750, 1800, 4100, 9100]);
new shop_stat("Food_Drops_Up", sHamburger, [150, 375, 900, 2000, 4500]);
new shop_stat("Money_Gain_Up", sHolocoin, [400, 1000, 2400, 5500, 12000, 20000, 30000, 40000, 50000, 60000]);
new shop_stat("Enhancement_Rate_Up", sHudHPIcon, [300, 750, 1800, 4100, 9100]); //TODO: icon

new shop_other("Marketing", sHudHPIcon, [2000, 4000, 6000, 8000, 10000]); //TODO: icon