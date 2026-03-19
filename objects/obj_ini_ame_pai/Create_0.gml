//INICIANDO VARIÁVEIS
vel = VelAmeaca(numero); //velocidade de queda
dano = DanoAmeaca(numero); //dano
peso = PesoAmeaca(numero); //peso
premio = ceil(dano); //valor que o player ganha ao me destruir
timer_dano = 120; //cooldown de dano
estou_pesando = false;
sprite = SpriteAmeaca(numero, 1);
hp_max = VidaAmeaca(numero); //resistência
hp = hp_max;



sprite_var = choose(0, 1, 2);

if(room != rm_album)
{
	oSFX.SplashSnd = true;
	image_angle = random_range(0, 359);
	dir = choose(1, -1);
	
	//se fui visto fora do álbum
	global.TrancadoInimigo[numero] = false; //gravo que fui visto,
}

trancado = global.TrancadoInimigo[numero];

//squash and strech
scale_x = 1;
scale_y = 1;

//ÁLBUM
nome = NomeAmeaca(numero);
descricao = DescAmeaca(numero);

clicouInimigo = false;

