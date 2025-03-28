enum Flowers {
    Yellow,
    Pink,
    White
}
var obj = oPinkFlower;
switch (Flower) {
	case Flowers.Yellow:
        obj = oPinkFlower;
        break;
	case Flowers.Pink:
        obj = oPinkFlower;
        break;
	case Flowers.White:
        obj = oPinkFlower;
        break;
}
repeat (amount) {
	instance_create_depth(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), depth, obj);
}