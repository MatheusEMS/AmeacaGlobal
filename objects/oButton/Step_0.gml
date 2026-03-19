//pulsação
//define limites
var limite_max = 1;
var limite_min = min_percent;

//define modulação proporcional
var tam_modificador = tam_mod;

if(image_index == spr_botao_close)
{
	nome = "Sair";
}

if(global.UltimaFase > fase)
{
	pulsa = false;
	image_xscale = 1;
	image_yscale = 1;
}

if(pulsa)
{
	if(diminuir)
	{
		escala_pulso = max(escala_pulso - tam_modificador, limite_min);
		
		if(escala_pulso <= limite_min)
		{
			diminuir = false;
		}
	}
	else
	{
		escala_pulso = min(escala_pulso + tam_modificador, limite_max);
		
		if(escala_pulso >= limite_max)
		{
			diminuir = true;
		}
	}
}

//aplica a escala proporcional nos dois eixos
image_xscale = tam_x * escala_pulso;
image_yscale = tam_y * escala_pulso;

//oscilando
if(irPara == rm_album)
{
	//subindo e descendo
	//se movendo com base numa onda senoidal
	tempo_osc = get_timer() / 1000000;
	
	//criando a onda senoidal
	var _onda_1 = sin(tempo_osc * vel_osc);
	
	//criando o espaço para se mover
	var _y = ystart + _onda_1 * dist_osc;
	
	y = _y;
	
	//girando
	// atualiza o tempo
	tempo_ang = get_timer() / 1000000;
	
	// cria a onda senoidal (entre -1 e 1)
	var _onda_2 = sin(tempo_ang * vel_ang);
	
	// mapeia a onda para o intervalo entre ang_min e ang_max
	var _angulo = lerp(ang_min, ang_max, (_onda_2 + 1) / 2);
	
	// aplica a rotação
	image_angle = _angulo;
}

if(room == rm_album && irPara == rm_mapa)
{
	nome = "Sair";
	cor = c_white;

	if(instance_exists(obj_tutorial))
	{
		if(obj_tutorial.etapa < 29)
		{
			image_alpha = .33;
			pulsa = false;
		}
		else
		{
			image_alpha = 1;
			pulsa = true;
		}
	}
}

//se a última etapa do tutorial foi concluída
if(global.tutorial[array_length(global.tutorial) - 1]) 
{
	//se sou o botão do tutorial
	if(irPara == rm_tutorial)
	{
		pulsa = false;
		image_xscale = 1;
		image_yscale = 1;
		image_alpha = .67;
	}
}