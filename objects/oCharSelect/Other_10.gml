try {
 char_draw = function (data, area, pos) {
	//draw_rectangle_area(area, true);
	//draw_text(area[0], area[1], data.name);
	var _x = area[0];
	var _y = area[1];
	var _w = area[2];
	var _h = area[3];
	draw_sprite_stretched(sCharFG, 1, pos.left, pos.top, pos.width, pos.height);
	//airui_draw_sprite_centered($"charfg{data.name}", sCharFG, pos, airui_fit.height, 2, 2, 0, 1);
	//airui_draw_sprite_centered($"charlock{data.name}", sCharLock, pos, airui_fit.height, 0.5, 1, 0);
	draw_sprite_stretched(sCharLock, 0, pos.left, pos.top, pos.width, pos.height);
	airui_draw_sprite_centered($"charpic{data.name}", GameData.characters[$ data.name].portrait, pos, airui_fit.stretch, 1, 1, 0);
	draw_sprite_stretched(sCharFG, 0, pos.left, pos.top, pos.width, pos.height);
	
	//airui_draw_sprite_centered($"charfg{data.name}", sCharFG, pos, airui_fit.height, 1, 1, 0);
}
for (var i = 0; i < 10; i++) {
	var struct = {
		name : $"char{i}",
		flex : 1,
		height : "100%",
		margin : 2,
		data : {
			name : "Amelia_Watson",
		}
	}
	var node = flexpanel_create_node(struct);
	var root = ui.get_child("chars1");
	flexpanel_node_insert_child(root, node, flexpanel_node_get_num_children(root));
	ui.add_draw($"char{i}", 
		AirUIFunctionStart
		char_draw(data, area, pos);
		AirUIFunctionEnd
	);
}
for (var i = 0; i < 10; i++) {
	var struct = {
		name : $"char{i}",
		flex : 1,
		height : "100%",
		margin : 2,
		data : {
			name : "Tenma_Maemi",
		}
	}
	var node = flexpanel_create_node(struct);
	var root = ui.get_child("chars2");
	flexpanel_node_insert_child(root, node, flexpanel_node_get_num_children(root));
	ui.add_draw($"char{i}", 
		AirUIFunctionStart
		char_draw(data, area, pos);
		AirUIFunctionEnd
	);
}
ui.add_draw("char_list_1_panel", 
		AirUIFunctionStart
		
		AirUIFunctionEnd
	);

ui.recalculate();
ui.finish();
		
}
catch (error) {
	show_debug_message(error)	
}