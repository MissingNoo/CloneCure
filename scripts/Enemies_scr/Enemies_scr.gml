GameData ??= {};
#macro Enemies GameData.enemies
Enemies = {};

function Enemy(_name) constructor {
	name = string_lower(_name);
	sprite = sUrufu;
	spd = 0;
	hp = 1;
	atk = 0;
	experience = 0;
	weight = 0;
	boss = false;
	miniboss = false;
	scale = 1;
	knockback_immune = false;
	levels = array_create(10, self);
	lock_dir = false;
	lifetime = undefined;
	Enemies[$ name] = self;
	step_function = function () {};
	create_function = function () {};
	draw_function = function () {};
	animation_end_function = function () {};
	
	static on_create = function (f) {
		create_function = f;
		return self;
	}
	
	static on_draw = function (f) {
		draw_function = f;
		return self;
	}
	
	static on_step = function (f) {
		step_function = f;
		return self;
	}
	
	static on_animation_end = function (f) {
		animation_end_function = f;
		return self;
	}

	static set_sprite = function(val) {
		sprite = val;
		return self;
	};

	static set_hp = function(val) {
		hp = val;
		return self;
	};

	static set_spd = function(val) {
		spd = val;
		return self;
	};

	static set_atk = function(val) {
		atk = val;
		return self;
	};

	static set_experience = function(val) {
		experience = val;
		return self;
	};

	static set_weight = function(val) {
		weight = val;
		return self;
	};

	static set_scale = function(val) {
		scale = val;
		return self;
	};

	static set_boss = function(val) {
		boss = val;
		return self;
	};

	static set_mini_boss = function(val) {
		miniboss = val;
		return self;
	};
	
	static set_lifetime = function(val) {
		lifetime = val;
		return self;
	};

	static lock_direction = function(val) {
		lock_dir = val;
		return self;
	};
	
	static level_of = function (main, level) {
		var n = string_lower(main);
		if (is_undefined(Enemies[$n])) {
			show_debug_message($"[ENEMIES] no main enemy named {main}");
		} else {
			Enemies[$n].levels[level] = self;
		}
		return self;
	}
}

var e = new Enemy("Theo");
e.sprite = sTheo;
e.hp = 20;
e.spd = 0.35;
e.atk = 2;
e.experience = 6;
e.weight = 3;
e.scale = 1;
// feather disable GM2044
var e = new Enemy("Shrimp");
e.set_sprite(sUrufu)
	.set_hp(8)
	.set_spd(0.35)
	.set_atk(2)
	.set_experience(6)
	.set_weight(1)
	.set_scale(0.75);
var e = new Enemy("DarkShrimp");
e.set_sprite(sDarkShrimp)
	.set_hp(125)
	.set_spd(0.60)
	.set_atk(5)
	.set_experience(12)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("ShrimpMiniBoss");
e.set_sprite(sUrufu)
	.set_hp(600)
	.set_spd(0.50)
	.set_atk(6)
	.set_experience(150)
	.set_weight(1)
	.set_scale(1.5)
	.set_mini_boss(true);
var e = new Enemy("MegaDarkShrimp");
e.set_sprite(sDarkShrimp)
	.set_hp(2500)
	.set_spd(0.90)
	.set_atk(10)
	.set_experience(1000)
	.set_weight(1)
	.set_scale(1.5)
	.level_of("ShrimpMiniBoss", 2);
var e = new Enemy("DeadBeat");
e.set_sprite(sTheo)
	.set_hp(40)
	.set_spd(0.40)
	.set_atk(4)
	.set_experience(7)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("DeadBeatLV2");
e.set_sprite(sDeadBatter)
	.set_hp(150)
	.set_spd(0.60)
	.set_atk(7)
	.set_experience(9)
	.set_weight(1)
	.set_scale(1)
	.level_of("DeadBeat", 2);
var e = new Enemy("DeadBeatLV3");
e.set_sprite(sDeadBeatLV3)
	.set_hp(380)
	.set_hp(380)
	.set_spd(0.65)
	.set_atk(5)
	.set_experience(8)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Takodachi");
e.set_sprite(sLiacon)
	.set_hp(80)
	.set_spd(0.40)
	.set_atk(4)
	.set_experience(8)
	.set_weight(1)
	.set_scale(0.85);
var e = new Enemy("TakoViking");
e.set_sprite(sTakoViking)
	.set_hp(50)
	.set_spd(0.40)
	.set_atk(4)
	.set_experience(1)
	.set_weight(0)
	.set_scale(1.50);
