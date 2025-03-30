x = lerp(x, floor(oPlayer.x), 0.1);
y = lerp(y, floor(oPlayer.y), 0.1);
if (distance_to_object(oPlayer) > 200) {
	x = oPlayer.x + xoffset;
	y = oPlayer.y + yoffset;
}

var px = oPlayer.x; 
var py = oPlayer.y;
xoffset = x - px;
yoffset = y - py;
