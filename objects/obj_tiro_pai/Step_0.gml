//PAUSANDO
if(screen_pause() == true)
{
	speed = 0;
	exit;
}
else
{
	speed = vel;
}

if(instance_exists(pai) && object_index != obj_tiro_fragmento)
{
	dano = pai.ataque;
}

if(instance_exists(pai) && distance_to_object(pai) > 320)
{
	instance_destroy();
}