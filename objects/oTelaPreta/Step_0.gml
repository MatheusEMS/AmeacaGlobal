/// @description ?
if alpha < 1 && !voltar
{
	alpha += 0.05;

}

if alpha >= 1 && !check
{
	oSFX.MarteloBatendoBigornaSnd = true;
	check = true;
	alarm[0] = 180;
}else
{
	oSFX.MarteloBatendoBigornaSnd = true;
}

if voltar 
{
	alpha -= 0.05;
	if instance_exists(oScreenPause)
	{
		instance_destroy(oScreenPause);	
	}
	
	if alpha <= 0
	{
		instance_destroy();	
	}
}
