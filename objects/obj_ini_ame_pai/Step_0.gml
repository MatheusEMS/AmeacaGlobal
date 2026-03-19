global.TrancadoInimigo[numero] = trancado;

if room != rm_album //se não estou no álbum
{
	//bolhas
	cria_bolhas(x, y - sprite_height / 2);
	
	//definindo meu sprite
	var _pctVida = hp / hp_max;

	sprite_index = SpriteAmeaca(numero, _pctVida);

	if(image_number > 1)
	{
		image_index = sprite_var;
	}

	//pause self
	if(screen_pause()) //se o jogo ta pausado
	{
		exit; //não executo o resto do código
	}
	
	//se não estiver em pause
	//iniciando variáveis
	var _animal = instance_place(x, y + 1, obj_ani_pai);
    
	//COLISÃO E MOVIMENTAÇÃO
	if(_animal != noone) //se colidi com uma torre
	{
		if(_animal.image_blend == c_white) //se a torre está legal
		{
			//show_debug_message("colidi com animal");
            if(_animal.explosao == false && _animal.estado != "morrendo") //se a torre não é explosiva NEM está morrendo
			{
				if(!estou_pesando) //se ainda não apliquei meu peso
				{
					_animal.forca -= peso; //aplico meu peso
					estou_pesando = true; //gravo que já apliquei meu peso
				}
				
				//se o animal NÃO aguenta mais peso
				if(_animal.forca <= 0)
				{
					//teste
					if(_animal.vida > dano) //se a torre ainda aguenta meu dano
					{
					    _animal.vida -= (dano / timer_dano); //aplica dano
					}
					else //se não aguenta meu dano
					{
						_animal.estado = "morrendo";
					}
				}
			}
			else //se eu colidi com um animal MAS ele é explosivo
			{
				//girando
				image_angle += random_range(0.1, 0.5) * dir;
				estou_pesando = false; //posso aplicar meu peso novamente
				y += vel + global.spd; //desço
			    
				//show_debug_message("descendo");
			}
		}
		else //se eu colidi com um animal MAS ele estava se movendo
		{
			//girando
			image_angle += random_range(0.1, 0.5) * dir;
			estou_pesando = false; //posso aplicar meu peso novamente
			y += vel + global.spd; //desço
            
			//show_debug_message("descendo");
		}
	}
	else //se NÃO colidi com um animal
	{
		//girando
		image_angle += random_range(0.1, 0.5) * dir;
		estou_pesando = false; //posso aplicar meu peso novamente
		y += vel + global.spd; //desço
        
		//show_debug_message("descendo");
	}

	//MORRENDO
	if(hp <= 0) //se nao tenho mais vida
	{
		instance_destroy(); //me destruo
	}
}
else
{
	if point_in_circle(mouse_x,mouse_y,x + 32,y + 32,42) && mouse_check_button_pressed(mb_left)
	{
		if instance_exists(oAlbum)
		{
			oAlbum.clicouQualInimigo = id;
		}
	}
}