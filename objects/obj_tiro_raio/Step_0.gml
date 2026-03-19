// Inherit the parent event
event_inherited();

oSFX.choqueEletricoSnd = true;

dano_por_frame = dano / game_speed;

//reduz duração
tempo_vida--;

//se acabou meu tempo de vida, se meu pai morreu ou se meu alvo morreu
if(tempo_vida <= 0 || !instance_exists(pai) || !instance_exists(alvo))
{
	instance_destroy(); //me destruo
	exit; //não executo o resto do código
}

#region ajustando a posição e aparencia
//ajustando a posição e aparencia
//origem
x = pai.x + pai.sprite_width / 2;
y = pai.y - pai.sprite_height;

//destino
//image_angle = point_direction(x, y, alvo.x + alvo.sprite_width / 2, alvo.y - alvo.sprite_height / 2);
//image_xscale = point_distance(x, y, alvo.x + alvo.sprite_width / 2, alvo.y - alvo.sprite_height / 2) / sprite_width;
#endregion

//aplica dano no alvo
alvo.hp -= dano_por_frame;

//ccriando o próximo raio se ainda tiver inimigos próximos
//se ainda não criei meu arco (próximo raio)
if(criou_proximo == false)
{
	//Adiciona o primeiro alvo à lista
	ds_list_add(atingidos, alvo.id);
	
	//iniciando variáveis
	var _proximo = noone;
	var _menor_dist = alcance + 1;
	
	with(obj_ini_ame_pai) //cada inimigo verifica se...
	{
		//show_debug_message("verificando se sou o prox do RAIO");
		
		//o id dele é diferente do id do primeiro alvo E se a distancia entre ele e o primeiro alvo É menor ou igual ao alcance do raio
		if(id != other.alvo.id && point_distance(other.alvo.x, other.alvo.y, x, y) <= other.alcance)
		{
			//se sim
			if(ds_list_find_index(other.atingidos, id) == -1) //se não me encontrar na lista de atingidos
			{
				var _dist = point_distance(other.alvo.x, other.alvo.y, x, y); //calculo a distância eu (inimigo) e o primeiro alvo 
				
				if(_dist < _menor_dist) //se essa é menor que o alcance do raio + 1;
				{
					_menor_dist = _dist; //gravo que a menor distancia é a distancia entre o primeiro alvo e a minha (inimigo)
					_proximo = id; //gravo que o proximo sou eu (inimigo)
					
					//show_debug_message(_proximo);
				}
			}
		}
	}
	
	//se tem um proximo
	if(instance_exists(_proximo))
	{
		//cria um novo arco
		var _arco = instance_create_layer(alvo.x, alvo.y, "Projeteis", obj_arco_raio);
		_arco.origem = alvo;
		_arco.alvo = _proximo;
		_arco.alcance = alcance;
		_arco.dano_por_frame = dano_por_frame;
		_arco.tempo_vida = tempo_vida;
		_arco.contador = 2;
		
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