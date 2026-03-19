if(screen_pause() == true)
{
	exit;
}

//se não tenho dona
if(!instance_exists(torre_dona))
{
	instance_destroy(); //me destruo
	exit;
}

//criando estrela
timer_cria++;

var _mod = random_range(-8, 8);
var _pos_x = x + _mod;
var _pos_y = y + _mod;

if(timer_cria >= 150)
{
	timer_cria = 0;
}
else if(timer_cria >= 1)
{
	if(random_range(0, 100) <= 1)
	{
		var _estrela = instance_create_layer(_pos_x, _pos_y, "Projeteis", obj_ani_estrela);
		_estrela.tempo_vida = 120;
		_estrela.pai = id;
		_estrela.pmod = _mod; 
	}
}

//atualizando minha posição
x = torre_dona.x + torre_dona.sprite_width / 2;
y = torre_dona.y - torre_dona.sprite_height / 2;

//efeito
if(instance_exists(torre_dona))
{
	with(torre_dona) //a minha dona verifica se...
	{
		if(vida < vida_max) //se não estou com vida maxima
		{
			//1 de vida a cada 3 segundos
			vida += 1 / 90;
		}
		else
		{
			vida = vida_max;
		}
	}
}