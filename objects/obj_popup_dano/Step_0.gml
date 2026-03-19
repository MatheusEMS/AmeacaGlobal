if(screen_pause() == true)
{
	vspeed = 0;
	exit;
}

vspeed = vel_h;

image_alpha -= 0.02;

if(!diminuir)
{
	escala = lerp(escala, 1.75, vel_encolhe);
	
	if(escala >= 1.65)
	{
		diminuir = true;
	}
}
else
{
	escala -= .2;
}

if(image_alpha <= 0 || escala < 0)
{
	instance_destroy();
}