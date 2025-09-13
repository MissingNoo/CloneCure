GenerateDirections = function() {
	if ((slices % 4) != 0) {
		slices -= slices % 4;
	}
	quadrantSize = slices / 4;
	center = 360 / slices / 2;
	sliceSize = 360 / slices;
	directions = [];
	directionsContainer = [];
	if (global.topBorder != -1 && global.bottomBorder != -1) {
		topBorder = global.topBorder;
		stageHeight = global.bottomBorder - global.topBorder;
		verticalSliceHeight = stageHeight / (slices / 2);
	} else {
		topBorder = NaN;
		stageHeight = NaN;
		verticalSliceHeight = NaN;
	}
	for (var i = 0; i < slices; i++) {
		if ((i % quadrantSize) == 0) {
			array_push(directions, []);
			array_push(directionsContainer, []);
		}
		array_push(directions[floor(i / quadrantSize)], (center + i * sliceSize));
		array_push(
			directionsContainer[floor(i / quadrantSize)],
			(center + i * sliceSize)
		);
	}
	selectableQuadrants = [0, 1, 2, 3];
	selectableQuadrantsContainer = [0, 1, 2, 3];
}

GenerateDirections();

//function SpawnEnemyFromChoices(argument0) {
//if (argument0 == undefined) {
//argument0 = false;
//}
//if (argument0 || enemy_amount < enemy_limit) {
//var keys = variable_struct_get_names(mobSpawnChoices);
//if (array_length(keys) == 0) {
//return false;
//}
//var range = [];
//var start = 0;
//var endR = 0;
//for (i = 0; i < array_length(keys); i++) {
//var mobSpawnChoice = variable_struct_get(mobSpawnChoices, keys[i]);
//endR = mobSpawnChoice.weight + start;
//array_push(range, [start, endR, keys[i]]);
//start = endR;
//}
//var roll = irandom(endR - 1);
//var choice = "broken";
//var level = 1;
//for (i = 0; i < array_length(range); i++) {
//start = range[i][0];
//endR = range[i][1];
//if (roll >= start && roll < endR) {
//choice = range[i][2];
//level = variable_struct_get(mobSpawnChoices, range[i][2]).level;
//}
//}
//var mobWeightData = variable_struct_get(mobSpawnChoices, choice);
//var pos = {};
//var dir = GrabDirection();
//if (instance_exists(oPlayer)) {
//pos.x =
//oPlayer.x
//+ lengthdir_x((camera_get_view_width(view_camera[0]) / 1.5), dir);
//pos.y =
//oPlayer.y
//+ lengthdir_y((camera_get_view_height(view_camera[0]) / 1.5), dir);
//if (string_count("stage2_", currentSpawnPattern) > 0) {
//pos = self._Stage2GetPosition(dir);
//}
//choice.choice.SpawnMob(pos, level, obj_MobManager);
//}
//}
//}

function ParseSpawnDirection_gml_Object_obj_StageManager_Other_10(dir) {
	switch (currentSpawnPattern) {
		default:
		case "evenSurround":
			return dir;
		//case "horizontalSurround":
		//if (
		//(argument0 >= obj_EXPAbsorb && argument0 <= obj_holoHouseNPC)
		//|| (argument0 >= obj_ShionPortal && argument0 <= obj_Kotatsu)
		//) {
		//argument0 += 90;
		//return argument0;
		//} else {
		//argument0 = argument0;
		//return argument0;
		//}
		//case "verticalSurround":
		//if (
		//(argument0 >= obj_holoHouseNPC && argument0 <= obj_CastleBookshelfB)
		//|| (argument0 >= obj_Rock3 && argument0 <= obj_ShionPortal)
		//|| (argument0 >= obj_Kotatsu && argument0 <= obj_EXPAbsorb)
		//) {
		//argument0 += 90;
		//return argument0;
		//} else {
		//argument0 = argument0;
		//return argument0;
		//}
		//case "directionalSurround":
		//var targetDir = argument2;
		//argument0 = targetDir - 45 + round(argument0 / 4);
		//return argument0;
		//case "stage2_evenSurround":
		//argument0 = argument0;
		//return argument0;
		//case "stage2_leftSurround":
		//argument0 /= 2;
		//return argument0;
		//case "stage2_rightSurround":
		//argument0 = argument0 / 2 + 180;
		//return argument0;
		case "random":
			dir = irandom(360);
			return dir;
	}
}

