numero = 4; //casco de craca

// Inherit the parent event
event_inherited();

function on_aplicar(_torre)
{
	//pegando a posição correta para criar as remoras
    var _meio_x_torre = _torre.x + _torre.sprite_width / 2;
    var _meio_y_torre = _torre.y - _torre.sprite_height / 2;
	
	var _craca = instance_create_layer(_meio_x_torre, _meio_y_torre, "Cartas", obj_cria_cracas);
	_craca.torre_dona = _torre;
	
	//aplicando efeito da trompa
	_torre.forca = 20;
	_torre.mov_padrao = false;
	
	//procurando o ultimo efeito adicionado
	var _index = array_length(torres_afetadas) - 1;
    
	torres_afetadas[_index].craca = _craca;
}

function on_efeito(_torre, _efeito)
{
	//criador de cracas cuidando do efeito continuo
}

function on_remover(_torre, _efeito)
{
	//removendo o efeito da torre
	if(instance_exists(_torre)) 
	{
		_torre.forca = _torre.resistencia;
		_torre.mov_padrao = true;
	}
	
	//destrói as cracas
	if(is_struct(_efeito) && !is_undefined(_efeito.craca) && instance_exists(_efeito.craca))
	{
		instance_destroy(_efeito.craca);
	}
}