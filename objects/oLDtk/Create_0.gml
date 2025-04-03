
/// @desc Configs

// REMEMBER TO TURN ON "disable file system sandbox" WHEN USING LIVE UPDATING
// ...and to set this macro to 0 when building the game!
#macro LDTK_LIVEO 1
LDTK_LIVE = os_type != os_android ? 1 : 0


if (LDTK_LIVE) {
	// live reload config
	LDtkConfig({
		// change this to your project directory
		file: "/home/airgeadlamh/GameMakerProjects/LDTK/cure.ldtk",
		level_name: "Stage1"
	})
}
else {
	// release config
	LDtkConfig({
		file: "stages.ldtk",
		level_name: "Stage1"
	})
}



LDtkMappings({
	layers: {
		Tiles: "PlaceholderTiles", // now "Tiles" layer in LDtk = "PlaceholderTiles" layer in GM
	},
	enums: {
		TestEnum: {
			//First: "First", // first is undefined, should just return the name
			Second: "This is second",
			Third: 3
		}
	},
	tilesets: {
		PlaceholderTiles: "tTiles"
	}
})