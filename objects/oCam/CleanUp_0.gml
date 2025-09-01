/// @description Insert description here
if (surface_exists(GameData.GameSurf)) {
	surface_free(GameData.GameSurf);
	GameData.GameSurf = -1;
}
if (surface_exists(GameData.GameSurf2)) {
	surface_free(GameData.GameSurf2);
	GameData.GameSurf2 = -1;
}
