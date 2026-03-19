//destruindo minha lista
if(ds_exists(na_area, ds_type_list))
{
	ds_list_destroy(na_area);
}

if(global.debug) show_debug_message("area destruida");