var plant = SaveData.plants[num];
if (keyboard_check_pressed(vk_home) and place_meeting(x, y, oPlayerWorld)) {
	SaveData.plants[num] = variable_clone(GameData.crops.onion);
}
if (!is_undefined(plant)) { //TODO: put on oGame to count anywhere
	if (plant.stage < 3) {
		plant.frame++;
		if (plant.frame >= plant.next_stage_frame) {
			plant.next_stage_frame += plant.growth_frames / 4;
			plant.stage++;
		}
	}
}