var plant = SaveData.plants[num];
draw_sprite(sprite_index, watered, x, y);
if (!is_undefined(SaveData.plants[num])) {
	draw_sprite(plant.sprite, plant.stage, x, y);
	watered = plant.watered;
}