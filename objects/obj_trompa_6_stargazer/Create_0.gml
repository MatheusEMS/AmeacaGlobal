numero = 6; //Para o Alto! (stargazer)

// Inherit the parent event
event_inherited();

function on_aplicar(_torre)
{
	//pegando a posição correta para criar as remoras
    var _meio_x_torre = _torre.x + _torre.sprite_width / 2;
	
	var _stargazer = instance_create_layer(_meio_x_torre, _torre.y + sprite_get_height(spr_ani_stargazer_idle) / 2, "Cartas", obj_ani_stargazer);
	_stargazer.torre_dona = _torre;
	
	//procurando o ultimo efeito adicionado
	var _index = array_length(torres_afetadas) - 1;
    
	torres_afetadas[_index].stargazer = _stargazer;
	
	//modificando o movimento da torre
	_torre.mov_padrao = false;
}

function on_efeito(_torre, _efeito)
{
	//a stargazer está cuidando do próprio comportamento
}

function on_remover(_torre, _efeito)
{
	if(instance_exists(_torre))
	{
		//modificando o movimento da torre
		_torre.mov_padrao = true;
	}
	
	//destrói a stargazer
	if(is_struct(_efeito) && !is_undefined(_efeito.stargazer) && instance_exists(_efeito.stargazer))
	{
		//instance_destroy(_efeito.stargazer);
		_efeito.stargazer.morrer = true;
	}
}