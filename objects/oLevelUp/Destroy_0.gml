global.events.broadcast("update_game_ui");
instance_destroy(oPlayerStatsUI);
global.events.broadcast("pause", "lvlup");
