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

//criando craca
timer_cria++;

var _mod = random_range(-6, 6);

if(timer_cria >= 150)
{
	timer_cria = 0;
}
else if(timer_cria >= 1)
{
	if(random_range(0, 100) <= 10)
	{
		var _craca = instance_create_layer(x + _mod, y - sprite_height + _mod, "Projeteis", obj_ani_craca);
		_craca.encolhimento = 0.01;
		_craca.tempo_vida = 60;
		_craca.pai = id;
	}
}

//atualizando minha posição
x = torre_dona.x + torre_dona.sprite_width / 2;
y = torre_dona.y - torre_dona.sprite_height / 2;

//efeito
if(instance_exists(torre_dona))
{
	torre_dona.mov_padrao = false;
	
	with(torre_dona) //a minha dona verifica se...
	{
		if(instance_exists(obj_ini_ame_pai)) //se existe inimigos
		{
			if(collision_rectangle(x, y - sprite_height - 1, x + sprite_width, y, obj_ini_ame_pai, false, true) == noone)
			{
				//se não estou colidindo com inimigos
				forca = 20; //reseto minha força
			}
		}
		else //se não existe inimigos
		{
			forca = 20; //reseto minha força
		}
	}
}