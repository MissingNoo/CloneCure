//feather ignore GM1041
//feather ignore GM2016
ui.foreach(function(name, pos, data) {
    var spr = data[$ "image"] != undefined ? asset_get_index(data.image) : undefined;
    spr = (spr != undefined and spr != -1) ? spr : sBlank;
	var _x = pos.left, _y = pos.top, _w = pos.width, _h = pos.height;
    
    if (string_contains(name, "button")) {
        buttons[$ name].position(_x, _y, _x + _w, _y + _h);
        buttons[$ name].set_selected_area(_x - 19, _y - 5, _x + _w + 19, _y + _h + 5);
        buttons[$ name].draw(); 
    }
    
    switch(name) {
        default:
            draw_sprite_stretched(spr, 0, _x, _y, _w, _h);
	        break;
    }
});