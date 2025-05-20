array_foreach(AirLib.lerpers, function  (e, i) {
    e.tick();
});
if (GameData.is_paused) exit;
AirLib.frame++;