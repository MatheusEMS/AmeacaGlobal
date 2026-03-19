global.TrancadoCarta[numero] = trancado;

//PAUSANDO
if(screen_pause()) //se ta pausando
{
	exit; //não executo o resto do código
}

//SE NÃO ESTOU NO ALBUM
if(room != rm_album)
{
	//controle de duração do efeito nas torres afetadas
	for(var i = array_length(torres_afetadas) - 1; i >= 0; i--)
	{
		var _e = torres_afetadas[i]; //definindo que _e são as torres afetadas
		_e.tempo_restante -= 1/60; //reduzindo a duração (tempo restante) do efeito
		
		var _torre = _e.torre_id; //definindo que _torre é o id de _e
		
		if(_e.tempo_restante <= 0 || !instance_exists(_torre)) //se acabou a duração do efeito OU a torre não existe mais
		{
			if (!is_undefined(on_remover) && is_callable(on_remover)) //se a trompa tem on_remover
			{
				on_remover(_torre, _e); //chama on_remover para a torre
			}
			
			array_delete(torres_afetadas, i, 1); //remove a torre da lista de torres afetadas
		}
		else if(_e.tempo_restante > 0 && instance_exists(_torre)) //se ainda tem tempo restante para o efeito E a torre ainda existe
		{
			if(script_exists(on_efeito)) //se a trompa tem on_efeito
			{
				on_efeito(_torre, _e); //chama on_efeito para a torre
			}
		}
	}
	
	//lógica de cooldown e clique
	if(selecionado) //se to selecionado
	{
		if(instance_exists(obj_ani_dragged_pai)) //se existe uma torre dragged
		{
			selecionado = false; //me desseleciono
		}
		
		if(mouse_check_button_pressed(mb_right)) //se clicar com o botão direito do mouse
		{
			selecionado = false; //me desseleciono
		}
		
		if(mouse_check_button_pressed(mb_left)) //se clicar com o botão esquerdo do mouse
		{
			var _ani = noone;
			
			if(instance_exists(obj_ani_pai))
			{
				with(obj_ani_pai)
				{
					var _em_cima = point_in_rectangle(mouse_x, mouse_y, x, y - sprite_height, x + sprite_width, y);
	
					if(object_index == obj_ani_2_tartaruga)
					{
						_em_cima = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
					}
					
					if(_em_cima)
					{
						_ani = id;
					}
				}
			}
			
			//Se uma torre foi encontrada
			if(_ani != noone)
			{
			    //show_message("Clique na torre");
				oSFX.upandoPeixeSnd = true;
				_ani.selecionado = false; //desseleciono a torre
				layer_add_instance("Torres", _ani.id);
				_ani.EfeitoCarta = true; //gravo que a torre ta sob efeito
			    aplicar_em(_ani); //chama o aplicar_em() para a torre
				cooldown = cooldownSave; //reinicia meu cooldown
				ativo = true; //gravo que to ativo
				selecionado = false; //me desseleciono
			}
		}
	}
	
	cooldown = clamp(cooldown, 0, 500); //reseto meu cooldown
	cooldown -= 1/60; //inicio meu cooldown
}
else //se estou no álbum
{
	if point_in_circle(mouse_x,mouse_y,x+32,y+32,42) && mouse_check_button_pressed(mb_left)
	{
		if instance_exists(oAlbum) && screen_pause() == false
		{
			oAlbum.clicouQualTrompa = id;
		}
	}
}