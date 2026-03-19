//DANO POR NÍVEL
global.TrancadoPeixe[numero] = trancado;

global.LVpeixes[numero] = level;

//se não estou no álbum
if(room != rm_album)
{
	//PAUSANDO
	if(screen_pause()) //se o jogo está pausado
	{
		if(selecionado)
		{
			selecionado = false; //deixo de estar selecionado
			layer_add_instance("Torres", id); //volto pra camada comum das torres
			timer_selecao = 600; //10 segundos
			estado = "parado"; //"mudo para parado"
		}
		
		exit; //não executo o restante do código
	}
	
	//INICIANDO VARIÁVEIS
	var _solta_esq = mouse_check_button_released(mb_left);
	var _clica_esq = mouse_check_button_pressed(mb_left);
	var _press_esq = mouse_check_button(mb_left);
	var _clica_dir = mouse_check_button_pressed(mb_right);
	var _ameaca = instance_place(x, y - 1, obj_ini_ame_pai);
	var _em_cima = point_in_rectangle(mouse_x, mouse_y, x, y - sprite_height, x + sprite_width, y);
	
	if(object_index == obj_ani_2_tartaruga)
	{
		_em_cima = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}
	
	//FUNÇÕES LOCAIS
	//Posso selecionar?
	function posso_selecionar()
	{
		var _em_cima = point_in_rectangle(mouse_x, mouse_y, x, y - sprite_height, x + sprite_width, y);
	
		if(object_index == obj_ani_2_tartaruga)
		{
			_em_cima = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
		}
		
		var _tuto_13 = false;
		
		if(instance_exists(obj_tutorial))
		{
			if(obj_tutorial.etapa == 13)
			{
				_tuto_13 = true;
			}
		}
		
		return mouse_check_button_pressed(mb_left) //clicou com o esquerdo
			&& _em_cima //cursor em mim
			&& image_blend == c_white //cor padrão
			&& !instance_exists(obj_ani_dragged_pai) //nenhuma torre dragged
			&& !instance_exists(obj_item_ostra_dragged) //nenhuma pá dragged
			&& !layer_has_instance("Torres_Selecionadas", obj_ani_pai) //nenhuma torre selecionada
			&& !selecionado //eu não estou selecionado
			&& timer_criado <= 0 //esperei um tempo após ser criado
			&& !trompa_sel()
			&& estado != "morrendo"
			&& !_tuto_13;
	}
	
	//Posso atacar?
	function posso_atacar()
	{
		return col_padrao //se minha collision box e lógica de disparo é padrão e não sou explosiva
			&& pode_atirar
			&& cooldown <= 0 //se não estou em cooldown
			&& alvo != noone //se tenho alvo
			&& image_blend == c_white; //se estou com minha cor padrão
	}
	
	//BOLHAS
	cria_bolhas(x + sprite_width / 2, y - sprite_height);
	
	//CRIANDO MINHA BARRA DE VIDA
	if hp_bar == noone
	{
		hp_bar = instance_create_layer(x,y,"UI",obj_feedback_hp);
		hp_bar.animal = id;
	}
	
	//RESETANDO MINHA FORÇA
	//se não estou colidindo com um inimigo
	if(_ameaca == noone)
	{
		if(forca < resistencia) //se minha força está menor que meu máximo
		{
			forca = resistencia; //minha força se torna meu máximo
		}
	}
	
	//AJUSTANDO SPRITE LATERAL
	if(lateral && selecionado)
	{
		//garantindo que eu olhe para o lado certo
		if (x_anterior != x)
		{
			image_xscale = sign(x - x_anterior);
		}
		x_anterior = x;
	}
	
	//MÁQUINA DE ESTADOS
	switch(estado)
	{
		case "parado":
		{
			//lógica do estado
			muda_sprite(sprite_idle); //ajustando minha sprite
			
			if(explosao) //se sou uma torre explosiva
			{
				//lógica da explosão
				if(animation_end()) //se acabou minha animação
				{
					if(!instance_exists(kaboom)) //se ainda não criei minha área de efeio
					{
						with(instance_create_layer(x, y, "Projeteis", kaboom)) //crio minha área
						{
							alcance = other.alcance; //o alcance da área é meu alcance
							dano = other.ataque; //o dano da área é meu dano
						}
					}
					
					instance_destroy(); //me destruo 
				}
			}
			else //TORRES RANGED E MELEE
			{
				if(col_padrao) //se minha collision box e lógica de disparo é padrão e não sou explosiva
				{
					//cooldown entre rajadas
					if(cooldown > 0)
					{
						cooldown--; //inicio o cooldown
					}
					
					//verificando o inimigo mais próximo no alcance
					//se o alvo ta no meu retangulo de colisão
					var _alvo = collision_rectangle(x + esq_offset, y - sprite_height - alcance, x + sprite_width + dir_offset, y - sprite_height, obj_ini_ame_pai, false, true);
					
					if(_alvo != noone && instance_exists(_alvo)) //se tenho alvo
					{
						alvo = _alvo; //gravo o alvo
						
						//ajusto a direção do tiro
						bullet_dir = point_direction(x + sprite_width / 2, y - sprite_height / 2, alvo.x, alvo.y);
					}
					else //se não tenho alvo
					{
						alvo = noone; //reseto minha memória sobre alvos
					}
				}
			}
			
			//CONDIÇÕES PARA TROCA DE ESTADO
			//indo para nadando
			if(mov_padrao) //se meu movimento é padrão
			{
				
				//timer para evitar grudar no mouse quando criado
				if(timer_criado > 0)
				{
					timer_criado--;
				}
				
				//se os critérios pra me selecionar são atendidos
				if(posso_selecionar())
				{
					
					selecionado = true; //fico selecionado
					layer_add_instance("Torres_Selecionadas", id); //vou pra camada das torres selecionadas
					estado = "nadando";
				}
			}
				
			//indo para atacando
			if(posso_atacar())
			{
				pode_atirar = false;
				rajada_atual = 0;
				rajada_timer = 0;
				estado = "atacando";
			}
			
			//indo para morrendo
			if(!explosao && vida <= 0) //se minha vida é menor ou igual a zero
			{
				estado = "morrendo"; //mudo para "morrendo"
			}
			
			break;
		}
		
		case "nadando":
		{
			//resetando as variáveis de ataque
			rajada_ativa = false;
			rajada_atual = 0;
			rajada_timer = 0;
			pode_atirar = true;
			alvo = noone;
			cooldown = cooldown_tiro;
			
			//lógica do estado
			muda_sprite(sprite_swim); //ajustando minha sprite
			
			//controlando meu tempo selecionado
			if(timer_selecao > 0)
			{
				timer_selecao--;
			}
			
			//mudando minha cor se estou em cima de outra torre
			if(place_meeting(x, y, obj_ani_pai) || place_meeting(x, y, obj_ini_ame_pai))
			{
				image_blend = c_red;
			}
			else
			{
				image_blend = c_white;
			}
			
			//movendo
			if(mouse_x + sprite_width < room_width && mouse_x > 0)
			{
				var grid = 32;
				var spr_w = sprite_width;
				var spr_h = sprite_height;
				
				// Alinhamento padrão com origem no canto inferior esquerdo
				x = (mouse_x div grid) * grid;
				
				// Centraliza se o sprite não for múltiplo de 32
				if (spr_w mod grid != 0)
				{
					x += (grid - spr_w) / 2;
				}
			}
			
			//CONDIÇÕES PARA TROCA DE ESTADO
			//indo para parado
			if(timer_selecao <= 0) //limitando o tempo selecionado
			{
				selecionado = false; //deixo de estar selecionado
				layer_add_instance("Torres", id); //volto pra camada comum das torres
				timer_selecao = 600; //10 segundos
				estado = "parado"; //"mudo para parado"
			}
			
			//se to selecionado E num slot vazio E clicar com direito ou soltar o esquerdo do mouse
			if(selecionado && image_blend == c_white && (_clica_dir || _solta_esq))
			{
				selecionado = false; //deixo de estar selecionado
				layer_add_instance("Torres", id); //volto pra camada comum das torres
				estado = "parado"; //mudo para "parado"
			}
			
			//indo para morrendo
			if(vida <= 0) //se minha vida é menor ou igual a zero
			{
				selecionado = false; //deixo de estar selecionado
				layer_add_instance("Torres", id); //volto pra camada comum das torres
				estado = "morrendo"; //mudo para "morrendo"
			}
			
			break;
		}
		
		case "atacando":
		{
			//lógica do estado
			muda_sprite(sprite_attack); //ajustando minha sprite
			
			if(col_padrao)
			{
				if(rajada_timer > 0) //se estou em cooldown
				{
					rajada_timer--; //diminuo meu cooldown
				}
				else //se não estou em cooldown
				{
					if(alvo != noone && rajada_atual < rajada_total) //se tenho alvo E não terminei a rajada
					{
						//se não tem ninguém no meu retângulo de colisão
						if(!collision_rectangle(x + esq_offset, y - sprite_height - alcance, x + sprite_width + dir_offset, y - sprite_height, alvo, false, true))
						{
							alvo = noone; //gravo que não tenho alvo
						}
						else if(screen_pause() == false) //se tiver alguém no meu retângulo de colisão
						{
							//criando meu tiro
							var _bullet = instance_create_layer(x + sprite_width / 2, y - sprite_height, "Projeteis", tiro);
							_bullet.pai = id; //gravo que sou o pai do tiro
							_bullet.alvo = alvo; //gravo que o alvo do tiro é o meu alvo
							_bullet.direction = bullet_dir;
							_bullet.dano = ataque;
							
							tiros++; //debug de tiros disparados
							rajada_atual++; //vou pra próxima rajada
							rajada_timer = rajada_intervalo; //reinicio o intervalo da rajada
						}
					}
				}
			}
			
			//CONDIÇÕES PARA TROCA DE ESTADO
			//indo para nadando
			if(mov_padrao) //se meu movimento é padrão
			{
				//timer para evitar grudar no mouse quando criado
				if(timer_criado > 0)
				{
					timer_criado--;
				}
				
				//se os critérios pra me selecionar são atendidos
				if(posso_selecionar())
				{
					selecionado = true; //fico selecionado
					layer_add_instance("Torres_Selecionadas", id); //vou pra camada das torres selecionadas
					estado = "nadando";
				}
			}
			
			//indo para parado
			if(col_padrao && rajada_timer <= 0) //se estou em cooldown
			{
				if(alvo == noone || rajada_atual >= rajada_total) //se não tenho lvo ou ja terminei minha rajada
				{
					//fim da rajada
					pode_atirar = true;
					cooldown = cooldown_tiro;
					estado = "parado"; //mudo para parado
				}
			}
			
			//indo para morrendo
			if(vida <= 0) //se minha vida é menor ou igual a zero
			{
				estado = "morrendo"; //mudo para "morrendo"
			}
			
			break;
		}
		
		case "morrendo":
		{
			//lógica do estado
			if(instance_exists(hp_bar)) //se tenho barra de vida
			{
				instance_destroy(hp_bar); //destruo minha barra de vida
			}
			
			muda_sprite(sprite_hit); //ajustando minha sprite
			
			if(animation_end()) //se minha animação acabou
			{
				image_speed = 0; //paro no último frame
				
				//ficando pequeno
				image_xscale -= 0.03;
				image_yscale = image_xscale;
				
				//ajustando minha posição
				x += 0.4;
				y -= 0.4;
			}
			
			if(image_xscale <= 0) //se fiquei muito pequeno
			{
				instance_destroy(); //me destruo
			}
			
			break;
		}
		
		case "extra":
		{
			//cada torre controla a lógica de seu estado "extra"
			
			muda_sprite(sprite_extra); //ajustando minha sprite
			
			break;
		}
	}
}
else //se estou no álbum
{
	//DEFININDO MEU SPRITE
	muda_sprite(sprite_album);
	
	if(point_in_circle(mouse_x, mouse_y, x + 32, y + 32, 42) && mouse_check_button_pressed(mb_left))
	{
		if(instance_exists(oAlbum))
		{
			oAlbum.clicouQualPeixe = id;
		}
		else
		{
			msg_erro("Inventário");
		}
	}
	
	global.LVpeixes[numero] = level; 
	ataque = AtaqueAnim(numero, level); 
	vida_max = VidaAnim(numero,level);
	
	if salvou
	{
		save_game();	
		salvou = false;
	}
}