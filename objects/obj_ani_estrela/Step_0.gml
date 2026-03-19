//pause
if(screen_pause() == true)
{
	exit;
}

//vida útil
tempo_vida--;

//sumindo se acabou minha vida ou se não tenho pai
if(tempo_vida <= 0 || !instance_exists(pai))
{
	//encolhendo
	image_yscale -= .1;
	image_xscale = image_yscale;
}

if(instance_exists(pai))
{
//seguindo meu criado
	x = pmod + pai.x;
	y = pmod + pai.y;
}

//me destruindo mais rápido se fiquei muito pequeno
if(image_yscale <= 0)
{
	instance_destroy();
}