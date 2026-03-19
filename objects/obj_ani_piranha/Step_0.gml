//pause
if(screen_pause() == true)
{
	exit;
}

//bolhas
cria_bolhas(x, y);

//me destruindo se minha torre foi destruída
if(!instance_exists(torre_dona))
{
    morrer = true;
}

//movimentação
//velocidade
orbit_dir += vel_orbit * dir;

//mantendo a órbita dentro de 360°
if(orbit_dir > 359) {orbit_dir = 0;}

if(instance_exists(torre_dona))
{
	//pegando a posição correta para criar as remoras
	var _meio_x_torre = torre_dona.x + torre_dona.sprite_width / 2;
	var _meio_y_torre = torre_dona.y - torre_dona.sprite_height / 2;
	
	//calculando minha posição		
	var _orbit_x = _meio_x_torre+lengthdir_x(32, orbit_dir);
	var _orbit_y = _meio_y_torre+lengthdir_y(32, orbit_dir);
	
	//ajustando minha posição
	x = _orbit_x;
	y = _orbit_y;
	
	//ajustando meu angulo
	image_angle = orbit_dir;
	
	if(!morrer)
	{
	image_yscale = dir;
	}
	
	//se minha torre está ilegal, não posso dar dano
	if(torre_dona.image_blend != c_white)
	{
		posso_ferir = false;
	}
}

//Causando dano
var _ameaca = instance_place(x, y, obj_ini_ame_pai);

if(instance_exists(_ameaca))
{
	if(_ameaca && posso_ferir)
	{
		cria_popup_dano(_ameaca, atk);
		_ameaca.hp -= .5;
		posso_ferir = false;
	}
}

//Quando der uma volta completa, posso ferir de novo
if(!posso_ferir && abs(orbit_dir - ang_init) <= 5)
{
	posso_ferir = true;
}

//morrendo
if(morrer)
{
	if(dir > 0)
	{
		//funcionando
		image_yscale -= 0.1;
		
		if(image_yscale <= 0)
		{
			instance_destroy();
		}
	}
	else
	{
		//se destrói na hora
		image_yscale += 0.1;
		
		if(image_yscale >= 0)
		{
			instance_destroy();
		}
	}
	image_xscale = image_yscale;
}

