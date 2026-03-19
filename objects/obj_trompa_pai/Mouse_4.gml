if room != rm_album 
{
	//PAUSANDO
	if(screen_pause())
	{
		exit;
	}	

	//se estou no tutorial
	if(instance_exists(obj_tutorial))
	{
		//se ainda não cheguei na etapa 8 do tutorial
		if(obj_tutorial.etapa < 8) 
		{
			exit; //não executo mais nada no step
		}
	}

	if cooldown <= 0
	{
		selecionado = true;
	}
}