var e = new Enemy("KFP");
e.set_sprite(sKFPEmployee)
	.set_hp(20)
	.set_spd(1)
	.set_atk(2)
	.set_experience(3)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("KFPHorde");
e.set_sprite(sKFPEmployee)
	.set_hp(20)
	.set_spd(1.65)
	.set_atk(1)
	.set_experience(2)
	.set_weight(1)
	.set_scale(1)
	.set_lifetime(350)
	.lock_direction(true)
var e = new Enemy("TakodachiMiniBoss");
e.set_sprite(sTakodachi)
	.set_hp(1800)
	.set_spd(0.75)
	.set_atk(10)
	.set_experience(600)
	.set_weight(1)
	.set_scale(2);
var e = new Enemy("AngelFairy");
e.set_sprite(sBloom)
	.set_hp(30)
	.set_spd(0.70)
	.set_atk(6)
	.set_experience(12)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("DevilFairy");
e.set_sprite(sGloom)
	.set_hp(30)
	.set_spd(0.70)
	.set_atk(6)
	.set_experience(12)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("BigBubba");
e.set_sprite(sThiccBubba)
	.set_hp(1000)
	.set_spd(0.85)
	.set_atk(12)
	.set_experience(20)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Investi-Gator4");
e.set_sprite(sInvestigator)
	.set_hp(180)
	.set_spd(0.85)
	.set_atk(7)
	.set_experience(9)
	.set_weight(1)
	.set_scale(1)
	.level_of("BigBubba", 4)
var e = new Enemy("Investi-Gator1");
e.set_sprite(sInvestigator)
	.set_hp(1000)
	.set_spd(1.6)
	.set_atk(7)
	.set_experience(10)
	.set_weight(1)
	.set_scale(1)
	.set_lifetime(20)
	.level_of("BigBubba", 1)
var e = new Enemy("DeadBeatMiniBoss");
e.set_sprite(sDeadBatter)
	.set_hp(3500)
	.set_spd(1)
	.set_atk(11)
	.set_experience(1500)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Disgruntled Employee");
e.set_sprite(sDisgruntledEmployee)
	.set_hp(50)
	.set_spd(1.15)
	.set_atk(4)
	.set_experience(7)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Hungry_TakoDachi");
e.set_sprite(sHungryTakodachi)
	.set_hp(220)
	.set_spd(0.65)
	.set_atk(8)
	.set_experience(9)
	.set_weight(1)
	.set_scale(1.50);
var e = new Enemy("Fubura");
e.set_sprite(sFubuzilla)
	.set_hp(8000)
	.set_spd(0.80)
	.set_atk(15)
	.set_experience(2000)
	.set_weight(1)
	.set_scale(1.8)
	.set_mini_boss(true)
	.on_create(function() {
		hard_mode = false;
		laser_dir = 0;
		laser_frame = AirLib.frame + seconds_to_frames(3);
	})
	.on_step(function() {
		if (hard_mode) {
			laser_dir = point_direction(x, y, oPlayer.x, oPlayer.y);
		} else {
			laser_dir = oPlayer.x > x ? 0 : 180;
		}
		if (AirLib.frame > laser_frame) {
			laser_frame = AirLib.frame + seconds_to_frames(6);
			var xoff = 0;
			switch (laser_dir) {
				case 0:
					xoff = sprite_width / 3;
					break;
				case 180:
					xoff = -(sprite_width / 3);
					break;
			}
			instance_create_depth(-10000, -10000, depth, oFubuzillaBeam, {image_angle : laser_dir, owner : self.id, xoff : xoff});
		}
	});
var e = new Enemy("Rats");
e.set_sprite(sBaeRat)
	.set_hp(100)
	.set_spd(1.10)
	.set_atk(5)
	.set_experience(8)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Kromies");
e.set_sprite(sKronieA)
	.set_hp(450)
	.set_spd(0.80)
	.set_atk(11)
	.set_experience(10)
	.set_weight(1)
	.set_scale(1)
	.on_create(function () {
		sprite_index = choose(sKronieA, sKronieB);
	})
var e = new Enemy("King_Kronie");
e.set_sprite(sKingKronie)
	.set_hp(5500)
	.set_spd(1)
	.set_atk(18)
	.set_experience(2000)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Q_DeadBeat");
e.set_sprite(sQDeadBeat)
	.set_hp(650)
	.set_spd(0.70)
	.set_atk(14)
	.set_experience(12)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Q_Shrimp");
e.set_sprite(sQShrimp)
	.set_hp(650)
	.set_spd(0.90)
	.set_atk(12)
	.set_experience(12)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Giant_Q_Deadbeat");
