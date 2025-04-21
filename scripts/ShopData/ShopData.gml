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