/// @param {string} _id
/// @param {string} _cmd
/// @desc Исполняет команду от GMSync Bridge и возвращает строку-результат.
function __gmsync_exec(_id, _cmd) {
    var _parts = string_split(_cmd, " ");
    var _n     = array_length(_parts);
    if (_n == 0) return "error:empty";
    var _verb  = _parts[0];

    try {
        if (_verb == "ping") return "pong";

        if (_verb == "var_global_get") {
            if (_n < 2) return "error:missing name";
            return string(variable_global_get(_parts[1]));
        }

        if (_verb == "var_global_set") {
            if (_n < 3) return "error:missing args";
            variable_global_set(_parts[1], real(_parts[2]));
            return "ok";
        }

        if (_verb == "var_instance_get") {
            if (_n < 3) return "error:missing args";
            var _inst = real(_parts[1]);
            if (!instance_exists(_inst)) return "error:instance not found";
            return string(variable_instance_get(_inst, _parts[2]));
        }

        if (_verb == "var_instance_set") {
            if (_n < 4) return "error:missing args";
            var _inst = real(_parts[1]);
            if (!instance_exists(_inst)) return "error:instance not found";
            var _iname = _parts[2];
            var _ival  = _parts[3];
            if (string(real(_ival)) == _ival) {
                variable_instance_set(_inst, _iname, real(_ival));
            } else {
                variable_instance_set(_inst, _iname, _ival);
            }
            // Обновляем HUD
            if (variable_global_exists("__gsb_hud_vars") && ds_exists(global.__gsb_hud_vars, ds_type_list)) {
                var _hentry = string(_inst) + "." + _iname + " = " + _ival;
                for (var _hi = ds_list_size(global.__gsb_hud_vars) - 1; _hi >= 0; _hi--) {
                    if (string_starts_with(ds_list_find_value(global.__gsb_hud_vars, _hi), string(_inst) + "." + _iname + " ")) {
                        ds_list_delete(global.__gsb_hud_vars, _hi);
                        break;
                    }
                }
                ds_list_add(global.__gsb_hud_vars, _hentry);
                if (ds_list_size(global.__gsb_hud_vars) > 8) {
                    ds_list_delete(global.__gsb_hud_vars, 0);
                }
                global.__gsb_hud_visible   = true;
                global.__gsb_hud_auto_hide = current_time + 5000;
            }
            return "ok:" + string(_inst) + "." + _iname + " = " + _ival;
        }

        if (_verb == "instance_create") {
            if (_n < 5) return "error:missing args";
            var _obj = asset_get_index(_parts[1]);
            if (_obj < 0) return "error:unknown object " + _parts[1];
            var _inst = instance_create_layer(real(_parts[2]), real(_parts[3]), _parts[4], _obj);
            return string(_inst);
        }

        if (_verb == "instance_destroy") {
            if (_n < 2) return "error:missing id";
            var _inst = real(_parts[1]);
            if (!instance_exists(_inst)) return "error:instance not found";
            with (_inst) instance_destroy();
            return "ok";
        }

        if (_verb == "instance_count") {
            if (_n < 2) return "error:missing obj";
            var _obj = asset_get_index(_parts[1]);
            if (_obj < 0) return "error:unknown object";
            return string(instance_number(_obj));
        }

        if (_verb == "goto_room") {
            if (_n < 2) return "error:missing room";
            var _r = asset_get_index(_parts[1]);
            if (_r < 0) return "error:unknown room " + _parts[1];
            room_goto(_r);
            return "ok";
        }

        if (_verb == "room_info") {
            return room_get_name(room) + "|" + string(room_width) + "x" + string(room_height);
        }

        if (_verb == "get_fps") {
            return string(fps) + "|" + string(fps_real);
        }

        if (_verb == "audio_play") {
            if (_n < 2) return "error:missing sound";
            var _snd = asset_get_index(_parts[1]);
            if (_snd < 0) return "error:unknown sound " + _parts[1];
            audio_play_sound(_snd, 1, false);
            return "ok";
        }

        if (_verb == "audio_stop_all") {
            audio_stop_all();
            return "ok";
        }

        if (_verb == "game_restart") {
            game_restart();
            return "ok";
        }

        if (_verb == "game_end") {
            game_end();
            return "ok";
        }

        // gml_eval — вычисление GML-выражений в рантайме
        // GMS2 не поддерживает execute_string() в 2.3+, поэтому реализованы
        // конкретные паттерны: global.var, встроенные геттеры, basic assigns.
        if (_verb == "gml_eval") {
            if (_n < 2) return "error:usage: gml_eval <expression>";
            // Склеиваем оставшиеся части обратно в выражение
            var _expr = "";
            for (var _ei = 1; _ei < _n; _ei++) {
                if (_ei > 1) _expr += " ";
                _expr += _parts[_ei];
            }
            // ── Встроенные геттеры ───────────────────────────────────────
            if (_expr == "room")         return room_get_name(room);
            if (_expr == "fps")          return string(fps);
            if (_expr == "fps_real")     return string(fps_real);
            if (_expr == "room_width")   return string(room_width);
            if (_expr == "room_height")  return string(room_height);
            if (_expr == "current_time") return string(current_time);
            if (_expr == "game_id")      return string(game_id);
            if (_expr == "os_type")      return string(os_type);
            if (_expr == "instance_count_all") return string(instance_count);
            // ── global.varname  /  global.varname=value ──────────────────
            if (string_starts_with(_expr, "global.")) {
                var _grest = string_delete(_expr, 1, 7);  // убираем "global."
                var _geq   = string_pos("=", _grest);
                if (_geq > 0) {
                    // ЗАПИСЬ: global.name=value  (без пробелов вокруг =)
                    var _gname = string_copy(_grest, 1, _geq - 1);
                    var _gval  = string_delete(_grest, 1, _geq);
                    if (!variable_global_exists(_gname)) return "error:global not found: " + _gname;
                    // Пробуем как число, иначе как строку
                    if (string(real(_gval)) == _gval) {
                        variable_global_set(_gname, real(_gval));
                    } else {
                        variable_global_set(_gname, _gval);
                    }
                    // Обновляем HUD с новым значением
                    if (variable_global_exists("__gsb_hud_vars") && ds_exists(global.__gsb_hud_vars, ds_type_list)) {
                        var _entry = "global." + _gname + " = " + _gval;
                        for (var _hi = ds_list_size(global.__gsb_hud_vars) - 1; _hi >= 0; _hi--) {
                            if (string_starts_with(ds_list_find_value(global.__gsb_hud_vars, _hi), "global." + _gname + " ")) {
                                ds_list_delete(global.__gsb_hud_vars, _hi);
                                break;
                            }
                        }
                        ds_list_add(global.__gsb_hud_vars, _entry);
                        if (ds_list_size(global.__gsb_hud_vars) > 8) {
                            ds_list_delete(global.__gsb_hud_vars, 0);
                        }
                        // Показываем HUD на 5 секунд
                        global.__gsb_hud_visible   = true;
                        global.__gsb_hud_auto_hide = current_time + 5000;
                    }
                    return "ok:global." + _gname + " = " + _gval;
                } else {
                    // ЧТЕНИЕ: global.name
                    if (!variable_global_exists(_grest)) return "error:global not found: " + _grest;
                    return string(variable_global_get(_grest));
                }
            }
            // ── self.varname (bridge-объект) ─────────────────────────────
            if (string_starts_with(_expr, "self.")) {
                var _sname = string_delete(_expr, 1, 5);
                if (!variable_instance_exists(id, _sname)) return "error:self var not found: " + _sname;
                return string(variable_instance_get(id, _sname));
            }
            return "error:unsupported expr '" + _expr + "'. Supported: global.x, global.x=v, fps, room, room_width, room_height, current_time, game_id, os_type, instance_count_all, self.x";
        }

        // list_globals — все объявленные global-переменные в рантайме
        // Возвращает строку "var1,var2,var3" (через запятую)
        if (_verb == "list_globals") {
            var _gnames = variable_struct_get_names(global);
            var _gcount = array_length(_gnames);
            if (_gcount == 0) return "";
            var _gres = "";
            for (var _gi = 0; _gi < _gcount; _gi++) {
                if (_gi > 0) _gres += ",";
                _gres += _gnames[_gi];
            }
            return _gres;
        }

        // room_objects — объекты в текущей комнате с количеством инстансов
        // Возвращает строку "objName:count,objName2:count2"
        if (_verb == "room_objects") {
            var _rtotal = instance_count;
            if (_rtotal == 0) return "";
            var _rmap = ds_map_create();
            for (var _ri = 0; _ri < _rtotal; _ri++) {
                var _rinst = instance_find(all, _ri);
                if (!instance_exists(_rinst)) continue;
                var _roname = object_get_name(_rinst.object_index);
                _rmap[? _roname] = (ds_map_exists(_rmap, _roname) ? _rmap[? _roname] : 0) + 1;
            }
            var _rres = "";
            var _rk = ds_map_find_first(_rmap);
            while (_rk != undefined) {
                if (string_length(_rres) > 0) _rres += ",";
                _rres += _rk + ":" + string(_rmap[? _rk]);
                _rk = ds_map_find_next(_rmap, _rk);
            }
            ds_map_destroy(_rmap);
            return _rres;
        }

        if (_verb == "list_instances") {
            if (_n < 2) return "error:missing obj";
            var _obj = asset_get_index(_parts[1]);
            if (_obj < 0) return "error:unknown object " + _parts[1];
            var _cnt = instance_number(_obj);
            if (_cnt == 0) return "";
            var _res = "";
            for (var _ii = 0; _ii < _cnt; _ii++) {
                var _inst = instance_find(_obj, _ii);
                if (!instance_exists(_inst)) continue;
                if (string_length(_res) > 0) _res += ",";
                _res += string(real(_inst));
            }
            return _res;
        }

        if (_verb == "var_instance_list") {
            if (_n < 2) return "error:missing id";
            var _inst = real(_parts[1]);
            if (!instance_exists(_inst)) return "error:instance not found";
            var _vnames = variable_instance_get_names(_inst);
            var _vcount = array_length(_vnames);
            if (_vcount == 0) return "";
            var _vres = "";
            for (var _vi = 0; _vi < _vcount; _vi++) {
                if (_vi > 0) _vres += ",";
                _vres += _vnames[_vi];
            }
            return _vres;
        }

        if (_verb == "hud_toggle") {
            if (!variable_global_exists("__gsb_hud_visible")) return "error:hud not initialized";
            global.__gsb_hud_visible   = !global.__gsb_hud_visible;
            global.__gsb_hud_auto_hide = -1;  // при ручном тогле отключаем авто-скрытие
            return global.__gsb_hud_visible ? "hud:on (permanent)" : "hud:off";
        }

        if (_verb == "hud_clear") {
            if (!variable_global_exists("__gsb_hud_vars") || !ds_exists(global.__gsb_hud_vars, ds_type_list)) return "error:hud not initialized";
            ds_list_clear(global.__gsb_hud_vars);
            return "ok";
        }

        return "error:unknown command " + _verb;

    } catch (_e) {
        return "error:" + string(_e.message);
    }
}