e.set_sprite(sQDeadBeat)
	.set_hp(7500)
	.set_spd(1.10)
	.set_atk(20)
	.set_experience(1200)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Mega_Q_Shrimp");
e.set_sprite(sQShrimp)
	.set_hp(7500)
	.set_spd(1.10)
	.set_atk(20)
	.set_experience(1200)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Sapling_A");
e.set_sprite(sSaplingA)
	.set_hp(900)
	.set_spd(0.70)
	.set_atk(14)
	.set_experience(11)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Sapling_B");
e.set_sprite(sSaplingB)
	.set_hp(900)
	.set_spd(0.70)
	.set_atk(14)
	.set_experience(11)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Sapling_C");
e.set_sprite(sSaplingC)
	.set_hp(900)
	.set_spd(0.70)
	.set_atk(14)
	.set_experience(11)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Hooman_A");
e.set_sprite(sHoomanA)
	.set_hp(750)
	.set_spd(1)
	.set_atk(12)
	.set_experience(11)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Hooman_B");
e.set_sprite(sHoomanB)
	.set_hp(750)
	.set_spd(1)
	.set_atk(12)
	.set_experience(11)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Overgrown_Sapling");
e.set_sprite(sSaplingKing)
	.set_hp(11000)
	.set_spd(1.10)
	.set_atk(20)
	.set_experience(2000)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Sanallite");
e.set_sprite(sSanallite)
	.set_hp(2000)
	.set_spd(0.60)
	.set_atk(18)
	.set_experience(14)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("SwarmingKingKronie");
e.set_sprite(sKingKronie)
	.set_hp(3000)
	.set_spd(0.40)
	.set_atk(17)
	.set_experience(15)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("SwarmingOvergrownSapling");
e.set_sprite(sSaplingKing)
	.set_hp(3000)
	.set_spd(0.40)
	.set_atk(17)
	.set_experience(15)
	.set_weight(1)
	.set_scale(1);
var e = new Enemy("Smol_Ame");
e.set_sprite(sSmolAme)
	.set_hp(10000)
	.set_spd(1.20)
	.set_atk(20)
	.set_experience(5000)
	.set_weight(1)
	.set_scale(1);
e.boss = true;

e.on_create(method(e, function () {
	jump_timer = AirLib.frame + seconds_to_frames(5);
	fall_timer = AirLib.frame + seconds_to_frames(2);
	ame = new SnowState("normal");
	ame.add("normal", {
		enter : function () {
			sprite_index = sSmolAme;
			speed = e.spd;
		},
		step : function () {
			if (AirLib.frame > jump_timer) {
				ame.change("jumping");
			}
		},
		draw : function () {}
	});
	ame.add("jumping", {
		enter : function () {
			jump_timer = AirLib.frame + seconds_to_frames(irandom_range(8, 12));
			sprite_index = sSmolAmeJump;
			jy = y;
		},
		step : function () {
			if (image_index > 10) {
				ame.change("falling");
			} else {
				y -= 15;
			}
		},
		draw : function () {
		},
		leave : function () {
			y = jy;
		}
	});
	ame.add("falling", {
		enter:function () {
			jt = 0;
			image_speed = 0;
			speed = GameData.SPD - 0.3;
			mask_index = sBlank;
			x = oPlayer.x;
			y = oPlayer.y;
			fall_timer = AirLib.frame + seconds_to_frames(irandom_range(2, 3));
		},
		step:function () {
			if (AirLib.frame > fall_timer) {
				ame.change("fall");
			}
		},
		draw:function (){
			draw_sprite_ext(sAmeShadow, 0, x, y, 2, 2, 0, c_white, 0.8);
			draw_self();
		}
	});
	ame.add("fall", {
		enter:function () {
			image_speed = 1;
			speed = 0;
			sprite_index = sSmolAmeGroundpound;
			by = y;
			y -= sprite_height * 2;
			image_index = 0;
		},
		step:function () {
			if (y != by and image_index > 14) {
				image_speed = 0;
			}
			y = clamp(y + 12, 0, by);
			if (y == by) {
				mask_index = sSmolAme;
				image_speed = 1;
			}
		},
		draw:function (){
			draw_sprite_ext(sAmeShadow, 0, x, by, 2, 2, 0, c_white, 0.8);
			draw_self();
		}
	});
}));
e.on_step(method(e, function () {
	ame.step();
}));
e.on_draw(method(e, function () {
	ame.draw();
}));
e.on_animation_end(function () {
	switch (sprite_index) {
		case sSmolAmeGroundpound:
			ame.change("normal");
			break;
	}
})
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
