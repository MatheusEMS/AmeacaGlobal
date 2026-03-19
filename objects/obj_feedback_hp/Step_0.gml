if(screen_pause() == true)
{
	exit;
}

if(instance_exists(animal))
{
	//atualizando a posição numa fila horizontal
	x = animal.x;
	y = animal.y;
	
	if(animal.vida <= 0)
	{
		instance_destroy();
		exit;
	}
}
else
{
	instance_destroy();
	exit;
}

