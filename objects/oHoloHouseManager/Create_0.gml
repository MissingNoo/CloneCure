rdata = json_load("rooms/rm_HoloHouse_Entrance.json");
missing = [];
spawn_object = function (data) {
	var objs = {
		"obj_invisiWall": oInvisiWall,
		"obj_LiveTree": oTree,
		"obj_DeadTree": oDeadTree,
		"obj_Fence1": oFence1,
		"obj_Fence2": oFence2,
		"obj_Fence3": oFence3,
		"obj_plantSpot": oSoil,
		"obj_Bloop": oBloop,
		"obj_FishShop": oFishShop,
		"obj_Flower1": oFlower1,
		"obj_Flower2": oFlower2,
		"obj_Flower3": oFlower3,
		"obj_Flower4": oFlower4,
		"obj_Flower5": oFlower5,
		"obj_Flower6": oFlower6,
		"obj_CookingPot": oCookingPot,
		"obj_Nemu": oNemu,
		"obj_ShirakenElfriend": oElfriend,
		"obj_Pond" : oPond,
		"obj_SpawnPoint": oHouseSpawn
	}
	var obj = objs[$data.object_definition];
	if (!is_undefined(obj)) {
		instance_create_depth(data.x, data.y, -1000, obj, {image_xscale : data.scale_x, image_yscale : data.scale_y});
	} else {
		if (!array_contains(missing, data.object_definition)) {
			array_push(missing, data.object_definition);
		}
	}
}

for (var i = 0; i < array_length(rdata.game_objects); i++) {
	spawn_object(rdata.game_objects[i]);
}

array_foreach(missing, function (e, i) {
	show_debug_message($"undefined object for {e}");
})