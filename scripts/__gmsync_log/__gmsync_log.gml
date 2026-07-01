/// @param {any} msg
/// @desc Отправляет лог-сообщение в VS Code через GMSync Bridge.
function __gmsync_log(msg) {
    if (!instance_exists(__gmsync_bridge)) exit;
    with (__gmsync_bridge) {
        if (__gsb_active && ds_exists(__gsb_log_queue, ds_type_queue)) {
            if (ds_queue_size(__gsb_log_queue) < 500) {
                ds_queue_enqueue(__gsb_log_queue, string(msg));
            }
        }
    }
}
