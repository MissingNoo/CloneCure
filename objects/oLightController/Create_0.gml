//Instantiate and set up a renderer
renderer = new BulbRenderer(view_get_camera(0));
renderer.normalMap = true;
renderer.ambientColor = c_dkgray;
renderer.soft = true;
renderer.smooth = true;