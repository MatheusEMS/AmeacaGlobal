if(screen_pause() == true)
{
	exit;
}

//bolhas
cria_bolhas(x, y - sprite_height);

//me destruindo se minha torre foi destruída
if(!instance_exists(torre_dona))
{
    morrer = true;
}
else
{
	//movimentação
	if(lado == "dir") //se sou a remora da direita
	{
	    x = torre_dona.x + torre_dona.sprite_width + sprite_width / 2;
	}
	else if(lado == "esq")//se sou a remora da esquerda
	{
	    x = torre_dona.x + sprite_width / 2;
	}
	
	y = torre_dona.y - torre_dona.sprite_height / 2 + sprite_height / 2;
	
	//atirando
	//Verifica se torre existe e tem alvo válido
	if(instance_exists(torre_dona) && instance_exists(torre_dona.alvo))
	{
	    var a = torre_dona.alvo;
	
	    // Verifica se o alvo está dentro do alcance da torre
	    if(point_distance(x, y, a.x, a.y) <= torre_dona.alcance)
		{
	        alvo = a;
	        bullet_dir = point_direction(x, y, alvo.x + alvo.sprite_width / 2, alvo.y + alvo.sprite_height / 2);
	    }
		else
		{
	        alvo = noone;
	    }
	}
	else
	{
	    alvo = noone;
	}
	
	
	//cooldown entre rajadas
	if(cooldown > 0)
	{
		cooldown--; //inicio o cooldown
	}
	
	//verificando o inimigo mais próximo no alcance
	//se o alvo ta no meu retangulo de colisão
	with(torre_dona)
	{
	    if(alvo != noone && instance_exists(alvo)) //se tenho alvo
	    {
		    //se o alvo está no alcance
		    if(point_distance(x + sprite_width / 2, y - sprite_height / 2, alvo.x, alvo.y) <= alcance)
		    {
		    	other.alvo = alvo; //gravo o alvo
		    	//ajusto a direção do tiro
		    	//other.bullet_dir = point_direction(x + sprite_width / 2, y - sprite_height / 2, alvo.x + alvo.sprite_width / 2, alvo.y - sprite_height / 2);
	        }
	    }
	}
	
	//início da rajada
	//se posso atirar E não estou em cooldown E tenho alvo
	if(pode_atirar && cooldown == 0 && alvo != noone && torre_dona.image_blend == c_white)
	{
		pode_atirar = false; //gravo que não posso atirar
		rajada_atual = 0; //resetando rajada atual
		rajada_timer = 0; //resetando timer
	}
	
	//controlando a rajada
	if(!pode_atirar) //se estou atirando
	{
		if(rajada_timer > 0) //se estou em cooldown
		{
			rajada_timer--; //diminuo meu cooldown
		}
		else //se não estou em cooldown
		{
			if(alvo != noone && rajada_atual < rajada_total) //se tenho alvo E não terminei a rajada
			{
				//mudando meu sprite
				estado = "ação";
				
				//criando meu tiro
				var _bullet = instance_create_layer(x + sprite_width / 2, y - sprite_height, "Projeteis", tiro);
				_bullet.pai = id; //gravo que sou o pai do tiro
				_bullet.alvo = alvo; //gravo que o alvo do tiro é o meu alvo
				_bullet.direction = point_direction(
					_bullet.x,
					_bullet.y,
					alvo.x + alvo.sprite_width / 2,
					alvo.y - alvo.sprite_height / 2
				);
				
				rajada_atual++; //vou pra próxima rajada
				rajada_timer = rajada_intervalo; //reinicio o intervalo da rajada
			}
			else
			{
				//fim da rajada
				pode_atirar = true;
				cooldown = cadencia;
			}
		}
	}
}

//morrendo
if(morrer)
{
	if(lado == "dir")
	{
		image_xscale -= 0.1;
	}
	else
	{
		image_xscale += 0.1;
	}
	
	image_yscale = abs(image_xscale);
}

if(lado == "dir")
{
	if(image_xscale <= 0)
	{
		//show_message("remora "+lado+" se destruindo");
		instance_destroy();
	}
}
else
{
	if(image_xscale >= 0)
	{
		//show_message("remora "+lado+" se destruindo");
		instance_destroy();
	}
}

//controlando meu sprite
switch(estado)
{
	case "parado":
	{
		muda_sprite(sprite_idle);
		
		break;
	}
	
	case "ação":
	{
		muda_sprite(sprite_acao);
		
		if(animation_end())
		{
			estado = "parado";
		}
		
		break;
	}
}