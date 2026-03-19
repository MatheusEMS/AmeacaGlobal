//reduz duração
tempo_vida--;

oSFX.choqueEletricoSnd = true;

//se acabou meu tempo de vida, se meu pai morreu ou se meu primeiro alvo morreu
if(tempo_vida <= 0 || !instance_exists(origem) || !instance_exists(alvo))
{
	instance_destroy(); //me destruo
	exit; //não executo o restante do código
}

//ajustando a posição e aparência
//origem
x = origem.x;
y = origem.y;

//destino
//var alvo_ang = point_direction(x, y, alvo.x + alvo.sprite_width / 2, alvo.y - alvo.sprite_height / 2) - 98;
//var alvo_esc = point_distance(x, y, alvo.x + alvo.sprite_width / 2, alvo.y - alvo.sprite_height / 2) / sprite_height;
//
////suavização
//image_angle = lerp(image_angle, alvo_ang, 0.2);
//image_yscale = lerp(image_yscale, alvo_esc, 0.2);

//aplicando dano
if(alvo.hp > dano_por_frame)
{
	alvo.hp -= dano_por_frame;
}
else
{
	cria_perolas(5, 15, alvo.x, alvo.y);
	instance_destroy(alvo);
	exit;
}

//criando o próximo raio
//se ainda não criei um raio e menos que 3 raios foram criados
if(contador < 3 && criou_proximo == false)
{
	//iniciando variáveis
	var _proximo = noone;
	var _menor_dist = alcance + 1;
	
	with(obj_ini_ame_pai) //cada inimigo verifica se...
	{
		//show_debug_message("verificando se sou o prox do ARCO");
		
		//o id dele é diferente do id do alvo E se a distancia entre ele e o alvo é menor que o alcance do raio
		if(id != other.alvo.id && id != other.origem.id && point_distance(other.alvo.x, other.alvo.y, x, y) <= other.alcance)
		{
			//se sim
			if(ds_list_find_index(other.atingidos, id) == -1) //se não estou na lista de atingidos
			{
				var _dist = point_distance(other.alvo.x, other.alvo.y, x, y); //calculo a distância eu (inimigo) e o primeiro alvo 
			
				//show_debug_message(_proximo);
				
				if(_dist < _menor_dist) //se a distancia entre ele e o alvo é menor que o alcance do raio + 1
				{
					//gravo que a menor distancia é a distancia entre o primeiro alvo e a minha (inimigo)
					_menor_dist = _dist;
					_proximo = id; //gravo que o proximo sou eu
					
					//show_debug_message(_proximo);
				}
			}
			
		}
	}
	
	//se existe um próximo
	if(instance_exists(_proximo))
	{
		//crio um raio
		var _arco = instance_create_layer(alvo.x, alvo.y, "Projeteis", obj_arco_raio);
		_arco.origem = alvo;
		_arco.alvo = _proximo;
		_arco.alcance = alcance;
		_arco.dano_por_frame = dano_por_frame;
		_arco.tempo_vida = tempo_vida;
		_arco.contador = contador + 1; //incrementa o contador
		
		//Passa a lista para o arco e adiciona o novo inimigo
		_arco.atingidos = ds_list_create();
		
		for(var i = 0; i < ds_list_size(atingidos); i++)
		{
			ds_list_add(_arco.atingidos, atingidos[| i]);
		}
		
		ds_list_add(_arco.atingidos, _proximo.id);
	}
	
	criou_proximo = true; //previne criação múltipla
}