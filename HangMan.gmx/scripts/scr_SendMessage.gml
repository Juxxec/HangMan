var msgId = ds_map_create();
ds_map_add(msgId, "type", argument0);
ds_map_add(msgId, "data", argument1);
ds_list_add(global.g_MessageQueue, msgId);
