// Inherit the parent event
event_inherited();

if(screen_pause()) exit; //pausando

if(estado == "morrendo") exit; //se estou morrendo, não faço nada além do que a torre pai já faz

//função para localizar inimigos
function inimigo_nas_diagonais(_inimigo)
{
	for (var i = 0; i < 6; i++)
	{
		//Esquerda
		var x1_e = x - sprite_width * (0.5 + i);
		var y1_e = y - sprite_height * (3 + i);
		var x2_e = x + sprite_width * (0.5 - i);
		var y2_e = y - sprite_height * (1 + i);
		
		if (collision_rectangle(x1_e, y1_e, x2_e, y2_e, _inimigo, true, false)) return true;
		
		//Direita
		var x1_d = x + sprite_width * (0.5 + i);
		var y1_d = y - sprite_height * (3 + i);
		var x2_d = x + sprite_width * (1.5 + i);
		var y2_d = y - sprite_height * (1 + i);
		
		if (collision_rectangle(x1_d, y1_d, x2_d, y2_d, _inimigo, true, false)) return true;
	}
	
	return false;
}
//cooldown entre rajadas
if(cooldown > 0) cooldown--;

//MÁQUINA DE ESTADOS
if(estado == "nadando") exit;

if(estado == "parado")
{
	//verificando o inimigo mais próximo no alcance
	//se o alvo ta no meu range de colisão
	var _alvo = noone;
	
	for (var i = 0; i < 6; i++)
	{
		//Esquerda
		var x1_e = x - sprite_width * (0.5 + i);
		var y1_e = y - sprite_height * (3 + i);
		var x2_e = x + sprite_width * (0.5 - i);
		var y2_e = y - sprite_height * (1 + i);
		
		_alvo = collision_rectangle(x1_e, y1_e, x2_e, y2_e, obj_ini_ame_pai, true, false);
		if (_alvo != noone) break;
		
		//Direita
		var x1_d = x + sprite_width * (0.5 + i);
		var y1_d = y - sprite_height * (3 + i);
		var x2_d = x + sprite_width * (1.5 + i);
		var y2_d = y - sprite_height * (1 + i);
		
		_alvo = collision_rectangle(x1_d, y1_d, x2_d, y2_d, obj_ini_ame_pai, true, false);
		if (_alvo != noone) break;
	}
	
	//se achou
	if(_alvo != noone && instance_exists(_alvo))
	{
		alvo = _alvo; //gravo o alvo
	}
	else
	{
		alvo = noone;
	}
	
	//CONDIÇÃO PARA TROCA DE ESTADOS
	//indo para atacando
	if(pode_atirar && cooldown <= 0 && alvo != noone)
	{
		estado = "atacando";
		pode_atirar = false;
		rajada_atual = 0;
		rajada_timer = 0;
	}
}

if(estado == "atacando")
{
	//se alvo morreu ou saiu da área
	if(!instance_exists(alvo) || !inimigo_nas_diagonais(alvo))
	{
		alvo = noone; //limpo minha memória sobre alvos
	}
	
	//se estou em cooldown
	if(rajada_timer > 0)
	{
		rajada_timer--; //diminuo meu cooldown
	}
	else //se não estou em cooldown
	{
		//se tenho alvo
		if(alvo != noone)
		{
			if(rajada_atual < rajada_total) //se não terminei a rajada
			{
				//disparo
				var _bullet = instance_create_layer(x + sprite_width / 2, y - sprite_height, "Projeteis", tiro);
				_bullet.pai = id;
				_bullet.alvo = alvo;
				_bullet.dano = ataque;
				
				tiros++;
				rajada_atual++;
				rajada_timer = rajada_intervalo;
			}
			else //fim da rajada, mas ainda tenho alvo?
			{
				//mudo para "parado"
				pode_atirar = true;
				cooldown = cooldown_tiro;
				if(animation_end())
				{
					estado = "parado";
				}
			}
		}
		else //se não tenho alvo
		{
			//mudo para "parado"
			pode_atirar = true;
			cooldown = cooldown_tiro;
			estado = "parado";
		}
	}
}