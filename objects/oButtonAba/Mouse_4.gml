if(instance_exists(obj_tutorial))
{
	if(obj_tutorial.etapa != 18
	&& obj_tutorial.etapa != 20
	&& obj_tutorial.etapa != 21
	&& obj_tutorial.etapa != 22
	&& obj_tutorial.etapa != 24
	&& obj_tutorial.etapa != 26)
	{
		exit;
	}
}

if instance_exists(oAlbum) && screen_pause() == false
{
	oAlbum.aba = aba;	
	oAlbum.deletar = true;
	
	if instance_exists(oButtonLevelUp)
	{
		instance_destroy(oButtonLevelUp);
	}
}