x = (approach(x, floor(oPlayer.x), 2));
y = (approach(y, floor(oPlayer.y), 2));
//x = round(oPlayer.x);
//y = round(oPlayer.y);
if (distance_to_object(oPlayer) > 200) {
	x = oPlayer.x + xoffset;
	y = oPlayer.y + yoffset;
}

var px = oPlayer.x; 
var py = oPlayer.y;
xoffset = x - px;
yoffset = y - py;
GameData.GameSurf = surface_recreate(GameData.GameSurf, game_width, game_height);
GameData.GameSurf2 = surface_recreate(GameData.GameSurf2, game_width, game_height);
view_surface_id[1] = GameData.GameSurf2;