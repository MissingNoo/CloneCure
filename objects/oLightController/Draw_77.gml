//Update the lights and shadows on the renderer


//Apply the lighting to the application surface
//First we target the normal map surface
//surface_set_target(renderer.GetNormalMapSurface());

//Then we apply the camera. This ensure we're drawing from the same "point of view" as the
//rest of the renderer
//camera_apply(renderer.GetCamera());

//Clear off any normal map information from the previous frame
//BulbNormalMapClear();

//Set the normal mapping shader. This is required to use the `BulbNormalMapDraw*()` functions
//BulbNormalMapShaderSet();

//`BulbNormalMapDrawSelf()` can be used to easily draw normals to match basic objects
//with(oAnvil)
//{
    //BulbNormalMapDrawSelf(sAnvilNormal);
//}

//Reset the surface target and the shader, and we're done
//surface_reset_target()
//BulbNormalMapShaderReset();
renderer.Update();
BulbApplyLightingToSurface(renderer, application_surface);