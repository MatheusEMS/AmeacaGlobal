//lista de mensagens ativas
if(!ds_exists(mensagens_ativas, ds_type_list))
{
	mensagens_ativas = ds_list_create();
}

if(room == rm_tutorial)
{
	if(!instance_exists(obj_tutorial))
	{
		instance_create_layer(x,y,"UI",obj_tutorial);
	}
}