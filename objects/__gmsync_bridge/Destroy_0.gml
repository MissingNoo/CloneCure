// __gmsync_bridge — Destroy Event
show_debug_message("[GMSync] Destroy: cleaning up bridge...");
if (ds_exists(__gsb_log_queue, ds_type_queue)) {
    ds_queue_destroy(__gsb_log_queue);
}
if (__gsb_sock >= 0) {
    network_destroy(__gsb_sock);
    show_debug_message("[GMSync] Destroy: socket destroyed.");
}
if (variable_global_exists("__gsb_hud_vars") && ds_exists(global.__gsb_hud_vars, ds_type_list)) {
    ds_list_destroy(global.__gsb_hud_vars);
}
show_debug_message("[GMSync] Destroy: done.");
