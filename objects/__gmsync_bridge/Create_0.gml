// __gmsync_bridge — Create Event
// GMSync Bridge: игра = TCP-клиент, VS Code = TCP-сервер на порту 6503.
// Alarm 0 сразу пробует подключиться; при неудаче повторяет каждые 3 секунды.
__gsb_sock       = -1;
__gsb_active     = false;
__gsb_recv_buf   = "";
__gsb_log_queue  = ds_queue_create();
__gsb_diag_count = 0;        // диагностика: логируем async_load при первых N вызовах
__gsb_heartbeat  = 0;        // счётчик для периодических логов
alarm[0] = 1;                // немедленная первая попытка подключения
show_debug_message("[GMSync] Create: Bridge initialized. Connecting to VS Code on port 6503...");
global.__gsb_hud_vars      = ds_list_create();
global.__gsb_hud_visible   = false;   // скрыт по умолчанию
global.__gsb_hud_auto_hide = -1;      // timestamp авто-скрытия (-1 = ручное управление)
