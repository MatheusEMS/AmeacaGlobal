global.tutorial_ativo = false;

if(instance_exists(obj_iluminacao))
{
	instance_destroy(obj_iluminacao);
}

if(instance_exists(obj_luz))
{
	instance_destroy(obj_luz);
}

if(instance_exists(obj_botao_tutorial))
{
	instance_destroy(obj_botao_tutorial);
}

save_game();