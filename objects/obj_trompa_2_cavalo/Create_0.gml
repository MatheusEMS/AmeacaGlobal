numero = 2; //passo equino

// Inherit the parent event
event_inherited();

function on_aplicar(_torre)
{
	//pegando a posição correta para criar as remoras
    var _meio_x_torre = _torre.x + _torre.sprite_width / 2;
    var _meio_y_torre = _torre.y - _torre.sprite_height / 2;
	
	var _cavalo = instance_create_layer(_torre.x, _torre.y, "Torres", obj_cria_cavalos);
	_cavalo.torre_dona = _torre;
	
	//procurando o ultimo efeito adicionado
	var _index = array_length(torres_afetadas) - 1;
	
	torres_afetadas[_index].cavalo = _cavalo;
	
	//Desliga movimentação padrão da torre
	_torre.mov_padrao = false;
	
	//tirando a seleção padrão da torre
	//_torre.selecionado = false;
	//layer_add_instance("Torres", _torre); //volto pra camada comum das torres
}

function on_efeito(_torre, _efeito)
{
	//_torre.mov_padrao = false;
}

function on_remover(_torre, _efeito)
{
	if(instance_exists(_torre))
	{
		//restaura movimento padrão
		_torre.mov_padrao = true;
		_torre.selecionado = false;
		layer_add_instance("Torres", _torre); //volto pra camada comum das torres
	}
	
	if(global.debug) {show_debug_message("removendo cavalos: " + string(_efeito.cavalo));}
	
	//destrói o cavalo marinho
	if(is_struct(_efeito) && !is_undefined(_efeito.cavalo) && instance_exists(_efeito.cavalo))
	{
		instance_destroy(_efeito.cavalo);
	}
}