global.wave = 0; //onda de inimigos

///gerenciamento de etapas
function inicia_etapa(_indice)
{
	//debug
	//show_debug_message("entrando na etapa "+string(etapa));
	
	//botao album
	if(instance_exists(obj_botao_tutorial))
	{
		if(obj_tutorial.etapa > 17) instance_destroy(obj_botao_tutorial);
	}
	
	//impedindo que mensagens sumam
	if(instance_exists(obj_gerenciador))
	{
		obj_gerenciador.mensagem_fixa = true; 
	}
	else
	{
		msg_erro("obj_gerenciador");
	}
	
	//gravo que não completei a etapa atual
	global.tutorial[etapa] = false;
	
	//mensagens do big e mart
	if(etapa >= 17)
	{
		if(instance_exists(oAlbum))
		{
			oAlbum.mensagem_tutorial = mensagem_bigmart(msg_bigmart);
			msg_bigmart += 1;
		}
		else
		{
			msg_erro("oAlbum");
		}
	}
	
	switch(etapa)
	{
		//PARTE 1: JOGANDO
		case 0: //animais
		{
			if(instance_exists(obj_ani_clickable_pai))
			{
				var _meio_x_ani = obj_ani_clickable_pai.x + obj_ani_clickable_pai.sprite_width / 2;
				var _meio_y_ani = obj_ani_clickable_pai.y - obj_ani_clickable_pai.sprite_height / 2;
				//foco nos animais da hud
				cria_luz(_meio_x_ani, _meio_y_ani,TAM_X_FOCO_ETAPA_0, TAM_Y_FOCO_ETAPA_0);
			}
			else
			{
				msg_erro("Animal Clicável");
			}
			
			//luz no botao
			cria_luz((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2, 96, 96, false);
			
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2);
			
			//mensagem
			adicionar_mensagem("Contra os poluentes, sua linha de frente são os animais que aguardam aqui para serem convocados!");
			
			break;
		}
		case 1: //animais
		{
			if(instance_exists(obj_ani_clickable_pai))
			{
				var _meio_x_ani = obj_ani_clickable_pai.x + obj_ani_clickable_pai.sprite_width / 2;
				var _meio_y_ani = obj_ani_clickable_pai.y - obj_ani_clickable_pai.sprite_height / 2;
				
				//foco nos animais da hud
				cria_luz(_meio_x_ani, _meio_y_ani, TAM_X_FOCO_ETAPA_1, TAM_Y_FOCO_ETAPA_1);
			}
			else
			{
				msg_erro("Animal Clicável");
			}
			
			//mensagem
			adicionar_mensagem("Clique em um deles para convocá-lo, pagando com pérolas por sua ajuda.");
			
			break;
		}
		case 2: //animais
		{
			//foco na área abaixo do barco
			cria_luz(X_FOCO_ETAPA_2, Y_FOCO_ETAPA_2, TAM_X_FOCO_ETAPA_2, TAM_Y_FOCO_ETAPA_2);
			
			//mensagem
			adicionar_mensagem("Convocado o animal, posicione-o no mar, onde poderá enfrentar as ameaças.");
			
			break;
		}
		case 3: //pérolas
		{
			if(instance_exists(obj_ani_clickable_pai))
			{
				var _meio_x_ani = obj_ani_clickable_pai.x + obj_ani_clickable_pai.sprite_width / 2;
				var _cima_y_ani = obj_ani_clickable_pai.y - obj_ani_clickable_pai.sprite_height - 20;
				
				//foco 1: custo dos animais
				cria_luz(_meio_x_ani, _cima_y_ani, TAM_X_FOCO_1_ETAPA_3, TAM_Y_FOCO_1_ETAPA_3);
			}
			else
			{
				msg_erro("Animal Clicável");
			}
			
			//foco 2: pérolas do jogador
			cria_luz(X_FOCO_2_ETAPA_3, Y_FOCO_2_ETAPA_3, TAM_X_FOCO_2_ETAPA_3, TAM_Y_FOCO_2_ETAPA_3);
			
			//mensagem
			adicionar_mensagem("O custo para convocar cada animal é o número logo acima deles, e seu total de pérolas fica no canto superior esquerdo. ");
			adicionar_mensagem("Sempre que uma ameaça é destruída, você recebe mais pérolas.");
			adicionar_mensagem("Fique de olho nesses valores para não ficar sem combatentes!");
			
			//luz no botao
			cria_luz((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2, 96, 96, false);
			
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2);
			
			break;
		}
		case 4: //inimigos
		{
			//foco no barco
			if(instance_exists(obj_ini_ger_pai))
			{
				var _x_spawner = obj_ini_ger_pai.x;
				var _y_spawner = obj_ini_ger_pai.y;
				
				cria_luz(_x_spawner + 32, _y_spawner, sprite_get_width(spr_ini_ger_barco) + 64, 80);
			}
			else
			{
				msg_erro("Spawner");
			}
			
			//mensagem
			adicionar_mensagem("Nossos inimigos são aqueles que abandonam poluentes nos ambientes aquáticos e se beneficiam da pesca ilegal!");
			
			//luz no botao
			cria_luz((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2, 96, 96, false);
			
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2);
			
			break;
		}
		case 5: //ameaças e vida
		{
			//foco na vida do player (corais)
			cria_luz(room_width / 2, room_height - 64, 192, 64);
			
			//foco no barco
			if(instance_exists(obj_ini_ger_pai))
			{
				var _x_spawner = obj_ini_ger_pai.x;
				var _y_spawner = obj_ini_ger_pai.y;
				
				cria_luz(_x_spawner + 32, _y_spawner, sprite_get_width(spr_ini_ger_barco) + 64, 80);
			}
			else
			{
				msg_erro("Spawner");
			}
			
			//mensagem
			adicionar_mensagem("Os barcos jogarão lixo na água. Esses poluentes não podem chegar ao fundo do mar. Se isso acontecer, os corais começaram a esbranquiçar e, se não restar nenhum coral colorido, fim de jogo!");
			
			//luz no botao
			cria_luz((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2, 96, 96, false);
			
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2);
			
			break;
		}
		case 6: //movimentação
		{
			if(instance_exists(obj_ani_pai))
			{
				var _ani_x_meio = obj_ani_pai.x + obj_ani_pai.sprite_width / 2;
				var _ani_y_meio = obj_ani_pai.y - obj_ani_pai.sprite_height / 2;
				
				//foco na linha horizontal da altura do animal no grid,
				//com largura dos slots e centrada nele (animal)
				cria_luz(_ani_x_meio, _ani_y_meio, TAM_X_FOCO_ETAPA_6 * 2, TAM_Y_FOCO_ETAPA_6, false);
			}
			else
			{
				msg_erro("Animal");
			}
			
			//mensagem
			adicionar_mensagem("Os animais sabem se defender, eles atacarão assim que uma ameaça entrar em seu alcance, só precisam estar no lugar certo!");
			adicionar_mensagem("Movimente-os horizontalmente na linha onde estão, pressionando o botão esquerdo do mouse e arrastando de um lado para o outro.");
			
			break;
		}
		case 7: //testando gameplay
		{
			//sem foco de luz (tudo claro)
			cria_luz(X_FOCO_ETAPA_7, Y_FOCO_ETAPA_7, TAM_X_FOCO_ETAPA_7, TAM_Y_FOCO_ETAPA_7, false);
			
			//mensagem
			adicionar_mensagem("Veja, uma lata prontinha para poluir o mar! Não deixe que chegue ao fundo do mar!");
			
			//feedback visual de wave de inimigos
			inicia_contagem();
			//show_debug_message("contagem do tutorial");
			
			break;
		}
		case 8: //trompas
		{
			if(instance_exists(obj_trompa_pai))
			{
				var _trompa_x_meio = obj_trompa_pai.x + obj_trompa_pai.sprite_width / 2;
				var _trompa_y_meio = obj_trompa_pai. y + obj_trompa_pai.sprite_height / 2;
				
				//foco na trompa
				cria_luz(_trompa_x_meio, _trompa_y_meio, TAM_X_FOCO_ETAPA_8, TAM_Y_FOCO_ETAPA_8);
			}
			else
			{
				msg_erro("Trompa");
			}
			
			if(instance_exists(obj_ani_pai))
			{
				//foco no peixe
				cria_luz(obj_ani_pai.x + obj_ani_pai.sprite_width / 2, obj_ani_pai.y - obj_ani_pai.sprite_height / 2, 48, 48);
			}
			else
			{
				msg_erro("Animal");
			}
			
			//mensagem
			adicionar_mensagem("Muito bem! Mas as ameças podem ser muito piores do que isso e os barcos dificilmente ficarão parados, então, uma nadadeira a mais sempre cai bem!");
			adicionar_mensagem("Clique em uma trompa de invocação para selecioná-la, depois, clique no animal que deseja ajudar.");
			
			break;
		}
		case 9: //trompas
		{
			if(instance_exists(obj_trompa_pai))
			{
				with(obj_trompa_pai)
				{
					if(instance_exists(obj_ani_pai))
					{
						obj_ani_pai.EfeitoCarta = true; //gravo que a torre ta sob efeito
						aplicar_em(obj_ani_pai); //chama o aplicar_em() para a torre
						cooldown = cooldownSave; //reinicia meu cooldown
						selecionado = false; //me desseleciono
						obj_ani_pai.selecionado = false; //desseleciono a torre
						layer_add_instance("Torres", obj_ani_pai.id);
						ativo = true; //gravo que to ativo
					}
					else
					{
						msg_erro("Animal");
					}
					
					var offset = 4; // margem opcional
					var x_circulo = x + sprite_width - offset;
					var y_circulo = y + sprite_height - offset;
					
					//foco (1) no cooldown da trompa
					cria_luz(x_circulo,y_circulo, TAM_X_FOCO_1_ETAPA_9, TAM_Y_FOCO_1_ETAPA_9);
				}
			}
			else
			{
				msg_erro("Trompa");
			}
			
			//foco (2) na duração da trompa
			if(instance_exists(obj_feedback_duracao))
			{
				with(obj_feedback_duracao)
				{
					cria_luz(x, y, TAM_X_FOCO_2_ETAPA_9, TAM_Y_FOCO_2_ETAPA_9);
				}
			}
			else
			{
				msg_erro("Duração");
			}
			
			//mensagem
			adicionar_mensagem("Apesar de não ser necessário gastar pérolas, a ajuda das trompas tem um tempo de duração e um tempo recarga para se beneficiar delas. Fique atento!");
			
			//luz no botao
			cria_luz((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2, 96, 96, false);
			
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2);
			
			break;
		}
		case 10: //testando gameplay
		{
			//resetando a trompa
			if(instance_exists(obj_trompa_pai))
			{
				with(obj_trompa_pai)
				{
					if(instance_exists(obj_ani_pai))
					{
						obj_ani_pai.EfeitoCarta = true; //gravo que a torre ta sob efeito
						aplicar_em(obj_ani_pai); //chama o aplicar_em() para a torre
						cooldown = cooldownSave; //reinicia meu cooldown
						selecionado = false; //me desseleciono
						obj_ani_pai.selecionado = false; //desseleciono a torre
						layer_add_instance("Torres", obj_ani_pai.id);
						ativo = true; //gravo que to ativo
					}
					else
					{
						msg_erro("Animal");
					}
				}
			}
			else
			{
				msg_erro("Trompa");
			}
			
			//sem foco de luz (tudo claro)
			cria_luz(X_FOCO_ETAPA_7, Y_FOCO_ETAPA_7, TAM_X_FOCO_ETAPA_7, TAM_Y_FOCO_ETAPA_7, false);
			
			//mensagem
			adicionar_mensagem("Lá vem mais ameaças!");
			
			//feedback visual de wave de inimigos
			inicia_contagem();
			//show_debug_message("contagem do tutorial");
			
			break;
		}
		case 11: //especiais
		{
			if(instance_exists(obj_especial_pai))
			{
				var _especial_x_meio = obj_especial_pai.x + obj_especial_pai.sprite_width / 2;
				var _especial_y_meio = obj_especial_pai. y + obj_especial_pai.sprite_height / 2;
				
				//foco no especial
				cria_luz(_especial_x_meio, _especial_y_meio, TAM_X_FOCO_ETAPA_11, TAM_Y_FOCO_ETAPA_11);
			}
			else
			{
				msg_erro("Especial");
			}
			
			//mensagem
			adicionar_mensagem("As vezes a ajuda das Trompas não é suficiente, nesses casos, chame uma ajuda especial!");
			adicionar_mensagem("Assim como as Trompas, os Especiais não lhe custam pérolas, mas tem duração e recarga.");
			
			//luz no botao
			cria_luz((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2, 96, 96, false);
			
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_0 + X2_CLICK_ETAPA_0) / 2, (Y1_CLICK_ETAPA_0 + Y2_CLICK_ETAPA_0) / 2);
			
			
			break;
		}
		case 12: //testando gameplay
		{
			//sem foco de luz (tudo claro)
			cria_luz(X_FOCO_ETAPA_7, Y_FOCO_ETAPA_7, TAM_X_FOCO_ETAPA_7, TAM_Y_FOCO_ETAPA_7, false);
			
			//mensagem
			adicionar_mensagem("Essa é das grandes, use o especial!");
			
			//feedback visual de wave de inimigos
			inicia_contagem();
			//show_debug_message("contagem do tutorial");
			
			break;
		}
		case 13: //ostra
		{
			if(instance_exists(obj_item_ostra_clickable))
			{
				//foco na ostra
				with(obj_item_ostra_clickable) 
				{
					cria_luz(x, y, TAM_X_FOCO_ETAPA_13, TAM_Y_FOCO_ETAPA_13);
				}
			}
			else
			{
				msg_erro("Ostra");
			}
			
			if(instance_exists(obj_ani_pai))
			{
				//foco no peixe
				cria_luz(obj_ani_pai.x + obj_ani_pai.sprite_width / 2, obj_ani_pai.y - obj_ani_pai.sprite_height / 2, 48, 48);
			}
			else
			{
				msg_erro("Animal");
			}
			
			//mensagem
			adicionar_mensagem("Nem sempre a primeira escolha é a melhor. A Ostra está aí para isso, ela permite remover um animal do mar, devolvendo metade das pérolas gastas para convocá-lo.");
			adicionar_mensagem("Selecione a Ostra, depois clique no animal que deseja remover.");
			
			break;
		}
		case 14: //progressão
		{
			//foco nos reciclaveis
			cria_luz(40, 20, 96, 48);
			
			//criando o pós partida
			if(!instance_exists(oPosPartida))
			{
				var _inst = instance_create_layer(x,y,"UI",oPosPartida);
				_inst.ganhou = true;
				_inst.mens = "";
			}
			
			//mensagem
			adicionar_mensagem("Muito bem, a vida marinha venceu hoje!");
			adicionar_mensagem("Ao sair vitorioso, você coleta recicláveis que pode trocar com Big e Mart em troca da ajuda deles!");
			
			break;
		}
		
		//PARTE 2: MAPA
		case 15: //progressão
		{
			//achando o botão correto
			var _botao = noone;
			
			if(instance_exists(oButton))
			{
				with(oButton)
				{
					if(irPara == rm_fase_1)
					{
						_botao = id;
					}
				}
				
				if(_botao != noone)
				{
					//foco no botão de play da fase 1
					cria_luz(_botao.x, _botao.y, TAM_X_FOCO_ETAPA_15, TAM_Y_FOCO_ETAPA_15, false);
				}
				else
				{
					msg_erro("Botão Fase 1");
				}
			}
			else
			{
				msg_erro("Botão");
			}
			
			//mensagem
			adicionar_mensagem("Após cada vitória, você desbloqueia a próxima área que precisa da sua ajuda.");
			adicionar_mensagem("Mas tome cuidado, cada área será mais desafiadora que a anterior.");
			adicionar_mensagem("Agora vá, convide seus amigos para enfrentar a próxima ameaça!");
			
			break;
		}
		case 16: //loja, coleção
		{
			if(instance_exists(oButton))
			{
				var _album = noone;
				
				with(oButton)
				{
					if(sprite_index == spr_botao_album)
					{
						_album = id;
					}
				}
				
				if(_album != noone)
				{
					//foco no botão da loja, coleção
					cria_luz(_album.x, _album.y, 96, 96);
				}
			}
			else
			{
				msg_erro("Botão");
			}
			
			//mensagem
			adicionar_mensagem("Oh, não! Que tragédia...");
			adicionar_mensagem("Para desafios maiores, precisará de reforços!");
			adicionar_mensagem("Acesse a Coleção de Big & Mart para obter informações sobre as ameaças e para trocar os recicláveis que coletou por ajuda!");
			
			break;
		}
		case 17: //loja, coleção
		{
			////sem foco de luz (tudo claro)
			//cria_luz(X_FOCO_ETAPA_7, Y_FOCO_ETAPA_7, TAM_X_FOCO_ETAPA_7, TAM_Y_FOCO_ETAPA_7, false);
			
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);
			
			break;
		}
		case 18: //loja, coleção
		{
			//aba animais
			if(instance_exists(oButtonAba))
			{
				var _aba_ani = noone;
				var _meio_x_aba_ani = 0;
				var _meio_y_aba_ani = 0;
				
				with(oButtonAba)
				{
					if(aba == 1)
					{
						_aba_ani = id;
					}
				}
				
				if(_aba_ani != noone)
				{
					_meio_x_aba_ani = _aba_ani.x + _aba_ani.sprite_width / 2;
					_meio_y_aba_ani = _aba_ani.y + _aba_ani.sprite_height / 2;
					
					//foco na aba "animais"
					cria_luz(_meio_x_aba_ani, _meio_y_aba_ani, 64, 64);
				}
			}
			
			break;
		}
		case 19: //aba animais
		{
			//foco nos animais
			if (instance_exists(obj_ani_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_ani_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_ani_pai); i++)
				{
					inst = instance_find(obj_ani_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_y_ani = obj_ani_pai.y - obj_ani_pai.sprite_height / 2;
				var _meio_x_ani = (maior_x + menor_x) / 2;
				
				//foco em um animal
				cria_luz(_meio_x_ani + 32, _meio_y_ani + 48, maior_x - menor_x + 160, 96);
			}
			
			break;
		}
		case 20: //loja, coleção
		{
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);
			
			//foco nos animais
			if (instance_exists(obj_ani_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_ani_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_ani_pai); i++)
				{
					inst = instance_find(obj_ani_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_y_ani = obj_ani_pai.y - obj_ani_pai.sprite_height / 2;
				var _meio_x_ani = (maior_x + menor_x) / 2;
				
				//foco em um animal
				cria_luz(_meio_x_ani + 64, _meio_y_ani + 48, maior_x - menor_x + 160, 96);
			}
			
			break;
		}
		case 21: //aba ameaças
		{
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);
			
			//foco nas "ameaças"
			if(instance_exists(oButtonAba))
			{
				var _aba_ame = noone;
				var _meio_x_aba_ame = 0;
				var _meio_y_aba_ame = 0;
				
				with(oButtonAba)
				{
					if(aba == 2)
					{
						_aba_ame = id;
					}
				}
				
				if(_aba_ame != noone)
				{
					_meio_x_aba_ame = _aba_ame.x + _aba_ame.sprite_width / 2;
					_meio_y_aba_ame = _aba_ame.y + _aba_ame.sprite_height / 2;
					
					//foco na aba "trompas"
					cria_luz(_meio_x_aba_ame, _meio_y_aba_ame, 64, 64);
				}
			}
			
			break;
		}
		case 22: //loja, coleção
		{
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);
			
			//foco nos inimigos
			if(instance_exists(oButtonAba))
			{
				var _aba_tro = noone;
				
				with(oButtonAba)
				{
					if(aba == 3)
					{
						_aba_tro = id;
					}
				}
				
				if(_aba_tro != noone)
				{
					if(instance_exists(obj_ini_ame_pai))
					{
						var _x = RES_W / 2 - _aba_tro.x;
						var _y = obj_ini_ame_pai.y;
						var _tam_x = instance_number(obj_ini_ame_pai) * 96;
					
						cria_luz(_x + 160, _y +32, _tam_x + 194, 96);
					}
					else
					{
						msg_erro("Ameaça");
					}
				}
				else
				{
					msg_erro("Aba");
				}
			}
			
			break;
		}
		case 23: //aba trompas
		{
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);
			
			//foco na aba "trompas"
			if(instance_exists(oButtonAba))
			{
				var _aba_tro = noone;
				var _meio_x_aba_tro = 0;
				var _meio_y_aba_tro = 0;
				
				with(oButtonAba)
				{
					if(aba == 3)
					{
						_aba_tro = id;
					}
				}
				
				if(_aba_tro != noone)
				{
					_meio_x_aba_tro = _aba_tro.x + _aba_tro.sprite_width / 2;
					_meio_y_aba_tro = _aba_tro.y + _aba_tro.sprite_height / 2;
					
					//foco na aba "trompas"
					cria_luz(_meio_x_aba_tro, _meio_y_aba_tro, 64, 64);
				}
			}
			
			break;
		}
		case 24: //loja, coleção
		{
			//foco nas "trompas"
			if (instance_exists(obj_trompa_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_trompa_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_trompa_pai); i++)
				{
					inst = instance_find(obj_trompa_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_x_tro = (maior_x + menor_x) / 2;
				var _meio_y_tro = obj_trompa_pai.y + obj_trompa_pai.sprite_height / 2;
				
				//foco em uma trompa
				cria_luz(_meio_x_tro, _meio_y_tro, 7 * 64 + 96, 64 + 96);
			}
			else
			{
				msg_erro("Trompa");
			}
			
			break;
		}
		case 25: //trompas
		{
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);

			//foco nas "trompas"
			if (instance_exists(obj_trompa_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_trompa_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_trompa_pai); i++)
				{
					inst = instance_find(obj_trompa_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
					
					var _meio_x_tro = (maior_x + menor_x) / 2;
				}
				
				var _meio_y_tro = obj_trompa_pai.y + obj_trompa_pai.sprite_height / 2;
				
				//foco em uma trompa
				cria_luz(RES_W / 2, oAlbum.yInicial + sprite_get_height(spr_trompa_1) / 2, 7 * 64 + 288, 64 + 96);
			}
			else
			{
				msg_erro("Trompa");
			}
			
			break;
		}
		case 26: //aba especiais
		{
			//foco na aba "especiais"
			if(instance_exists(oButtonAba))
			{
				var _aba_spc = noone;
				var _meio_x_aba_spc = 0;
				var _meio_y_aba_spc = 0;
				
				with(oButtonAba)
				{
					if(aba == 4)
					{
						_aba_spc = id;
					}
				}
				
				if(_aba_spc != noone)
				{
					_meio_x_aba_spc = _aba_spc.x + _aba_spc.sprite_width / 2;
					_meio_y_aba_spc = _aba_spc.y + _aba_spc.sprite_height / 2;
					
					//foco na aba "especiais"
					cria_luz(_meio_x_aba_spc, _meio_y_aba_spc, 64, 64);
				}
			}
				
			break;
		}
		case 27: //especiais
		{
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);

			//foco nos "especiais"
			if (instance_exists(obj_especial_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_especial_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_especial_pai); i++)
				{
					inst = instance_find(obj_especial_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_x_spc = (maior_x + menor_x) / 2;
				var _meio_y_spc = obj_especial_pai.y + obj_especial_pai.sprite_height / 2;
				
				//foco em um especial
				cria_luz(_meio_x_spc + 32, _meio_y_spc, 2 * 64 + 160, 64 + 96);
			}
			
			break;
		}
		case 28: //encerramento
		{
			//criando botão para clicar
			cria_botao((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2);
			cria_luz((X1_CLICK_ETAPA_17 + X2_CLICK_ETAPA_17) / 2, (Y1_CLICK_ETAPA_17 + Y2_CLICK_ETAPA_17) / 2, 96, 96, false);
			
			break;
		}
		case 29: //encerramento
		{
			if(instance_exists(oButton))
			{
				var _botao_close = noone;
				
				with(oButton)
				{
					if(sprite_index == spr_botao_close)
					{
						_botao_close = id;
					}
				}
				
				if(_botao_close != noone)
				{
					//foco no botão "X"
					cria_luz(_botao_close.x, _botao_close.y, 96, 96, false);
				}
				else
				{
					msg_erro("Botão close");
				}
			}
			else
			{
				msg_erro("Botão close");
				return false;
			}
			
			break;
		}
		case 30:
		{
			Transition(TRANS_MODE.GOTO, rm_mapa);

			instance_destroy();
			
			break;
		}
	}
}

