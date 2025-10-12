global.seconds += 1 / 60;
if (global.seconds > 60) {
	global.seconds = 0;
	global.minutes++;
	global.events.broadcast("time_minute", global.minutes);
}