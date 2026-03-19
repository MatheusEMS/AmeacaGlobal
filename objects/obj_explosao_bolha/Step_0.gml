if(!sobe)
{
	if(speed > 0.5)
	{
		speed -= atrito;
	}
	else
	{
		sobe = true;
		speed = 0.5;
	}
}

if(sobe)
{
	y -= vel_flutua;
	x += random_range(-1, 1);
	
	tempo_vida--;
	
	image_yscale -= encolhimento;
	image_xscale = image_yscale;
	
	if(tempo_vida <= 0 || image_yscale <= 0)
	{
		instance_destroy();
	}
}