//function _Stage2GetPosition_gml_Object_obj_StageManager_Other_10(argument0) {
//gml_Script__Stage2GetPosition_gml_Object_obj_StageManager_Other_10
//pos = {};
//var side = 0;
//argument0 = floor(argument0 / sliceSize);
//if (argument0 > floor(slices / 2)) {
//side = 1;
//argument0 -= floor(slices / 2);
//}
//var yOffset = floor(argument0 * verticalSliceHeight);
//pos.y = topBorder + yOffset;
//pos.x =
//camera_get_view_x(view_camera[0])
//- 64
//+ side * (camera_get_view_width(view_camera[0]) + 64);
//return pos;
//}
//
//function ChangeSpawnPattern_gml_Object_obj_StageManager_Other_10(argument0) {
////gml_Script_ChangeSpawnPattern_gml_Object_obj_StageManager_Other_10
//_id = argument0.id;
//dir = variable_struct_exists(argument0, "dir") ? argument0.dir : 0;
//if (variable_struct_exists(spawnPatterns, _id)) {
//currentSpawnPattern = _id;
//currentSpawnDirection = dir;
//return true;
//} else {
//return "No pattern named " + id + " exists in spawnPatterns.";
//}
//}
//
//function AddMobChoice_gml_Object_obj_StageManager_Other_10(
//argument0,
//argument1,
//argument2,
//argument3
//) {
////gml_Script_AddMobChoice_gml_Object_obj_StageManager_Other_10
//if (argument1 == undefined) {
//argument1 = 1;
//}
//if (argument2 == undefined) {
//argument2 = 1;
//}
//if (argument3 == undefined) {
//argument3 = false;
//}
//if (ds_map_exists(obj_MobManager.Mobs, argument0)) {
//variable_struct_set(
//mobSpawnChoices,
//argument0,
//{weight: argument1, level: argument2, spawnDirection: argument3}
//);
//show_debug_message(
//argument0
//+ " LVL "
//+ string(argument2)
//+ " has been added to choice pool with weight "
//+ string(argument1)
//);
//return true;
//} else {
//return "No mob named " + string(argument0) + " exists in obj_MobManager.Mobs";
//}
//}
//
//function RemoveMobChoice_gml_Object_obj_StageManager_Other_10(argument0) {
////gml_Script_RemoveMobChoice_gml_Object_obj_StageManager_Other_10
//if (variable_struct_exists(mobSpawnChoices, argument0)) {
//variable_struct_remove(mobSpawnChoices, argument0);
//}
//}

//function AddTimeEvent_gml_Object_obj_StageManager_Other_10(
//argument0,
//argument1,
//argument2,
//argument3,
//argument4,
//argument5
//) {
////gml_Script_AddTimeEvent_gml_Object_obj_StageManager_Other_10
//if (argument5 == undefined) {
//argument5 = {};
//}
//if (argument1 < 0 || argument1 > 59 || argument2 < 0 || argument2 > 59) {
//return "Invalid time inputted.";
//}
//if (!variable_struct_exists(timelineCommands, argument0)) {
//variable_struct_set(timelineCommands, argument0, {});
//}
//var timelineHour = variable_struct_get(timelineCommands, argument0);
//if (!variable_struct_exists(timelineHour, argument1)) {
//variable_struct_set(timelineHour, argument1, {});
//}
//var timelineMinute = variable_struct_get(timelineHour, argument1);
//if (!variable_struct_exists(timelineMinute, argument2)) {
//variable_struct_set(timelineMinute, argument2, {});
//}
//var timelineSecond = variable_struct_get(timelineMinute, argument2);
//variable_struct_set(
//timelineSecond,
//argument3,
//{Script: argument4, config: argument5}
//);
//}

//function RemoveTimeEvent_gml_Object_obj_StageManager_Other_10(
//argument0,
//argument1,
//argument2,
//argument3
//) {
//gml_Script_RemoveTimeEvent_gml_Object_obj_StageManager_Other_10
//if (argument3 == undefined) {
//argument3 = false;
//}
//if (argument1 < 0 || argument1 > 59 || argument2 < 0 || argument2 > 59) {
//return "Invalid time inputted.";
//}
//if (!variable_struct_exists(timelineCommands, argument0)) {
//return "No event with specified hour/min/second/name.";
//}
//timelineHour = variable_struct_get(timelineCommands, argument0);
//if (!variable_struct_exists(timelineHour, argument1)) {
//return "No event with specified hour/min/second/name.";
//}
//timelineMinute = variable_struct_get(timelineHour, argument1);
//if (!variable_struct_exists(timelineSecond, argument2)) {
//return "No event with specified hour/min/second/name.";
//}
//timelineSecond = variable_struct_get(timelineMinute, argument2);
//if (argument3) {
//variable_struct_remove(timelineSecond, argument3);
//} else {
//variable_struct_remove(timelineMinute, argument2);
//}
//}

//function CheckTimeForEvent_gml_Object_obj_StageManager_Other_10(
//argument0,
//argument1,
//argument2
//) {
//gml_Script_CheckTimeForEvent_gml_Object_obj_StageManager_Other_10
//if (argument1 < 0 || argument1 > 59 || argument2 < 0 || argument2 > 59) {
//return "Invalid time inputted.";
//}
//if (!variable_struct_exists(timelineCommands, argument0)) {
//return "No event with specified hour/min/second/name.";
//}
//timelineHour = variable_struct_get(timelineCommands, argument0);
//if (!variable_struct_exists(timelineHour, argument1)) {
//return "No event with specified hour/min/second/name.";
//}
//timelineMinute = variable_struct_get(timelineHour, argument1);
//if (!variable_struct_exists(timelineMinute, argument2)) {
//return "No event with specified hour/min/second/name.";
//}
//timelineSecond = variable_struct_get(timelineMinute, argument2);
//keys = variable_struct_get_names(timelineSecond);
//for (i = 0; i < array_length(keys); i++) {
//Script = variable_struct_get(timelineSecond, keys[i]).Script;
//var args = variable_struct_get(timelineSecond, keys[i]).config;
//self.Script(args);
//}
//} 
