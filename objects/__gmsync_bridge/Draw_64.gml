// __gmsync_bridge — Draw GUI Event
// GMSync Live Debug HUD — появляется на 5 сек после каждого изменения переменной
// Авто-скрытие по таймеру
if (variable_global_exists("__gsb_hud_auto_hide") && global.__gsb_hud_auto_hide > 0 && current_time >= global.__gsb_hud_auto_hide) {
    global.__gsb_hud_visible   = false;
    global.__gsb_hud_auto_hide = -1;
}
if (!variable_global_exists("__gsb_hud_visible") || !global.__gsb_hud_visible) exit;
if (!variable_global_exists("__gsb_hud_vars")) exit;
if (!ds_exists(global.__gsb_hud_vars, ds_type_list)) exit;

var _count = ds_list_size(global.__gsb_hud_vars);
if (_count == 0) exit;

var _line_h = 18;
var _pad    = 6;
var _w      = 290;
var _h      = _pad * 2 + 16 + _count * _line_h + _pad;
var _gw     = display_get_gui_width();
var _x      = _gw - _w - 10;
var _y      = 10;

// Полупрозрачный чёрный фон
draw_set_alpha(0.8);
draw_set_colour(c_black);
draw_rectangle(_x, _y, _x + _w, _y + _h, false);
draw_set_alpha(1);

// Зелёная рамка (GMSync цвет)
draw_set_colour(make_colour_rgb(0, 200, 100));
draw_rectangle(_x, _y, _x + _w, _y + _h, true);

// Заголовок
draw_set_colour(make_colour_rgb(0, 255, 128));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_text(_x + _pad, _y + _pad, "GMSync Live");

// Список изменённых переменных
for (var _i = 0; _i < _count; _i++) {
    draw_set_colour(c_white);
    draw_text(_x + _pad, _y + _pad + 16 + _i * _line_h, ds_list_find_value(global.__gsb_hud_vars, _i));
}

// Сброс состояния рисования
draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
