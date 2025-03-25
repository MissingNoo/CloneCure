frame++;
if (is_paused) {
    exit;
}
global.seconds += 1/60;
if (global.seconds > 60) {
    global.seconds -= 60;
    global.minutes++;
}