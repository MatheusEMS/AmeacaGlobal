numero = 3; //defesa do lar

// Inherit the parent event
event_inherited();

function on_aplicar(_torre)
{
	//pegando a posição correta para criar as remoras
    var _meio_x_torre = _torre.x + _torre.sprite_width / 2;
    var _meio_y_torre = _torre.y - _torre.sprite_height / 2;
	
	var _anemona = instance_create_layer(_meio_x_torre, _meio_y_torre, "Cartas", obj_ani_anemona);
	_anemona.torre_dona = _torre;
	
	//procurando o ultimo efeito adicionado
	var _index = array_length(torres_afetadas) - 1;
    
	torres_afetadas[_index].anemona = _anemona;
	
	//_torre.selecionado = false;
}

function on_efeito(_torre, _efeito)
{
	//a anemona está cuidando do próprio comportamento
}

function on_remover(_torre, _efeito)
{
	//destrói a anemona
	if(is_struct(_efeito) && !is_undefined(_efeito.anemona) && instance_exists(_efeito.anemona))
	{
		//instance_destroy(_efeito.anemona);
		_efeito.anemona.morrer = true;
	}
}