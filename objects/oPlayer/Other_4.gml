//light1 = new BulbLight(oLightController.renderer, sLight, 0, x, y);
//light1.xscale = 0.25;
//light1.yscale = 0.25;
light = new BulbLight(oLightController.renderer, sLight, 0, x, y);
//Create a new occluder that the player will use to block light
//occluder = new BulbDynamicOccluder(oLightController.renderer);
//
////Move the occluder on top of the player
//occluder.x = x;
//occluder.y = y;
//
////Define a simple rectangular occluder that fits the bounding box of the player's sprite
////Note that edge coordinates are relative to the occluder's x/y position
////N.B. Don't forget to give objPlayer a sprite otherwise this code won't work!
//occluder.AddEdge(bbox_left  - x, bbox_top    - y, bbox_right - x, bbox_top    - y);
//occluder.AddEdge(bbox_right - x, bbox_top    - y, bbox_right - x, bbox_bottom - y);
//occluder.AddEdge(bbox_right - x, bbox_bottom - y, bbox_left  - x, bbox_bottom - y);
//occluder.AddEdge(bbox_left  - x, bbox_bottom - y, bbox_left  - x, bbox_top    - y);