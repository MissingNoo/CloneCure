//enum Flowers {
	//Yellow,
	//Pink,
	//White,
//}
obj = choose(oFlower4, oFlower5, oFlower1, oFlower2, oFlower3);
repeat (amount) {
	instance_create_depth(
		random_range(bbox_left, bbox_right),
		random_range(bbox_top, bbox_bottom),
		depth,
		obj
	);
}
