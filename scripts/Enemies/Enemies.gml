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
	
	static set_sprite = function(val) {
		sprite = val;
		return self;
	}
	static set_hp = function(val) {
		hp = val;
		return self;
	}
	static set_spd = function(val) {
		spd = val;
		return self;
	}
	static set_atk = function(val) {
		atk = val;
		return self;
	}
	static set_experience = function(val) {
		experience = val;
		return self;
	}
	static set_weight = function(val) {
		weight = val;
		return self;
	}
	static set_scale = function(val) {
		scale = val;
		return self;
	}
}

var e = new Enemy("Theo");
e.sprite = sTheo;
e.hp = 20;
e.spd = .35;
e.atk = 2;
e.experience = 6;
e.weight = 3;
e.scale = 1;
// feather disable GM2044
var e = new Enemy("Urufugang"); e.set_sprite(sUrufu).set_hp(8).set_spd(0.35).set_atk(2).set_experience(6).set_weight(1).set_scale(0.75);
var e = new Enemy("DarkShrimp"); e.set_sprite(sDarkShrimp).set_hp(125).set_spd(0.60).set_atk(5).set_experience(12).set_weight(1).set_scale(1);
var e = new Enemy("MegaShrimp"); e.set_sprite(sUrufu).set_hp(600).set_spd(0.50).set_atk(6).set_experience(150).set_weight(1).set_scale(1);
var e = new Enemy("MegaDarkShrimp"); e.set_sprite(sDarkShrimp).set_hp(2500).set_spd(0.90).set_atk(10).set_experience(1000).set_weight(1).set_scale(1);
var e = new Enemy("DeadBeat"); e.set_sprite(sTheo).set_hp(40).set_spd(0.40).set_atk(4).set_experience(7).set_weight(1).set_scale(1);
var e = new Enemy("DeadBeatLV2"); e.set_sprite(sDeadBatter).set_hp(150).set_spd(0.60).set_atk(7).set_experience(9).set_weight(1).set_scale(1);
var e = new Enemy("DeadBeatLV3"); e.set_sprite(sDeadBeatLV3).set_hp(380).set_spd(0.65).set_atk(5).set_experience(8).set_weight(1).set_scale(1);
var e = new Enemy("TakoDachi"); e.set_sprite(sTakodachi).set_hp(50).set_spd(0.40).set_atk(4).set_experience(1).set_weight(1).set_scale(1.50);
var e = new Enemy("TakoViking"); e.set_sprite(sTakoViking).set_hp(50).set_spd(0.40).set_atk(4).set_experience(1).set_weight(0).set_scale(1.50);
var e = new Enemy("KFPEmployee"); e.set_sprite(sKFPEmployee).set_hp(20).set_spd(1).set_atk(2).set_experience(3).set_weight(1).set_scale(1);
var e = new Enemy("Tako Grande"); e.set_sprite(sTakodachi).set_hp(1800).set_spd(0.75).set_atk(10).set_experience(600).set_weight(1).set_scale(2);
var e = new Enemy("Bloom"); e.set_sprite(sBloom).set_hp(30).set_spd(0.70).set_atk(6).set_experience(12).set_weight(1).set_scale(1);
var e = new Enemy("Gloom"); e.set_sprite(sGloom).set_hp(30).set_spd(0.70).set_atk(6).set_experience(12).set_weight(1).set_scale(1);
var e = new Enemy("Investi-Gator"); e.set_sprite(sInvestigator).set_hp(180).set_spd(0.85).set_atk(7).set_experience(9).set_weight(1).set_scale(1);
var e = new Enemy("GiantDeadBeatLV2"); e.set_sprite(sDeadBatter).set_hp(3500).set_spd(1).set_atk(11).set_experience(1500).set_weight(1).set_scale(1);
var e = new Enemy("Disgruntled Employee"); e.set_sprite(sDisgruntledEmployee).set_hp(50).set_spd(1.15).set_atk(4).set_experience(7).set_weight(1).set_scale(1);
var e = new Enemy("Hungry_TakoDachi"); e.set_sprite(sHungryTakodachi).set_hp(220).set_spd(0.65).set_atk(8).set_experience(9).set_weight(1).set_scale(1.50);
var e = new Enemy("FubuZilla"); e.set_sprite(sFubuzilla).set_hp(8000).set_spd(0.80).set_atk(15).set_experience(2000).set_weight(1).set_scale(1);
var e = new Enemy("BaeRat"); e.set_sprite(sBaeRat).set_hp(100).set_spd(1.10).set_atk(5).set_experience(8).set_weight(1).set_scale(1);
var e = new Enemy("KronieA"); e.set_sprite(sKronieA).set_hp(450).set_spd(0.80).set_atk(11).set_experience(10).set_weight(1).set_scale(1);
var e = new Enemy("KronieB"); e.set_sprite(sKronieA).set_hp(450).set_spd(0.80).set_atk(11).set_experience(10).set_weight(1).set_scale(1);
var e = new Enemy("King_Kronie"); e.set_sprite(sKingKronie).set_hp(5500).set_spd(1).set_atk(18).set_experience(2000).set_weight(1).set_scale(1);
var e = new Enemy("Q_DeadBeat"); e.set_sprite(sQDeadBeat).set_hp(650).set_spd(0.70).set_atk(14).set_experience(12).set_weight(1).set_scale(1);
var e = new Enemy("Q_Shrimp"); e.set_sprite(sQShrimp).set_hp(650).set_spd(0.90).set_atk(12).set_experience(12).set_weight(1).set_scale(1);
var e = new Enemy("Giant_Q_Deadbeat"); e.set_sprite(sQDeadBeat).set_hp(7500).set_spd(1.10).set_atk(20).set_experience(1200).set_weight(1).set_scale(1);
var e = new Enemy("Mega_Q_Shrimp"); e.set_sprite(sQShrimp).set_hp(7500).set_spd(1.10).set_atk(20).set_experience(1200).set_weight(1).set_scale(1);
var e = new Enemy("Sapling_A"); e.set_sprite(sSaplingA).set_hp(900).set_spd(0.70).set_atk(14).set_experience(11).set_weight(1).set_scale(1);
var e = new Enemy("Sapling_B"); e.set_sprite(sSaplingB).set_hp(900).set_spd(0.70).set_atk(14).set_experience(11).set_weight(1).set_scale(1);
var e = new Enemy("Sapling_C"); e.set_sprite(sSaplingC).set_hp(900).set_spd(0.70).set_atk(14).set_experience(11).set_weight(1).set_scale(1);
var e = new Enemy("Hooman_A"); e.set_sprite(sHoomanA).set_hp(750).set_spd(1).set_atk(12).set_experience(11).set_weight(1).set_scale(1);
var e = new Enemy("Hooman_B"); e.set_sprite(sHoomanB).set_hp(750).set_spd(1).set_atk(12).set_experience(11).set_weight(1).set_scale(1);
var e = new Enemy("Overgrown_Sapling"); e.set_sprite(sSaplingKing).set_hp(11000).set_spd(1.10).set_atk(20).set_experience(2000).set_weight(1).set_scale(1);
var e = new Enemy("Sanallite"); e.set_sprite(sSanallite).set_hp(2000).set_spd(0.60).set_atk(18).set_experience(14).set_weight(1).set_scale(1);
var e = new Enemy("SwarmingKingKronie"); e.set_sprite(sKingKronie).set_hp(3000).set_spd(0.40).set_atk(17).set_experience(15).set_weight(1).set_scale(1);
var e = new Enemy("SwarmingOvergrownSapling"); e.set_sprite(sSaplingKing).set_hp(3000).set_spd(0.40).set_atk(17).set_experience(15).set_weight(1).set_scale(1);
var e = new Enemy("Thicc_Bubba"); e.set_sprite(sThiccBubba).set_hp(1000).set_spd(0.85).set_atk(12).set_experience(20).set_weight(1).set_scale(1);
var e = new Enemy("Smol_Ame"); e.set_sprite(sSmolAme).set_hp(10000).set_spd(1.20).set_atk(20).set_experience(5000).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sUrufu).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sQDeadBeat).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sTakodachi).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sDisgruntledEmployee).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sThiccBubba).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sBloom).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sGloom).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sSaplingA).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sBaeRat).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sKronieA).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sHoomanA).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sSanallite).set_hp(5000).set_spd(1).set_atk(15).set_experience(25).set_weight(1).set_scale(1);
//var e = new Enemy("Endless"); e.set_sprite(sSake).set_hp(9000).set_spd(1.50).set_atk(5).set_experience(25).set_weight(1).set_scale(1);