//PAUSANDO
if(screen_pause()) exit;

oSFX.motorBarcoSnd = true;

#region SPRITE
//garantindo que eu vire para o lado certo
if (x_anterior != x)
{
	image_xscale = sign(x - x_anterior);
}
x_anterior = x;
#endregion

#region MOVIMENTAÇÃO
//FUNÇÃO LOCAL
function mover_barco(_min, _max)
{
	if(x >= _max || x <= _min)
	{
		dir = (x < room_width / 2) ? "esquerda" : "direita";
	}
	if(dir == "esquerda")
	{
		x += vel + global.spd;
	}
	else
	{
		x -= vel + global.spd;
	}
}

//verificando se estou no tutorial
if(global.tutorial_ativo)
{
	//se o primeiro gameplay do tutorial não foi concluído
	if(global.tutorial[7] == false)
	{
		x = room_width / 2; //fico no meio da room
	}
	else //se já foi concluída
	{
		//me movo pelo limite definido
		mover_barco(min_x_tutorial, max_x_tutorial);
	}
}
else //se não to no tutorial
{
	//me movo pela sala inteira
	mover_barco(32, room_width - 32);
}
#endregion

#region FEEDBACK VISUAL WAVE 1
if(contagem_ativa)
{
	tempo_contagem -= 1;
	
	if(tempo_contagem <= 0)
	{
		contador -= 1;
		tempo_contagem = game_get_speed(gamespeed_fps);
		
		if(contador <= 0)
		{
			contagem_ativa = false;
			contagem_finalizou = true;
			tempo_contagem = game_get_speed(gamespeed_fps);
		}
	}
	
	exit; //Enquanto está na contagem, não executa mais nada do step
}

if(contagem_finalizou)
{
	tempo_contagem -= 1;
	
	if(tempo_contagem <= 0)
	{
		contagem_finalizou = false;
		nova_wave = true; //libera a primeira wave
		spawn_index = 0; //garantindo que sempre reinicia certo
	}
	
	exit; //Enquanto está na contagem, não executa mais nada do step
}

#endregion

#region FIM DA PARTIDA
//se todos os lixos da wave foram spawnados, o barco espera a próxima wave
if(spawnando && spawn_index >= array_length(spawn_fila) && instance_number(obj_ini_ame_pai) == 0)
{
	spawnando = false; //gravo não estou spawnando
	global.wave += 1; //próxima wave
	global.spd += 0.1; //aumenta a velocidade global
	
	//se ainda tem waves na fase
	if(global.wave < array_length(obj_gerenciador.waves))
	{
		if(!global.tutorial_ativo)
		{
			//fora do tutorial, apenas a wave 1 faz a contagem
			if(global.wave == 0)
			{
				show_debug_message("contagem padrao");
				show_debug_message("global.wave: "+string(global.wave));
				inicia_contagem();
			}
			else
			{
				nova_wave = true;
				spawnando = true;
			}
		}
		//else
		//{
		//	show_debug_message("contagem do tutorial");
		//	inicia_contagem(); //no tutorial, sempre inicia contagem antes da wave
		//}
	}
	else //se não tem mais waves
	{
		ganhou = true; //gravo que ganhou
	}
}

//se perdeu todas as vidas
if(global.hp_atual <= 0) perdeu = true; //gravo que perdeu

//se ganhou
if ganhou 
{
	if instance_number(oPosPartida) < 1
	{
		if room == rm_fase_1 && !check
		{
			Transition(TRANS_MODE.GOTO,rm_SalvaLagosta);
			check = true;
		}else if room == rm_fase_2 && !check
		{
			Transition(TRANS_MODE.GOTO,rm_SalvaTartaruga);
			check = true;
		}else if room == rm_fase_3 && !check
		{
			Transition(TRANS_MODE.GOTO,rm_SalvaBaiacu);
			check = true;
		}else if room == rm_fase_4 && !check
		{
			Transition(TRANS_MODE.GOTO,rm_SalvaPoraque);
			check = true;
		}else if room == rm_fase_5 && !check
		{
			Transition(TRANS_MODE.GOTO,rm_SalvaArraia);
			check = true;
		}
		//var _inst = instance_create_layer(x,y,"UI",oPosPartida);
	}

}
else if perdeu
{
	if instance_number(oPosPartida) < 1
	{
		set_song_ingame(derrota__Searching_Nat_Keefe_,30,5);
		var _inst = instance_create_layer(x,y,"UI",oPosPartida);
		with(_inst)
		{
			_inst.ganhou = false;
			_inst.perdeu = true;
		}
	}
}
#endregion

#region SPAWN
//bloqueia spawn durante a contagem ou o "HORA DO PEIXE"
if(contagem_ativa || contagem_finalizou) exit;

if(nova_wave)
{
	if(global.wave < array_length(obj_gerenciador.waves))
	{
		//pegando a wave atual do gerenciador
		var wave_data = obj_gerenciador.waves[global.wave];
		spawn_fila = []; //limpa a fila anterior
	
		//cria a fila sequencialmente com pares [tipo, quantidade]
		for(var i = 0; i < array_length(wave_data); i += 2)
		{
			var tipo = wave_data[i];
			var qtd = wave_data[i + 1];
			array_push(spawn_fila, [tipo, qtd]);
		}
		
		spawn_index = 0; //reseta o índice de spawn
		nova_wave = false;
		spawnando = true;
	}
}

//spawn sequencial
if(!nova_wave && spawn_index < array_length(spawn_fila))
{
	timer -= 1; //aciono meu timer
	
	if(timer <= 0)
	{
		var tipo = spawn_fila[spawn_index][0]; //tipo de lixo
		var qtd_restante = spawn_fila[spawn_index][1]; //quantidade daquele lixo
		
		//criando o lixo X vezes
		if(qtd_restante > 0)
		{
			instance_create_layer(x, y - sprite_height / 2, "Inimigos", tipo);
			spawn_fila[spawn_index][1] -= 1;
		}
		else
		{
			spawn_index += 1; //passa para o próximo tipo de lixo
		}
	
		timer = spawn_rate; //reseta o tempo de spawn
	}
}
#endregion
