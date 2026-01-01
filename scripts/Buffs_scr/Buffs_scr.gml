GameData ??= {};
GameData.buffs = {};
#macro Buffs GameData.buffs

function apply_buff(instance, name) {
	var _b = undefined;
	if (instance_exists(instance)) {
		global.search = name;
		var _f = function(_element, _index)
		{
		    return (_element.name == global.search);
		}
		var pos = array_find_index(instance.buffs, _f);
		if (pos == -1) {
			var b = variable_clone(Buffs[$name]);
			b.instance = instance;
			b.draw_method = method(instance, b.draw_method);
			b.step_method = method(instance, b.step_method);
			_b = method(instance, b.on_apply);
			b.timer = AirLib.frame + b.base_time;
			array_push(instance.buffs, b);
		} else {
			var buff = instance.buffs[pos]
			buff.timer = AirLib.frame + buff.base_time;
			buff.ended = false;
			_b = method(instance, buff.on_apply);
		}
		_b();
	}
}

function Buff(_name) constructor {
	name = string_lower(_name);
	timer = 0;
	base_time = 0;
	ended = false;
	instance = noone;
	on_end = function (){};
	step_method = function (){};
	step = function (){
		if (timer > AirLib.frame) {
			step_method();
		} else if (!ended) {
			ended = true;
			if (instance_exists(instance)) {
				method(instance, on_end)();
			}
		}
	};
	draw = function (){
		if (timer > AirLib.frame) {
			draw_method();
		}
	};
	on_apply = function (){};
	draw_method = function () {};
	static set_step = function (f) {
		step_method = f;
		return self;
	}
	static set_draw = function (f) {
		draw_method = f;
		return self;
	}
	static set_apply = function (f) {
		on_apply = f;
		return self;
	}
	static set_end = function (f) {
		on_end = f;
		return self;
	}
	Buffs[$ name] = self;
}

i = new Buff("Metronome");
i.set_apply(function () {
	old_spd = speed;
	met = new animated_sprite(sMetronome);
});
i.set_end(function () {
	speed = old_spd;
});
i.set_step(function () {
	met.animate();
	speed = 0;
});
i.set_draw(function () {
	draw_sprite(sMetronome, met.get_frame(), x, y);
});