//criando bolhas
function cria_bolhas(_x, _y, _percent = 1)
{
	if(random_range(0, 100) <= _percent)
	{
		instance_create_layer(_x, _y, "Projeteis", obj_bolha);
	}
}
		
//retorna se tem trompa selecionada
function trompa_sel()
{
	var tem_selecionada = false;
	
	if(instance_exists(obj_trompa_pai))
	{
		with(obj_trompa_pai)
		{
			if(selecionado)
			{
				tem_selecionada = true;
			}
		}
	}
	
	return tem_selecionada;
}

/// @func draw_text_outline()
/// @desc Draw_text com outline (contorno).
function draw_text_outline(_x, _y, _texto, _corTexto, _corContorno, _offset)
{
	draw_set_color(_corContorno);
	draw_text(_x - _offset, _y, _texto);
	draw_text(_x + _offset, _y, _texto);
	draw_text(_x, _y - _offset, _texto);
	draw_text(_x, _y + _offset, _texto);
	draw_text(_x - _offset, _y - _offset, _texto);
	draw_text(_x + _offset, _y - _offset, _texto);
	draw_text(_x - _offset, _y + _offset, _texto);
	draw_text(_x + _offset, _y + _offset, _texto);
	
	draw_set_color(_corTexto);
	draw_text(_x, _y, _texto);
}

//mensagem de erro
function msg_erro(_objeto)
{
	show_debug_message("Erro: "+_objeto+" não encontrado!");
}

/// @func inicia_contagem()
/// @desc Inicia a contagem do spawner, se existir.
function inicia_contagem()
{
	if(instance_exists(obj_ini_ger_pai))
	{
		with(obj_ini_ger_pai)
		{
			contagem_ativa = true;
			contagem_finalizou = false;
			contador = 3;
			tempo_contagem = game_get_speed(gamespeed_fps);
		}
	}
	else
	{
		msg_erro("Spawner");
	}
}

//Define align
///@function define_align(vertical, horizontal)
function define_align(_ver, _hor)
{
	draw_set_halign(_hor);
	draw_set_valign(_ver);
}

//criando pérolas
function cria_perolas(_min, _max, _x, _y)
{
	//criando o efeito de pérolas
	repeat(irandom_range(_min, _max))
	{
		instance_create_layer(_x, _y, "Projeteis", obj_efeito_perola);
	}
}

//criando explosao bolhas
function cria_explo_bolha(_min, _max, _x, _y)
{
	//criando o efeito de pérolas
	repeat(irandom_range(_min, _max))
	{
		instance_create_layer(_x, _y, "Projeteis", obj_explosao_bolha);
	}
}

//pop up dano
function cria_popup_dano(_ameaca, _dano)
{
	var _popup = instance_create_layer(_ameaca.x + _ameaca.sprite_width / 2, _ameaca.y - _ameaca.sprite_height / 2, "Projeteis", obj_popup_dano);
	_popup.dano = _dano;
}

//dano padrao de bullet
function hit_bullet_padrao()
{
	var _ameaca = instance_place(x, y, obj_ini_ame_pai);

	if(instance_exists(_ameaca))
	{
		if(_ameaca)
		{
			if(variable_instance_exists(id, "ignorar"))
			{
				if(ignorar != _ameaca)
				{
					//criando o pop up de dano na cabeça do inimigo
					cria_popup_dano(_ameaca, dano);	
					
					if(_ameaca.hp > dano)
					{
			
						_ameaca.hp -= dano;
					}
					else
					{
						//criando o efeito de pérolas
						cria_perolas(5, 15, _ameaca.x, _ameaca.y);
						
						instance_destroy(_ameaca);
					}
				}
			}
			else
			{
				//criando o pop up de dano na cabeça do inimigo
				cria_popup_dano(_ameaca, dano);
				
				if(_ameaca.hp > dano)
				{
					if _ameaca.object_index == obj_ini_ame_0_pneu
					{
						oSFX.BatidaBorrachaSnd = true;	
					}else if _ameaca.object_index == obj_ini_ame_1_lata
					{
						oSFX.BatendoMetalSnd = true;
					}else if _ameaca.object_index == obj_ini_ame_2_garrafa
					{
						oSFX.BatidaBorrachaSnd = true;
					}else if _ameaca.object_index == obj_ini_ame_3_refri
					{
						oSFX.BatendoMetalSnd = true;
					}
					else if _ameaca.object_index == obj_ini_ame_4_sacola
					{
						oSFX.BatidaPlasticoSnd = true;
					}
					_ameaca.hp -= dano;
				}
				else
				{
					//criando o efeito de pérolas
					cria_perolas(5, 15, _ameaca.x, _ameaca.y);
						
					instance_destroy(_ameaca);
				}
			}
		
			//ESPECIAL
			//REFORÇO CORALINO
			if(instance_exists(obj_especial_0_coral) && cria_frag(object_index))
			{
				if obj_especial_0_coral.ativo == true
				{
			          var _frag = instance_create_layer(x, y, "Projeteis", obj_cria_fragmento); 
					  _frag.ignorar = _ameaca;
					  _frag.pai = pai;
				}
			}
			
			instance_destroy();
			
		}
	}
}

//direcao padrao de bullet
//function @dir_bullet_padrao(_alvo)
function dir_bullet_padrao()
{
	//if(instance_exists(_alvo))
	//{
		x += lengthdir_x(speed, direction);
		y += lengthdir_y(speed, direction);
	//}
	//else
	//{
	//	instance_destroy();
	//}
}

//colisao padrao de torre
function col_ani_padrao()
{
	return collision_rectangle(x + esq_offset, y - sprite_height - alcance, x + sprite_width + dir_offset, y - sprite_height, obj_ini_ame_pai, false, true);
}

//fragmentos
function cria_frag(_obj_index)
{
	var _lista_not_frag = [
		obj_tiro_fragmento
		,obj_tiro_raio
		,obj_tiro_melee
		,obj_arco_raio
	];
	
	for(var i = 0; i < array_length(_lista_not_frag); i++)
	{
		if(_obj_index == _lista_not_frag[i])
		{
			return false;
		}
	}
	
	return true;
}

//criar feedback de duração de trompas
function criar_feedback_duracao(_torre, _efeito)
{
	var _margem = 20;
	var _fx = instance_create_layer(x, y - _margem, "UI", obj_feedback_duracao);
	_fx.torre_dona = _torre;
	_fx.efeito_data = _efeito;
	_fx.origem_trompa = id;
}

//mudando de sprite
function muda_sprite(_sprite)
{
	if(sprite_index != _sprite)
	{
		image_index = 0;
		sprite_index = _sprite;
	}
}

//acabou minha animação
function animation_end()
{
	return image_index >= image_number - 1;
}

//resetando variáveis relevantes ao encerrar/iniciar uma fase
function reset_stage()
{
	global.wave = 0;
	global.hp_atual = global.hp;
	global.coins = 250;
	global.spd = 0.1;
	
	if(instance_exists(obj_ini_ger_pai))
	{
		obj_ini_ger_pai.perdeu = false;
		obj_ini_ger_pai.ganhou = false;
	}
}

//antigo "room_speed"
#macro game_speed game_get_speed(gamespeed_fps)