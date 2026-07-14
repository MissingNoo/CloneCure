titleoffset = approach(titleoffset, 0, titlespd);
if (titleoffset == 0) {
	ui.node_visible("Retry", true);
    ui.node_visible("CharacterSelect", true);
    ui.node_visible("MainMenu", true);
    ui.node_visible("Submit", true);
    ui.node_visible("Coins", true);
    ui.node_visible("Score", true);
} else {
    ui.node_visible("Retry", false);
    ui.node_visible("CharacterSelect", false);
    ui.node_visible("MainMenu", false);
    ui.node_visible("Submit", false);
    ui.node_visible("Coins", false);
    ui.node_visible("Score", false);
}