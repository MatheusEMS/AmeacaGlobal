irPara = rm_album;
level = fase -1;
//varivel fase nas variaveis Definitions, para iniciar ja com valor de cada fase

if global.UltimaFase < fase
{
	instance_destroy();
}





//meu nome
nome = "";
cor = make_color_rgb(47, 100, 82);

//pulsando
pulsa = true;

//if(global.tutorial_ativo || global.tutorial[array_length(global.tutorial) - 1])
if(global.UltimaFase > fase)
{
	pulsa = false;
	image_xscale = 1;
	image_yscale = 1;
}

//tamanho base (em escala, não pixels diretamente)
tam_x = 1;
tam_y = 1;

image_xscale = tam_x;
image_yscale = tam_y;

//controle de pulsação
escala_pulso = 1; //escala atual (1 = 100%)
min_percent = 0.75; //mínimo da pulsação (ex: 75%)
diminuir = true;
tam_mod = 0.015; //velocidade da pulsação

//posição
pos_x = 0;
pos_y = 0;

//oscilando
vel_osc = 2;
tempo_osc = 0;
dist_osc = 3;

tempo_ang = 0;
vel_ang = 2;
ang_min = -0;
ang_max = 0; 