if (is_undefined(ach)) {
	instance_destroy();
}
icon_x = 165;
icon_y = 40;
icon_scale = 2;
border_scale = 1.75;
text = scribble($"[c_yellow][fa_center]{ach.name}");
textscale = 0.5;
text_y = 130;
bg_scale = 2.5;
y_offset = sprite_height * bg_scale;
to_lerp = lerp(0, y_offset, 0.03);
timer = AirLib.frame + seconds_to_frames(5);
desttimer = AirLib.frame + seconds_to_frames(10);
dbg = dbg_view("ACH", true);
create_view_from_instance(self);