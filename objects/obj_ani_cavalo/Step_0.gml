/// @description Insert description here
// You can write your code in this editor

//pause
if(screen_pause() == true)
{
	exit;
}

//movimentação
x += vel_flutua * velh * rand;
y += vel_flutua * velv * rand;

//vida útil
tempo_vida--;

//sumindo mais rápido se não tenho pai
if(!instance_exists(pai))
{
	encolhimento += .1;
}

//encolhendo
image_yscale -= encolhimento;
image_xscale = image_yscale * dir;

//me destruindo se acabou minha vida ou fiquei muito pequeno
if(tempo_vida <= 0 || image_yscale <= 0)
{
	instance_destroy();
}