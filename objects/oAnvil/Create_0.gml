colliding = false;
uses = 1;
if (player_have_item("Blacksmith_Gear")) {
	uses++;
}
if (instance_number(oAnvil) > 20) {
	instance_destroy();
}