function input_confirmado(_etapa)
{
	switch(_etapa)
	{
		//PARTE 1: JOGANDO
		case 0: //animais
		{
			return clicou_na_area(X1_CLICK_ETAPA_0, Y1_CLICK_ETAPA_0, X2_CLICK_ETAPA_0, Y2_CLICK_ETAPA_0);
		}
		case 1: //animais
		{
			if(instance_exists(obj_ani_clickable_pai))
			{
				var ani_x1 = obj_ani_clickable_pai.x;
				var ani_y1 = obj_ani_clickable_pai.y - obj_ani_clickable_pai.sprite_height;
				var ani_x2 = obj_ani_clickable_pai.x + obj_ani_clickable_pai.sprite_height;
				var ani_y2 = obj_ani_clickable_pai.y;
				
				if(clicou_na_area(ani_x1, ani_y1, ani_x2, ani_y2))
				{
					return true;
				}
			}
			else
			{
				return false;
			}
		}
		case 2: //animais
		{
			return global.coins < 250 && instance_exists(obj_ani_pai);
		}
		case 3: //pérolas
		{
			return clicou_na_area(X1_CLICK_ETAPA_0, Y1_CLICK_ETAPA_0, X2_CLICK_ETAPA_0, Y2_CLICK_ETAPA_0);
		}
		case 4: //inimigos
		{
			return clicou_na_area(X1_CLICK_ETAPA_0, Y1_CLICK_ETAPA_0, X2_CLICK_ETAPA_0, Y2_CLICK_ETAPA_0);
		}
		case 5: //ameças e vida
		{
			return clicou_na_area(X1_CLICK_ETAPA_0, Y1_CLICK_ETAPA_0, X2_CLICK_ETAPA_0, Y2_CLICK_ETAPA_0);
		}
		case 6: //movimentação
		{
			if(instance_exists(obj_ani_pai))
			{
				if(obj_ani_pai.x_anterior != obj_ani_pai.x)
				{
					return true;
				}
			}
			return false;
		}
		case 7: //testando a gameplay
		{	
			return global.wave == 1;
		}
		case 8: //trompas
		{
			if(!instance_exists(obj_ani_pai))
			{
				msg_erro("Animal");
				return false;
			}
			
			if(instance_exists(obj_trompa_pai))
			{
				return obj_trompa_pai.ativo;
			}
			else
			{
				msg_erro("Trompa");
				return false;
			}
		}
		case 9: //trompas
		{
			return clicou_na_area(X1_CLICK_ETAPA_0, Y1_CLICK_ETAPA_0, X2_CLICK_ETAPA_0, Y2_CLICK_ETAPA_0);
		}
		case 10: //testando a gameplay
		{
			return global.wave == 2;
		}
		case 11: //especial
		{
			return clicou_na_area(X1_CLICK_ETAPA_0, Y1_CLICK_ETAPA_0, X2_CLICK_ETAPA_0, Y2_CLICK_ETAPA_0);
		}
		case 12: //testando a gameplay
		{
			return global.wave == 3;
		}
		case 13: //ostra
		{
			if(instance_exists(obj_item_ostra_dragged))
			{
				return obj_item_ostra_dragged.criei;
			}
			else
			{
				msg_erro("Ostra");
				return false;
			}
		}
		case 14: //progressão
		{
			//return room == rm_mapa;
			return global.moedas > 0;
		}
		
		//PARTE 2: MAPA
		case 15: //progressão
		{
			if(instance_exists(obj_tutorial))
			{
				return obj_tutorial.timer >= 600;
			}
			else
			{
				msg_erro("Tutorial");
				return false;
			}
		}
		case 16: //loja, coleção
		{
			if(instance_exists(oButton))
			{
				var _album = noone;
				
				with(oButton)
				{
					if(sprite_index == spr_botao_album)
					{
						_album = id;
					}
				}
				
				if(_album != noone)
				{
					return clicou_na_area(_album.x - _album.sprite_width / 2, _album.y - _album.sprite_height / 2, _album.x + _album.sprite_width / 2, _album.y + _album.sprite_height / 2);
				}
				else
				{
					return false;
				}
			}
			else
			{
				msg_erro("Botão");
				return false;
			}
		}
		case 17: //loja, coleção
		{
			return tutorial_dialogo(3, X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17, Y2_CLICK_ETAPA_17);
		}
		case 18: //loja, coleção
		{
			//aba animais
			if(instance_exists(oButtonAba))
			{
				var _aba_ani = noone;
				with(oButtonAba)
				{
					if(aba == 1)
					{
						_aba_ani = id;
					}
				}
				
				if(_aba_ani != noone)
				{
					var _meio_x_aba_ani = _aba_ani.x + _aba_ani.sprite_width / 2;
					var _meio_y_aba_ani = _aba_ani.y + _aba_ani.sprite_height / 2;
				}
				
				//foco na aba "animais"
				return clicou_na_area(_aba_ani.x, _aba_ani.y, _aba_ani.x + _aba_ani.sprite_width, _aba_ani.y + _aba_ani.sprite_height);
			}
		}
		case 19: //aba animais
		{
			if (instance_exists(obj_ani_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_ani_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_ani_pai); i++)
				{
					inst = instance_find(obj_ani_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_y_ani = obj_ani_pai.y - obj_ani_pai.sprite_height / 2;
				var _meio_x_ani = maior_x + menor_x / 2;
				
				//foco em um animal
				return tutorial_dialogo(5, 0, 0, room_width, room_height);
			}
		}
		case 20: //loja, coleção
		{
			//aba ameaças
			if(instance_exists(oButtonAba))
			{
				var _aba_ame = noone;
				
				with(oButtonAba)
				{
					if(aba == 2)
					{
						_aba_ame = id;
					}
				}
				
				if(_aba_ame != noone)
				{
					//foco na aba "ameaças"
					return clicou_na_area(_aba_ame.x, _aba_ame.y, _aba_ame.x + _aba_ame.sprite_width, _aba_ame.y + _aba_ame.sprite_height)
					|| clicou_na_area(X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17,Y2_CLICK_ETAPA_17);
				}
			}
		}
		case 21: //loja, coleção
		{
			//aba ameaças
			if(instance_exists(oButtonAba))
			{
				var _aba_ame = noone;
				
				with(oButtonAba)
				{
					if(aba == 2)
					{
						_aba_ame = id;
					}
				}
				
				//foco na aba "ameaças"
				return tutorial_dialogo(7, _aba_ame.x, _aba_ame.y, _aba_ame.x + _aba_ame.sprite_width, _aba_ame.y + _aba_ame.sprite_height)
				|| tutorial_dialogo(7, X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17, Y2_CLICK_ETAPA_17);
			}
			
			
		}
		case 22: //aba ameaças
		{	
			//ameaças
			if (instance_exists(obj_ini_ame_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_ini_ame_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_ini_ame_pai); i++)
				{
					inst = instance_find(obj_ini_ame_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_y_ame = obj_ini_ame_pai.y;
				var _meio_x_ame = maior_x + menor_x / 2;
				
				//foco nas ameaças
				return tutorial_dialogo(8, menor_x, obj_ini_ame_pai.y - obj_ini_ame_pai.sprite_height / 2, maior_x, obj_ini_ame_pai.y + obj_ini_ame_pai.sprite_height / 2)
				|| tutorial_dialogo(8, X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17, Y2_CLICK_ETAPA_17);
			}
		}
		case 23: //aba trompas
		{
			//foco na aba "trompas"
			if(instance_exists(oButtonAba))
			{
				var _aba_tro = noone;
				with(oButtonAba)
				{
					if(aba == 3)
					{
						_aba_tro = id;
					}
				}
				
				if(_aba_tro != noone)
				{
					var _meio_x_aba_tro = _aba_tro.x + _aba_tro.sprite_width / 2;
					var _meio_y_aba_tro = _aba_tro.y + _aba_tro.sprite_height / 2;
				}
				
				//foco na aba "trompas"
				return tutorial_dialogo(8,_aba_tro.x, _aba_tro.y, _aba_tro.x + _aba_tro.sprite_width, _aba_tro.y + _aba_tro.sprite_height)
				|| tutorial_dialogo(8, X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17, Y2_CLICK_ETAPA_17);
			}
		}
		case 24: //loja, coleção
		{
			//foco na aba "trompas"
			if(instance_exists(oButtonAba))
			{
				var _aba_tro = noone;
				with(oButtonAba)
				{
					if(aba == 3)
					{
						_aba_tro = id;
					}
				}
				
				if(_aba_tro != noone)
				{
					var _meio_x_aba_tro = _aba_tro.x + _aba_tro.sprite_width / 2;
					var _meio_y_aba_tro = _aba_tro.y + _aba_tro.sprite_height / 2;
				}
				
				//foco na aba "trompas"
				return clicou_na_area(_aba_tro.x, _aba_tro.y, _aba_tro.x + _aba_tro.sprite_width, _aba_tro.y + _aba_tro.sprite_height);
			}
		}
		case 25: //trompas
		{
			//foco nas "trompas"
			if (instance_exists(obj_trompa_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_trompa_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_trompa_pai); i++)
				{
					inst = instance_find(obj_trompa_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_y_tro = obj_trompa_pai.y + obj_trompa_pai.sprite_height / 2;
				var _meio_x_tro = maior_x + menor_x / 2;
				
				//foco em uma trompa
				return tutorial_dialogo(12, menor_x, obj_trompa_pai.y, maior_x, obj_trompa_pai.y + obj_trompa_pai.sprite_height)
				|| tutorial_dialogo(12, X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17, Y2_CLICK_ETAPA_17);
			}
		}
		case 26: //aba especiais
		{
			//foco na aba "especiais"
			if(instance_exists(oButtonAba))
			{
				var _aba_spc = noone;
				
				with(oButtonAba)
				{
					if(aba == 4)
					{
						_aba_spc = id;
					}
				}
				
				if(_aba_spc != noone)
				{
					var _meio_x_aba_spc = _aba_spc.x + _aba_spc.sprite_width / 2;
					var _meio_y_aba_spc = _aba_spc.y + _aba_spc.sprite_height / 2;
					
					//foco na aba "especiais"
					return clicou_na_area(_aba_spc.x, _aba_spc.y, _aba_spc.x + _aba_spc.sprite_width, _aba_spc.y + _aba_spc.sprite_height);
				}
			}
		}
		case 27: //especiais
		{
			if (instance_exists(obj_especial_pai))
			{
				// Pega a primeira instância como base
				var inst = instance_find(obj_especial_pai, 0);
				var menor_x = inst.x;
				var maior_x = inst.x;
				var menor_id = inst;
				var maior_id = inst;
				
				// Começa do 1, pois o 0 já foi usado
				for (var i = 1; i < instance_number(obj_especial_pai); i++)
				{
					inst = instance_find(obj_especial_pai, i);
					
					if (inst.x < menor_x)
					{
						menor_x = inst.x;
						menor_id = inst;
					}
					
					if (inst.x > maior_x)
					{
						maior_x = inst.x;
						maior_id = inst;
					}
				}
				
				var _meio_y_spc = obj_especial_pai.y + obj_especial_pai.sprite_height / 2;
				var _meio_x_spc = maior_x + menor_x / 2;
				
				//foco em um especial
				return tutorial_dialogo(14, menor_x, obj_especial_pai.y, maior_x, obj_especial_pai.y+obj_especial_pai.sprite_height)
				|| tutorial_dialogo(14, X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17, Y2_CLICK_ETAPA_17);
			}
		}
		case 28: //encerramento
		{
			return tutorial_dialogo(16, X1_CLICK_ETAPA_17, Y1_CLICK_ETAPA_17, X2_CLICK_ETAPA_17, Y2_CLICK_ETAPA_17);
		}
		case 29:
		{
			//acabou
			if(instance_exists(oButton))
			{
				var _botao_close = noone;
				
				with(oButton)
				{
					if(sprite_index == spr_botao_close)
					{
						_botao_close = id;
					}
				}
				
				if(_botao_close != noone)
				{
					//foco no botão "X"
					return clicou_na_area(_botao_close.x - _botao_close.sprite_width / 2, _botao_close.y - _botao_close.sprite_height / 2, _botao_close.x + _botao_close.sprite_width / 2, _botao_close.y + _botao_close.sprite_height / 2);
				}
			}
			else
			{
				msg_erro("Botão");
				return false;
			}
		}
	}
}

function avancar_etapa()
{
	//show_debug_message("avançar etapa chamada");
	obj_gerenciador.mensagem_fixa = false;	//Permite que mensagens sumam
	global.tutorial[etapa] = true;			//Marca a etapa atual como concluída
	with (obj_luz) instance_destroy();		//Remove os focos de luz atuais
	
	with(obj_tutorial)
	{
		etapa += 1;							//Incrementa o etapa
		inicia_etapa(etapa);				//Passa para a próxima etapa
	}
}

///checagens específicas
function mensagem_bigmart(qualMensagem)
{
	var _msg_list = [
		/*0*/"Olá, amigo! Eu sou Big, o estetacanto (Stethacanthus). E eu sou Mart, o tubarão-martelo (Sphyrna spp.)."
		/*1*/,"Estamos aqui para ajudá-lo no que precisar, e por nossa ajuda, tudo o que pedimos é um pouquinho de material reciclável. Considerado lixo pela maioria, os recicláveis podem se tornar coisas novinhas em folha sem poluir o meio ambiente!"
		/*2*/,"Porém, aqui é mais que uma loja... é o refúgio de nossos amigos resgatados e o local onde preservamos o conhecimento dos mares!"
		/*3*/,"Você pode acessar as informações sobre seus amigos por ali!"
		/*4*/,"Aqui, você pode ver um por um dos seus amigos."
		/*5*/,"Infelizmente, soubemos que eles estão distantes, no momento, mas temos certeza que conseguirá resgatá-los!"
		/*6*/,"Por ali, você pode acessar as informações sobre as ameças que já viu!"
		/*7*/,"Veja só, que nojeira! Guardamos esse lixo para aprendermos mais sobre como combatê-los, seus perigos e se há meios de substituí-los por alternativas não poluentes!"
		/*8*/,"Oh, sim! As maravilhosas Trompas de Invocação. Podemos construí-las para você se trouxer material suficiente!"
		/*9*/,"Acesse por ali, para ver do que estamos falando."
		/*10*/,"Quando sopradas, as trompas invocam uma ajuda para você ou seus amigos. Muito úteis contra ameaças difíceis de superar!"
		/*11*/,"Pobres rêmoras, levadas para longe assim como seus amigos."
		/*12*/,"Quase íamos nos esquecendo das ajudas especiais! Ali você pode ver quais são e quanto custaria para te ajudar a alcançá-las."
		/*13*/,"Já está familiarizado com o Reforço Coralino, mas fiquei sabendo que o Golfinho foi levado pelas embarcações também!"
		/*14*/,"Ajude-nos a te ajudar, traga seus recicláveis!"
		/*15*/,"Bom, você já está pronto para lutar novamente! Sempre que precisar de ajuda ou informação, não hesite em nos visitar."
		/*16*/,"O oceano precisa de você. Que os mares estejam contigo."
		/*17*/,"Adeus!"
	];
	
	return _msg_list[qualMensagem];
}

///@func clicou_na_area(_x1, _y1, _x2, _y2)
///@desc Verifica clique na área retangular formada pelos pontos superior esquerdo (_x1, _y1) e inferior direito (_x2, _y2)
///
///@return (bool) true = clicou / false = não clicou
function clicou_na_area(_x1, _y1, _x2, _y2)
{
	
	if(mouse_check_button_released(mb_left) && point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2))
	{
		return true;
	}
	
	return false;
}

///@func tutorial_dialogo(_limite_fala, _x1, _y1, _x2, _y2)
///@desc Avança falas de Big & Mart e só finaliza quando clica na área específica.
///
///@return (bool) true = etapa concluída / false = continua na mesma etapa

function tutorial_dialogo(_limite_fala, _x1, _y1, _x2, _y2)
{
	//exige clique na área correta
	if(clicou_na_area(_x1, _y1, _x2, _y2))
	{
		//Se ainda tem falas a exibir
		if(msg_bigmart < _limite_fala)
		{
			oAlbum.mensagem_tutorial = mensagem_bigmart(msg_bigmart);
			msg_bigmart += 1;
		}
		else //Última fala
		{
			return true; //Etapa concluída
		}
	}
	
	return false; //Continua na mesma etapa
}

///ferramentas de foco
function cria_botao(_x, _y)
{
	if(!instance_exists(obj_botao_tutorial))
	{
		instance_create_layer(_x, _y, "UI", obj_botao_tutorial);
	}
}

/// @func cria_luz(_x, _y, _tam_x, _tam_y, _pulsa)
/// @desc Cria uma luz na posição e tamanho especificados.
/// @param _x (real) — posição x da luz (origem centro)
/// @param _y (real) — posição y da luz (origem centro)
/// @param _tam_x (real) — largura da luz (em pixels)
/// @param _tam_y (real) — altura da luz (em pixels)
/// @param _pulsa (boolean) — define se a luz pulsa ou não.
function cria_luz(_x, _y, _tam_x, _tam_y, _pulsa = true)
{
	if(!instance_exists(obj_iluminacao))
	{
	    instance_create_layer(0,0,"UI",obj_iluminacao);
	}
	
	with(obj_iluminacao)
	{
		//configurando minha luz
		luz_tam_x = _tam_x; //largura em pixels (este valor * 40)
		luz_tam_y = _tam_y; //altura em pixels (este valor * 40)
		
		//posição
		luz_pos_x = _x; //posição x (origem da sprite no centro dela)
		luz_pos_y = _y; //posição y (origem da sprite no centro dela)
	}
	
	var l = instance_create_layer(_x, _y, "Iluminacao", obj_luz);
	l.pos_x = _x;
	l.pos_y = _y;
	
	l.tam_x = _tam_x / l.sprite_width;
	l.tam_y = _tam_y / l.sprite_height;
	
	l.image_xscale = l.tam_x;
	l.image_yscale = l.tam_y;
	
	l.pulsa = _pulsa;
	
	return l;
}

#region debug
/// @func pular_para_etapa(_etapa_destino)
/// @desc Avança diretamente para a etapa informada, marcando todas anteriores como concluídas.
/// @param _etapa_destino (int) Número da etapa que deseja pular.
function pular_para_etapa(_etapa_destino)
{
	//Marca todas as etapas anteriores como concluídas
	for(var i = 0; i < _etapa_destino; i++)
	{
		global.tutorial[i] = true;
	}
	
	//Atualiza a etapa atual
	with(obj_tutorial)
	{
		etapa = _etapa_destino;
		inicia_etapa(etapa);
	}
}

#endregion

#region COORDENADAS DOS FOCOS
//animais na hud
//#macro X_FOCO_ETAPA_0 0
//#macro Y_FOCO_ETAPA_0 100
#macro TAM_X_FOCO_ETAPA_0 64
#macro TAM_Y_FOCO_ETAPA_0 64

//animais na hud
//#macro X_FOCO_ETAPA_1 0
//#macro Y_FOCO_ETAPA_1 100
#macro TAM_X_FOCO_ETAPA_1 64
#macro TAM_Y_FOCO_ETAPA_1 64

//área abaixo do barco
#macro X_FOCO_ETAPA_2 (832 + 448) / 2 //meio x dos slots na room
#macro Y_FOCO_ETAPA_2 (576 + 96) / 2 //meio y dos slots na room
#macro TAM_X_FOCO_ETAPA_2 832 - 448 //diferença dos extremos x dos slots na room
#macro TAM_Y_FOCO_ETAPA_2 576 - 96 //diferença dos extremos y dos slots na room

//custo dos animais
//#macro X_FOCO_1_ETAPA_3 0
//#macro Y_FOCO_1_ETAPA_3 100
#macro TAM_X_FOCO_1_ETAPA_3 32
#macro TAM_Y_FOCO_1_ETAPA_3 32
//pérolas do jogador
#macro X_FOCO_2_ETAPA_3 ((100 - sprite_get_width(spr_perola_hud) / 2) + (100 + sprite_get_width(spr_perola_hud) + string_length(string(global.wave + 1)) / 2)) / 2 + 16
#macro Y_FOCO_2_ETAPA_3 20
#macro TAM_X_FOCO_2_ETAPA_3 96
#macro TAM_Y_FOCO_2_ETAPA_3 48

//inimigos
//#macro X_FOCO_ETAPA_4 0
//#macro Y_FOCO_ETAPA_4 100
#macro TAM_X_FOCO_ETAPA_4 100
#macro TAM_Y_FOCO_ETAPA_4 100

//ameças e vida
//#macro X_FOCO_1_ETAPA_5 0
//#macro Y_FOCO_1_ETAPA_5 100
//#macro TAM_X_FOCO_1_ETAPA_5 100
//#macro TAM_Y_FOCO_1_ETAPA_5 100
//#macro X_FOCO_2_ETAPA_5 100
//#macro Y_FOCO_2_ETAPA_5 200
//#macro TAM_X_FOCO_2_ETAPA_5 100
//#macro TAM_Y_FOCO_2_ETAPA_5 100

//movimentação
//#macro X_FOCO_ETAPA_6 0
//#macro Y_FOCO_ETAPA_6 100
#macro TAM_X_FOCO_ETAPA_6 1280
#macro TAM_Y_FOCO_ETAPA_6 48

//gameplay
#macro X_FOCO_ETAPA_7 RES_W / 2
#macro Y_FOCO_ETAPA_7 RES_H / 2
#macro TAM_X_FOCO_ETAPA_7 RES_W
#macro TAM_Y_FOCO_ETAPA_7 RES_H

//trompa
//#macro X_FOCO_ETAPA_8 0
//#macro Y_FOCO_ETAPA_8 100
#macro TAM_X_FOCO_ETAPA_8 96
#macro TAM_Y_FOCO_ETAPA_8 96

//trompa
//cooldown
//#macro X_FOCO_1_ETAPA_9 0
//#macro Y_FOCO_1_ETAPA_9 100
#macro TAM_X_FOCO_1_ETAPA_9 32 
#macro TAM_Y_FOCO_1_ETAPA_9 32
//duração
//#macro X_FOCO_2_ETAPA_9 100
//#macro Y_FOCO_2_ETAPA_9 200
#macro TAM_X_FOCO_2_ETAPA_9 32
#macro TAM_Y_FOCO_2_ETAPA_9 32

//gameplay
//#macro X_FOCO_ETAPA_10 0
//#macro Y_FOCO_ETAPA_10 100
//#macro TAM_X_FOCO_ETAPA_10 100
//#macro TAM_Y_FOCO_ETAPA_10 100

//especial
//#macro X_FOCO_ETAPA_11 0
//#macro Y_FOCO_ETAPA_11 100
#macro TAM_X_FOCO_ETAPA_11 96
#macro TAM_Y_FOCO_ETAPA_11 96

//gameplay
//#macro X_FOCO_ETAPA_12 0
//#macro Y_FOCO_ETAPA_12 100
//#macro TAM_X_FOCO_ETAPA_12 100
//#macro TAM_Y_FOCO_ETAPA_12 100

//ostra
//#macro X_FOCO_ETAPA_13 0
//#macro Y_FOCO_ETAPA_13 100
#macro TAM_X_FOCO_ETAPA_13 48
#macro TAM_Y_FOCO_ETAPA_13 48

//progressão
//#macro X_FOCO_ETAPA_14 0
//#macro Y_FOCO_ETAPA_14 100
//#macro TAM_X_FOCO_ETAPA_14 100
//#macro TAM_Y_FOCO_ETAPA_14 100

//PARTE 2

//#macro X_FOCO_ETAPA_15 0
//#macro Y_FOCO_ETAPA_15 100
#macro TAM_X_FOCO_ETAPA_15 96
#macro TAM_Y_FOCO_ETAPA_15 96

//#macro X_FOCO_ETAPA_16 0
//#macro Y_FOCO_ETAPA_16 100
//#macro TAM_X_FOCO_ETAPA_16 100
//#macro TAM_Y_FOCO_ETAPA_16 100
//
//#macro X_FOCO_ETAPA_17 0
//#macro Y_FOCO_ETAPA_17 100
//#macro TAM_X_FOCO_ETAPA_17 100
//#macro TAM_Y_FOCO_ETAPA_17 100
//
//#macro X_FOCO_ETAPA_18 0
//#macro Y_FOCO_ETAPA_18 100
//#macro TAM_X_FOCO_ETAPA_18 100
//#macro TAM_Y_FOCO_ETAPA_18 100
//
//#macro X_FOCO_ETAPA_19 0
//#macro Y_FOCO_ETAPA_19 100
//#macro TAM_X_FOCO_ETAPA_19 100
//#macro TAM_Y_FOCO_ETAPA_19 100
//
//#macro X_FOCO_ETAPA_20 0
//#macro Y_FOCO_ETAPA_20 100
//#macro TAM_X_FOCO_ETAPA_20 100
//#macro TAM_Y_FOCO_ETAPA_20 100
//
//#macro X_FOCO_ETAPA_21 0
//#macro Y_FOCO_ETAPA_21 100
//#macro TAM_X_FOCO_ETAPA_21 100
//#macro TAM_Y_FOCO_ETAPA_21 100
//
//#macro X_FOCO_ETAPA_22 0
//#macro Y_FOCO_ETAPA_22 100
//#macro TAM_X_FOCO_ETAPA_22 100
//#macro TAM_Y_FOCO_ETAPA_22 100
//
//#macro X_FOCO_ETAPA_23 0
//#macro Y_FOCO_ETAPA_23 100
//#macro TAM_X_FOCO_ETAPA_23 100
//#macro TAM_Y_FOCO_ETAPA_23 100
//
//#macro X_FOCO_ETAPA_24 0
//#macro Y_FOCO_ETAPA_24 100
//#macro TAM_X_FOCO_ETAPA_24 100
//#macro TAM_Y_FOCO_ETAPA_24 100
//
//#macro X_FOCO_ETAPA_25 0
//#macro Y_FOCO_ETAPA_25 100
//#macro TAM_X_FOCO_ETAPA_25 100
//#macro TAM_Y_FOCO_ETAPA_25 100
//
//#macro X_FOCO_ETAPA_26 0
//#macro Y_FOCO_ETAPA_26 100
//#macro TAM_X_FOCO_ETAPA_26 100
//#macro TAM_Y_FOCO_ETAPA_26 100
#endregion

#region COORDENAS DE ONDE CLICAR
#macro X1_CLICK_ETAPA_0 1152 - 32
#macro Y1_CLICK_ETAPA_0 416 - 32
#macro X2_CLICK_ETAPA_0 1152 + 32
#macro Y2_CLICK_ETAPA_0 416 + 32

//#macro X1_CLICK_ETAPA_1 0
//#macro Y1_CLICK_ETAPA_1 0
//#macro X2_CLICK_ETAPA_1 100
//#macro Y2_CLICK_ETAPA_1 100

#macro X1_CLICK_ETAPA_2 448
#macro Y1_CLICK_ETAPA_2 96
#macro X2_CLICK_ETAPA_2 832
#macro Y2_CLICK_ETAPA_2 576

//#macro X1_CLICK_ETAPA_3 0
//#macro Y1_CLICK_ETAPA_3 0
//#macro X2_CLICK_ETAPA_3 100
//#macro Y2_CLICK_ETAPA_3 100
//
//#macro X1_CLICK_ETAPA_4 0
//#macro Y1_CLICK_ETAPA_4 0
//#macro X2_CLICK_ETAPA_4 100
//#macro Y2_CLICK_ETAPA_4 100
//
//#macro X1_CLICK_ETAPA_5 0
//#macro Y1_CLICK_ETAPA_5 0
//#macro X2_CLICK_ETAPA_5 100
//#macro Y2_CLICK_ETAPA_5 100
//
//#macro X1_CLICK_ETAPA_9 0
//#macro Y1_CLICK_ETAPA_9 0
//#macro X2_CLICK_ETAPA_9 100
//#macro Y2_CLICK_ETAPA_9 100
//
//#macro X1_CLICK_ETAPA_11 0
//#macro Y1_CLICK_ETAPA_11 0
//#macro X2_CLICK_ETAPA_11 100
//#macro Y2_CLICK_ETAPA_11 100
//
//#macro X1_CLICK_ETAPA_13 0
//#macro Y1_CLICK_ETAPA_13 0
//#macro X2_CLICK_ETAPA_13 100
//#macro Y2_CLICK_ETAPA_13 100
//
//#macro X1_CLICK_ETAPA_14 0
//#macro Y1_CLICK_ETAPA_14 0
//#macro X2_CLICK_ETAPA_14 100
//#macro Y2_CLICK_ETAPA_14 100
//
//#macro X1_CLICK_ETAPA_15 0
//#macro Y1_CLICK_ETAPA_15 0
//#macro X2_CLICK_ETAPA_15 100
//#macro Y2_CLICK_ETAPA_15 100
//
//#macro X1_CLICK_ETAPA_16 0
//#macro Y1_CLICK_ETAPA_16 0
//#macro X2_CLICK_ETAPA_16 100
//#macro Y2_CLICK_ETAPA_16 100

//botão
#macro X1_CLICK_ETAPA_17 160 - 32
#macro Y1_CLICK_ETAPA_17 576 - 32
#macro X2_CLICK_ETAPA_17 160 + 32
#macro Y2_CLICK_ETAPA_17 576 + 32

//aba animais
#macro X1_CLICK_ETAPA_18 160
#macro Y1_CLICK_ETAPA_18 32
#macro X2_CLICK_ETAPA_18 160 + 32
#macro Y2_CLICK_ETAPA_18 32 + 32

//animal
//#macro X1_CLICK_ETAPA_19 0
//#macro Y1_CLICK_ETAPA_19 0
//#macro X2_CLICK_ETAPA_19 100
//#macro Y2_CLICK_ETAPA_19 100

//aba inimigos
#macro X1_CLICK_ETAPA_20 224
#macro Y1_CLICK_ETAPA_20 32
#macro X2_CLICK_ETAPA_20 224 + 32
#macro Y2_CLICK_ETAPA_20 32 + 32

//inimigo
//#macro X1_CLICK_ETAPA_21 0
//#macro Y1_CLICK_ETAPA_21 0
//#macro X2_CLICK_ETAPA_21 100
//#macro Y2_CLICK_ETAPA_21 100

//aba trompas
#macro X1_CLICK_ETAPA_22 288
#macro Y1_CLICK_ETAPA_22 32
#macro X2_CLICK_ETAPA_22 288 + 32
#macro Y2_CLICK_ETAPA_22 32 + 32

//trompa
//#macro X1_CLICK_ETAPA_23 0
//#macro Y1_CLICK_ETAPA_23 0
//#macro X2_CLICK_ETAPA_23 100
//#macro Y2_CLICK_ETAPA_23 100

//aba especiais
#macro X1_CLICK_ETAPA_24 310
#macro Y1_CLICK_ETAPA_24 32
#macro X2_CLICK_ETAPA_24 310 + 32
#macro Y2_CLICK_ETAPA_24 32 + 32

//especial
//#macro X1_CLICK_ETAPA_25 0
//#macro Y1_CLICK_ETAPA_25 0
//#macro X2_CLICK_ETAPA_25 100
//#macro Y2_CLICK_ETAPA_25 100
//
//#macro X1_CLICK_ETAPA_26 0
//#macro Y1_CLICK_ETAPA_26 0
//#macro X2_CLICK_ETAPA_26 100
//#macro Y2_CLICK_ETAPA_26 100
#endregion