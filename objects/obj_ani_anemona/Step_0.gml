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
else
{
	//pegando a posição correta para criar as remoras
	var _meio_x_torre = torre_dona.x + torre_dona.sprite_width / 2;
	var _meio_y_torre = torre_dona.y - torre_dona.sprite_height / 2;
	
	//ajustando minha posição
	x = _meio_x_torre;
	y = _meio_y_torre;
	
	//causando dano
	//se minha torre está ilegal, não posso dar dano
	if(torre_dona.image_blend != c_white)
	{
		posso_ferir = cooldown; //5 segundos de cooldown
	}
	else
	{
		if(posso_ferir > 0) //ativando meu cooldown
		{
			posso_ferir--;
		}
	
	}
	
	//identificando ameaças
	var _left, _top, _right, _bottom;
	_left = torre_dona.x - 1;
	_right = torre_dona.x + torre_dona.sprite_width + 1;
	_top = torre_dona.y - torre_dona.sprite_height - 1;
	_bottom = torre_dona.y + 1;
	
	var _ameaca = collision_rectangle(_left, _top, _right, _bottom, obj_ini_ame_pai, false, true);
	
	if(instance_exists(_ameaca))
	{
		if(_ameaca && posso_ferir <= 0)
		{
			cria_popup_dano(_ameaca, atk);
			_ameaca.hp -= atk;
			_ameaca.y -= knockback;
			posso_ferir = cooldown; //5 segundos de cooldown
		}
	}
}

//morrendo
if(morrer)
{
	image_xscale -= 0.1;
	image_yscale = image_xscale;
}

if(image_xscale <= 0)
{
	instance_destroy();
}