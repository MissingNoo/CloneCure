function EventSpawnDirectionLocked (data){
	var enemy = check_enemy(data.id);
	show_debug_message($"[STAGE] spawning {enemy} dirlock!");
	var y_offset = -(data.spacing * data.amount / 2);
	data.lock_dir_frame = 1;
	for (var i = 0; i < data.amount; i++) {
		spawn_enemy(oPlayer.x + lengthdir_x(oCam.baseW / 1.9, data.dir), oPlayer.y + y_offset, enemy, data);
		y_offset += data.spacing;
	}
}
function EventSpawnClumpedDirection (){}
function EventSpawnWall(){}
function check_enemy(_id) {
	_id = string_lower(_id);
	return is_undefined(Enemies[$ _id]) ? "shrimp" : _id;
}
function EventSpawnHorde(data){
	var enemy = check_enemy(data.id);
	show_debug_message($"[STAGE] spawning {enemy} horde!");
	for (var i = 0; i < data.amount; i++) {
		spawn_enemy(oPlayer.x + lengthdir_x(oCam.baseW, data.dir), oPlayer.y + lengthdir_y(oCam.baseH, data.dir), enemy);
	}
}
function EventSpawnDirection(){}
function EventSpawnCircle(data = {id: "ShrimpWall", dir: "evenSurround", amount: 120}) {
	var enemy = check_enemy(data.id);
	show_debug_message($"[STAGE] spawning {enemy} circle!");
	var c = 360 / data.amount;
	for (var circle_pos = 0, i = 0; i < data.amount; i++) {
		spawn_enemy(oPlayer.x + lengthdir_x(oCam.baseH, circle_pos), oPlayer.y + lengthdir_y(oCam.baseH, circle_pos), enemy);
		circle_pos += c;
	}
}
function stage1_fill() {
	
	//global.topBorder = -1
	//global.bottomBorder = -1
	//global.leftBorder = -1
	//global.rightBorder = -1
	//global.wrappingStage = true
	var stage1 = new Stage("Stage1");
	stage1.set_border(610, 610, 3170, 3170);
	stage1.set_music(bgm_suspect);
	stage1.set_room(rStage1);
	stage1.set_bg(sStage1Port);
	stage1.set_coin_multiplier(1.25);
	stage1.add_enemy("Shrimp", "00:01");
	stage1.AddTimeEvent(
		0,
		0,
		5,
		"EventSpawnClumpedDirection",
		EventSpawnClumpedDirection,
		{id: "Shrimp", level: "1", dir: "0", amount: 15, size: 40}
	);
	stage1.AddTimeEvent(0, 0, 8, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_767_gml_Object_obj_StageManager_Other_11
		enemy_limit = 100;
		spawn_rate = 150;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 0, 30, "NewMob", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_907_gml_Object_obj_StageManager_Other_11
		add_mob_choice("Deadbeat", 1, 1);
		spawn_rate = 130;
	});
	stage1.AddTimeEvent(
		0,
		0,
		45,
		"EventSpawnCircle",
		EventSpawnCircle,
		{id: "Deadbeat", level: "1", amount: 15, dir: "evenSurround", canReduce: true}
	);
	stage1.AddTimeEvent(0, 1, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_1189_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 100;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(
		0,
		1,
		5,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "1",
			dir: ParseSpawnDirection((0 + irandom(1) * 180), "horizontalSurround"),
			amount: 30,
		}
	);
	stage1.AddTimeEvent(
		0,
		1,
		30,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Deadbeat",
			level: "1",
			speed: 0.6,
			dir: 0,
			dirMoving: 180,
			amount: 70,
			spacing: 30,
			spawnOverride: {
				lifeTime: 500,
				expvalue: 4,
				HP: 120,
				ignoreHalu: true,
				sprite_index: sDeadBeatLV3,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		1,
		30,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Deadbeat",
			level: "1",
			speed: 0.6,
			dir: 180,
			dirMoving: 0,
			amount: 70,
			spacing: 30,
			spawnOverride: {
				lifeTime: 500,
				canFreeze: false,
				expvalue: 4,
				HP: 120,
				ignoreHalu: true,
				sprite_index: sDeadBeatLV3,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 1, 30, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_2293_gml_Object_obj_StageManager_Other_11
		enemy_limit = 550;
		spawn_rate = 80;
		spawn_amount = 5;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(
		0,
		2,
		0,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "ShrimpMiniBoss", level: "1", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(0, 2, 30, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_2613_gml_Object_obj_StageManager_Other_11
		spawn_amount = 3;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(
		0,
		2,
		35,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "Deadbeat", level: "1", dir: "evenSurround", amount: 50}
	);
	stage1.AddTimeEvent(0, 2, 44, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_2881_gml_Object_obj_StageManager_Other_11
		var alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(
		0,
		2,
		45,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Deadbeat",
			level: "1",
			speed: 2.5,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 500,
				lockFacing: false,
				sprite_index: sDeadBeatLV3,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(0, 3, 0, "NewMob", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_3395_gml_Object_obj_StageManager_Other_11
		remove_mob_choice("Shrimp");
		add_mob_choice("Takodachi", 2, 1);
		spawn_rate = 120;
	});
	//if (ds_map_find_value(global.PlayerSave, "stamps") > 0) {
		//stage1.AddTimeEvent(
			//0,
			//3,
			//0,
			//"SilverYagoo",
			//EventSpawnDirection,
			//{id: "SilverYagoo", level: "1", amount: 1, dir: "evenSurround", chance: 30}
		//);
	//}
	stage1.AddTimeEvent(
		0,
		3,
		18,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "1",
			dir: ParseSpawnDirection((90 + irandom(1) * 180), "verticalSurround"),
			amount: 30,
		}
	);
	stage1.AddTimeEvent(
		0,
		3,
		15,
		"EventSpawnWall1",
		EventSpawnWall,
		{
			id: "Takodachi",
			level: "1",
			dir: 90,
			amount: 70,
			spacing: 30,
			spawnOverride: {
				lifeTime: 500,
				expvalue: 5,
				HP: 200,
				SPD: 0.55,
				sprite_index: sTakoViking,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		3,
		15,
		"EventSpawnWall2",
		EventSpawnWall,
		{
			id: "Takodachi",
			level: "1",
			dir: 270,
			amount: 70,
			spacing: 30,
			spawnOverride: {
				lifeTime: 500,
				expvalue: 5,
				HP: 200,
				SPD: 0.55,
				sprite_index: sTakoViking,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 3, 39, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_4537_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(0, 3, 39, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_4672_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		3,
		40,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Takodachi",
			level: "1",
			speed: 1.6,
			dir: 90,
			dirMoving: 270,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 500,
				lockFacing: false,
				sprite_index: sTakoViking,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		3,
		40,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Takodachi",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 90,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 500,
				lockFacing: false,
				sprite_index: sTakoViking,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(0, 4, 0, "NewMob", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_5585_gml_Object_obj_StageManager_Other_11
		add_mob_choice("KFP", 1, 1);
		spawn_amount = 3;
	});
	stage1.AddTimeEvent(
		0,
		4,
		0,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "TakodachiMiniBoss", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(
		0,
		4,
		15,
		"EventSpawnDirection",
		EventSpawnDirection,
		{
			id: "Takodachi",
			level: "1",
			dir: "evenSurround",
			amount: 50,
			spawnOverride: {
				lifeTime: 1500,
				expvalue: 5,
				HP: 200,
				sprite_index: sTakoViking,
			},
		}
	);
	stage1.AddTimeEvent(0, 4, 20, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_6103_gml_Object_obj_StageManager_Other_11
		spawn_rate = 80;
		spawn_amount = 7;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 5, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_6245_gml_Object_obj_StageManager_Other_11
		enemy_limit = 400;
		spawn_amount = 6;
	});
	stage1.AddTimeEvent(
		0,
		5,
		0,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 100,
		}
	);
	stage1.AddTimeEvent(0, 5, 0, "NewMob", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_6516_gml_Object_obj_StageManager_Other_11
		add_mob_choice("Shrimp", 3, 2);
		add_mob_choice("AngelFairy", 4, 1);
		add_mob_choice("DevilFairy", 4, 1);
		remove_mob_choice("Takodachi");
		remove_mob_choice("Deadbeat");
	});
	stage1.AddTimeEvent(
		0,
		5,
		0,
		"GoldenYagoo",
		EventSpawnDirection,
		{id: "GoldenYagoo", level: "1", amount: 1, dir: "evenSurround", chance: 20}
	);
	stage1.AddTimeEvent(
		0,
		5,
		5,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 100,
		}
	);
	stage1.AddTimeEvent(
		0,
		5,
		10,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 100,
		}
	);
	stage1.AddTimeEvent(0, 5, 29, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_7256_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(
		0,
		5,
		30,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Takodachi",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 800,
				lockFacing: false,
				sprite_index: sTakoViking,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		5,
		31,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Takodachi",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 800,
				lockFacing: false,
				sprite_index: sTakoViking,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		5,
		32,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Takodachi",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			offset: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 800,
				lockFacing: false,
				sprite_index: sTakoViking,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		5,
		33,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Takodachi",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			offset: 120,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 800,
				lockFacing: false,
				sprite_index: sTakoViking,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		5,
		34,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Takodachi",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			offset: 160,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 8,
				HP: 800,
				lockFacing: false,
				sprite_index: sTakoViking,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(0, 5, 45, "NewMob", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_9352_gml_Object_obj_StageManager_Other_11
		remove_mob_choice("KFP");
		spawn_amount = 5;
		add_mob_choice("Deadbeat", 2, 2);
	});
	stage1.AddTimeEvent(
		0,
		6,
		0,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "ShrimpMiniBoss", level: "2", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(0, 6, 30, "NewMob", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_9635_gml_Object_obj_StageManager_Other_11
		add_mob_choice("BigBubba", 4, 1);
		spawn_amount = 5;
	});
	stage1.AddTimeEvent(0, 7, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_9752_gml_Object_obj_StageManager_Other_11
		spawn_rate = 90;
	});
	stage1.AddTimeEvent(
		0,
		7,
		0,
		"EventSpawnCircle",
		EventSpawnCircle,
		{id: "ShrimpWall", dir: "evenSurround", amount: 120}
	);
	stage1.AddTimeEvent(0, 7, 30, "NewMob", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_9964_gml_Object_obj_StageManager_Other_11
		add_mob_choice("Takodachi", 1, 2);
		remove_mob_choice("AngelFairy");
		remove_mob_choice("DevilFairy");
	});
	stage1.AddTimeEvent(
		0,
		8,
		0,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "DeadBeatMiniBoss", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(0, 8, 30, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_10272_gml_Object_obj_StageManager_Other_11
		enemy_limit = 800;
		spawn_rate = 100;
		spawn_amount = 27;
		current_spawn_pattern = "evenSurround";
		remove_mob_choice("Deadbeat");
		add_mob_choice("Deadbeat", 8, 3);
		remove_mob_choice("Takodachi");
		remove_mob_choice("BigBubba");
		remove_mob_choice("Shrimp");
	});
	stage1.AddTimeEvent(0, 8, 45, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_10598_gml_Object_obj_StageManager_Other_11
		enemy_limit = 500;
		spawn_rate = 120;
		spawn_amount = 4;
		current_spawn_pattern = "evenSurround";
		add_mob_choice("Shrimp", 1, 2);
		add_mob_choice("BigBubba", 5, 1);
		add_mob_choice("Takodachi", 3, 2);
		remove_mob_choice("Deadbeat");
		add_mob_choice("AngelFairy", 2, 1);
		add_mob_choice("DevilFairy", 2, 1);
	});
	//if (ds_map_find_value(global.PlayerSave, "stamps") > 0) {
		//stage1.AddTimeEvent(
			//0,
			//9,
			//0,
			//"SilverYagoo",
			//EventSpawnDirection,
			//{id: "SilverYagoo", level: "1", amount: 1, dir: "evenSurround", chance: 30}
		//);
	//}
	stage1.AddTimeEvent(
		0,
		9,
		0,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "2",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 120,
		}
	);
	stage1.AddTimeEvent(
		0,
		9,
		5,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "2",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 120,
		}
	);
	stage1.AddTimeEvent(
		0,
		9,
		10,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "2",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 120,
		}
	);
	stage1.AddTimeEvent(
		0,
		9,
		15,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "2",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 120,
		}
	);
	stage1.AddTimeEvent(
		0,
		9,
		20,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "KFPHorde",
			level: "2",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 120,
		}
	);
	stage1.AddTimeEvent(0, 9, 30, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_12068_gml_Object_obj_StageManager_Other_11
		enemy_limit = 1000;
		spawn_rate = 90;
		spawn_amount = 7;
		current_spawn_pattern = "evenSurround";
		add_mob_choice("KFP", 1, 2);
	});
	stage1.AddTimeEvent(0, 10, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_12263_gml_Object_obj_StageManager_Other_11
		enemy_limit = 1000;
		spawn_rate = 150;
		spawn_amount = 4;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(
		0,
		10,
		0,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "Fubura", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(0, 10, 14, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_12554_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(0, 10, 14, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_12689_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(0, 10, 14, "AlertC", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_12825_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 180;
	});
	stage1.AddTimeEvent(0, 10, 14, "AlertD", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_12962_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		10,
		15,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "BigBubba",
			level: "1",
			speed: 1.6,
			dir: 90,
			dirMoving: 270,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 1000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		10,
		15,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "BigBubba",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 1000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		10,
		15,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "BigBubba",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 1000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		10,
		15,
		"EventSpawnDirectionLockedC",
		EventSpawnDirectionLocked,
		{
			id: "BigBubba",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 1000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 10, 30, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_14465_gml_Object_obj_StageManager_Other_11
		enemy_limit = 1000;
		spawn_rate = 100;
		spawn_amount = 10;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 11, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_14637_gml_Object_obj_StageManager_Other_11
		enemy_limit = 1000;
		spawn_rate = 60;
		spawn_amount = 10;
		current_spawn_pattern = "evenSurround";
		remove_mob_choice("Deadbeat");
		remove_mob_choice("Takodachi");
		remove_mob_choice("BigBubba");
		remove_mob_choice("Shrimp");
		remove_mob_choice("KFP");
		remove_mob_choice("AngelFairy");
		remove_mob_choice("DevilFairy");
		add_mob_choice("Rats", 1, 1);
	});
	stage1.AddTimeEvent(0, 11, 20, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_15052_gml_Object_obj_StageManager_Other_11
		enemy_limit = 1000;
		spawn_rate = 90;
		spawn_amount = 8;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(
		0,
		11,
		30,
		"EventSpawnCircle",
		EventSpawnCircle,
		{id: "Rats", level: "2", dir: "evenSurround", amount: 120, canReduce: true}
	);
	stage1.AddTimeEvent(0, 12, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_15383_gml_Object_obj_StageManager_Other_11
		enemy_limit = 1000;
		spawn_rate = 110;
		spawn_amount = 9;
		current_spawn_pattern = "evenSurround";
		add_mob_choice("Kromies", 1, 1);
	});
	stage1.AddTimeEvent(0, 12, 19, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_15577_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(
		0,
		12,
		20,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 3.5,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(0, 12, 19, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_16067_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 180;
	});
	stage1.AddTimeEvent(
		0,
		12,
		20,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 3.5,
			dir: 180,
			dirMoving: 0,
			amount: 10,
			spacing: 90,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(0, 12, 24, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_16571_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(
		0,
		12,
		25,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 2,
			dir: 90,
			dirMoving: 270,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(0, 12, 24, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_17061_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		12,
		25,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 3.5,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 90,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 12, 44, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_17547_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 180;
	});
	stage1.AddTimeEvent(0, 12, 44, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_17684_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		12,
		45,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		46,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 12,
			spacing: 90,
			offset: 45,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		47,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 14,
			spacing: 90,
			offset: 90,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		48,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 16,
			spacing: 90,
			offset: 135,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
				canFreeze: false,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		49,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 20,
			spacing: 90,
			offset: 180,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		50,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 22,
			spacing: 90,
			offset: 225,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		45,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		46,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 90,
			offset: 45,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		47,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 12,
			spacing: 90,
			offset: 90,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		48,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 14,
			spacing: 90,
			offset: 135,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		49,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 16,
			spacing: 90,
			offset: 180,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		12,
		50,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 18,
			spacing: 90,
			offset: 225,
			spawnOverride: {
				lifeTime: 1200,
				ATK: 7,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		13,
		0,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "KromieKing", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(
		0,
		13,
		30,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "RatHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 40,
		}
	);
	stage1.AddTimeEvent(
		0,
		13,
		32,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "RatHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 40,
		}
	);
	stage1.AddTimeEvent(
		0,
		13,
		34,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "RatHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 40,
		}
	);
	stage1.AddTimeEvent(
		0,
		13,
		36,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "RatHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 40,
		}
	);
	stage1.AddTimeEvent(
		0,
		13,
		38,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "RatHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 40,
		}
	);
	stage1.AddTimeEvent(
		0,
		13,
		40,
		"EventSpawnHorde",
		EventSpawnHorde,
		{
			id: "RatHorde",
			level: "1",
			dir: ParseSpawnDirection(irandom(360), "random"),
			amount: 40,
		}
	);
	stage1.AddTimeEvent(0, 14, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_23226_gml_Object_obj_StageManager_Other_11
		enemy_limit = 150;
		spawn_rate = 75;
		spawn_amount = 10;
		current_spawn_pattern = "horizontalSurround";
		remove_mob_choice("Rats");
		remove_mob_choice("Kromies");
		add_mob_choice("ShrimpGang", 1, 1, {dir: 0, pattern: "directionalSurround"});
		add_mob_choice(
			"DeadbeatGang",
			1,
			1,
			{dir: 180, pattern: "directionalSurround"}
		);
	});
	stage1.AddTimeEvent(0, 14, 19, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_23610_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(
		0,
		14,
		20,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 2,
			dir: 90,
			dirMoving: 270,
			amount: 10,
			spacing: 75,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 14, 24, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_24116_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		14,
		25,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 75,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 14, 29, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_24619_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		14,
		30,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 2,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 75,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 14, 29, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_25126_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(
		0,
		14,
		30,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 90,
			dirMoving: 270,
			amount: 10,
			spacing: 75,
			offset: 37,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 14, 34, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_25642_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 180;
	});
	stage1.AddTimeEvent(
		0,
		14,
		35,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 12,
			spacing: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		36,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 12,
			spacing: 80,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		37,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 12,
			spacing: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		38,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 12,
			spacing: 80,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		39,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 12,
			spacing: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 14, 34, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_27660_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(
		0,
		14,
		35,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		36,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 80,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		37,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		38,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 80,
			offset: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		39,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(0, 14, 44, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_29648_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(0, 14, 44, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_29783_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(0, 14, 44, "AlertC", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_29919_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 180;
	});
	stage1.AddTimeEvent(0, 14, 44, "AlertD", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_30056_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		14,
		45,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 0,
			dirMoving: 180,
			amount: 4,
			spacing: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		45,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "ShrimpGang",
			level: "1",
			speed: 2,
			dir: 180,
			dirMoving: 0,
			amount: 4,
			spacing: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sShrimpGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		45,
		"EventSpawnDirectionLockedC",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 1.6,
			dir: 90,
			dirMoving: 270,
			amount: 4,
			spacing: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		14,
		45,
		"EventSpawnDirectionLockedD",
		EventSpawnDirectionLocked,
		{
			id: "DeadbeatGang",
			level: "1",
			speed: 1.6,
			dir: 270,
			dirMoving: 90,
			amount: 4,
			spacing: 40,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 2000,
				lockFacing: false,
				sprite_index: sDeadbeatGangShield,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		15,
		0,
		"EventSpawnDirectionA",
		EventSpawnDirection,
		{id: "ShrimpGangMiniBoss", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(
		0,
		15,
		0,
		"EventSpawnDirectionB",
		EventSpawnDirection,
		{id: "DeadbeatGangMiniBoss", dir: "random", amount: 1}
	);
	stage1.AddTimeEvent(
		0,
		15,
		30,
		"GoldenYagoo",
		EventSpawnDirection,
		{id: "GoldenYagoo", level: "1", amount: 1, dir: "evenSurround", chance: 20}
	);
	stage1.AddTimeEvent(0, 15, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_32121_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 100;
		spawn_amount = 7;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 15, 45, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_32290_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 120;
		spawn_amount = 9;
		current_spawn_pattern = "evenSurround";
		remove_mob_choice("ShrimpGang");
		remove_mob_choice("DeadbeatGang");
		add_mob_choice("Saplings", 4, 1);
		add_mob_choice("Hoomans", 1, 1);
	});
	stage1.AddTimeEvent(0, 16, 14, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_32584_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(0, 16, 14, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_32719_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(0, 16, 14, "AlertC", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_32855_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 180;
	});
	stage1.AddTimeEvent(0, 16, 14, "AlertD", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_32992_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		16,
		15,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 0.2666,
			dir: 0,
			dirMoving: 180,
			amount: 25,
			spacing: 33,
			spawnOverride: {lifeTime: 800, expvalue: 10, HP: 1500, knockbackImmune: true},
		}
	);
	stage1.AddTimeEvent(
		0,
		16,
		15,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 0.15,
			dir: 90,
			dirMoving: 270,
			amount: 25,
			spacing: 33,
			spawnOverride: {lifeTime: 800, expvalue: 10, HP: 1500, knockbackImmune: true},
		}
	);
	stage1.AddTimeEvent(
		0,
		16,
		15,
		"EventSpawnDirectionLockedC",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 0.2666,
			dir: 180,
			dirMoving: 0,
			amount: 25,
			spacing: 33,
			spawnOverride: {lifeTime: 800, expvalue: 10, HP: 1500, knockbackImmune: true},
		}
	);
	stage1.AddTimeEvent(
		0,
		16,
		15,
		"EventSpawnDirectionLockedD",
		EventSpawnDirectionLocked,
		{
			id: "Kromies",
			level: "1",
			speed: 0.15,
			dir: 270,
			dirMoving: 90,
			amount: 25,
			spacing: 33,
			spawnOverride: {lifeTime: 800, expvalue: 10, HP: 1500, knockbackImmune: true},
		}
	);
	stage1.AddTimeEvent(0, 16, 59, "AlertA", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_34341_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 0;
	});
	stage1.AddTimeEvent(0, 16, 59, "AlertB", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_34476_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 90;
	});
	stage1.AddTimeEvent(0, 16, 59, "AlertC", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_34612_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 180;
	});
	stage1.AddTimeEvent(0, 16, 59, "AlertD", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_34749_gml_Object_obj_StageManager_Other_11
		alert = instance_create_depth(x, y, depth, obj_caution);
		alert.dir = 270;
	});
	stage1.AddTimeEvent(
		0,
		17,
		0,
		"EventSpawnDirectionLocked",
		EventSpawnDirectionLocked,
		{
			id: "Hoomans",
			level: "1",
			speed: 2,
			dir: 90,
			dirMoving: 270,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 5000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		17,
		0,
		"EventSpawnDirectionLockedA",
		EventSpawnDirectionLocked,
		{
			id: "Hoomans",
			level: "1",
			speed: 3.5555555554,
			dir: 180,
			dirMoving: 0,
			amount: 10,
			spacing: 90,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 5000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		17,
		0,
		"EventSpawnDirectionLockedB",
		EventSpawnDirectionLocked,
		{
			id: "Hoomans",
			level: "1",
			speed: 2,
			dir: 270,
			dirMoving: 90,
			amount: 10,
			spacing: 90,
			offset: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 5000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		17,
		0,
		"EventSpawnDirectionLockedC",
		EventSpawnDirectionLocked,
		{
			id: "Hoomans",
			level: "1",
			speed: 3.5555555554,
			dir: 0,
			dirMoving: 180,
			amount: 10,
			spacing: 90,
			offset: 80,
			spawnOverride: {
				lifeTime: 1200,
				expvalue: 10,
				HP: 5000,
				lockFacing: false,
				knockbackImmune: true,
			},
		}
	);
	stage1.AddTimeEvent(
		0,
		17,
		30,
		"EventSpawnDirection",
		EventSpawnDirection,
		{id: "SaplingMiniBoss", dir: "random", amount: 1}
	);
	//if (ds_map_find_value(global.PlayerSave, "stamps") > 0) {
		//stage1.AddTimeEvent(
			//0,
			//18,
			//0,
			//"SilverYagoo",
			//EventSpawnDirection,
			//{id: "SilverYagoo", level: "1", amount: 1, dir: "evenSurround", chance: 30}
		//);
	//}
	stage1.AddTimeEvent(0, 18, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_36576_gml_Object_obj_StageManager_Other_11
		enemy_limit = 200;
		spawn_rate = 150;
		spawn_amount = 10;
		current_spawn_pattern = "evenSurround";
		remove_mob_choice("Rats");
		add_mob_choice("Sanalites", 2, 1);
	});
	stage1.AddTimeEvent(0, 19, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_36807_gml_Object_obj_StageManager_Other_11
		enemy_limit = 200;
		spawn_rate = 80;
		spawn_amount = 8;
		current_spawn_pattern = "evenSurround";
		remove_mob_choice("Sanalites");
		remove_mob_choice("Saplings");
		remove_mob_choice("Hoomans");
		add_mob_choice("Kromies", 5, 2);
		add_mob_choice("Saplings", 5, 2);
	});
	stage1.AddTimeEvent(0, 20, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_37134_gml_Object_obj_StageManager_Other_11
		enemy_limit = 200;
		spawn_rate = 80;
		spawn_amount = 5;
		current_spawn_pattern = "evenSurround";
		remove_mob_choice("Deadbeat");
		remove_mob_choice("Takodachi");
		remove_mob_choice("BigBubba");
		remove_mob_choice("Shrimp");
		remove_mob_choice("KFP");
		remove_mob_choice("AngelFairy");
		remove_mob_choice("DevilFairy");
		remove_mob_choice("Kromies");
		remove_mob_choice("Saplings");
		remove_mob_choice("Hoomans");
		add_mob_choice("BigBubba", 1, 2);
		with (obj_Enemy) {
			if ((!isBoss) && isEnemy) {
				stage1.Die(true);
			}
		}
	});
	stage1.AddTimeEvent(
		0,
		20,
		0,
		"EventSpawnDirectionA",
		EventSpawnDirection,
		{id: "SmollAme", level: "1", amount: 1, dir: "evenSurround"}
	);
	stage1.AddTimeEvent(0, 21, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_37862_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 70;
		spawn_amount = 7;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 22, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_38029_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 8;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 23, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_38196_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		current_spawn_pattern = "evenSurround";
		add_mob_choice("ShrimpGang", 1, 2);
		add_mob_choice("DeadbeatGang", 1, 2);
		add_mob_choice("Takodachi", 1, 3);
		add_mob_choice("KFP", 1, 3);
		add_mob_choice("BigBubba", 1, 3);
		add_mob_choice("AngelFairy", 1, 2);
		add_mob_choice("DevilFairy", 1, 2);
		add_mob_choice("Rats", 1, 3);
		add_mob_choice("Kromies", 1, 3);
		add_mob_choice("Hoomans", 1, 2);
		add_mob_choice("Saplings", 1, 3);
		add_mob_choice("Sanalites", 1, 2);
	});
	stage1.AddTimeEvent(0, 24, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_38772_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 25, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_38939_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 26, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_39106_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 60;
		spawn_amount = 5;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 27, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_39273_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 55;
		spawn_amount = 6;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 28, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_39440_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 50;
		spawn_amount = 6;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 29, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_39607_gml_Object_obj_StageManager_Other_11
		enemy_limit = 300;
		spawn_rate = 45;
		spawn_amount = 5;
		current_spawn_pattern = "evenSurround";
	});
	stage1.AddTimeEvent(0, 30, 0, "Changespawn_rate", function() {
		//gml_Script_anon_gml_Object_obj_StageManager_Other_11_39774_gml_Object_obj_StageManager_Other_11
		enemy_limit = 200;
		spawn_rate = 60;
		spawn_amount = 5;
		with (obj_Enemy) {
			if ((!isBoss) && isEnemy) {
				stage1.Die(true);
			}
		}
		current_spawn_pattern = "evenSurround";
		remove_mob_choice("DeadbeatGang");
		remove_mob_choice("Takodachi");
		remove_mob_choice("BigBubba");
		remove_mob_choice("ShrimpGang");
		remove_mob_choice("KFP");
		remove_mob_choice("AngelFairy");
		remove_mob_choice("DevilFairy");
		remove_mob_choice("Kromies");
		remove_mob_choice("Saplings");
		remove_mob_choice("Sanalites");
		remove_mob_choice("Hoomans");
		remove_mob_choice("Rats");
		add_mob_choice("Yagoos", 1, 1);
	});
}
