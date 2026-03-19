numero = 5; //Abraço Curador

// Inherit the parent event
event_inherited();

function on_aplicar(_torre)
{
	//pegando a posição correta para criar as remoras
    var _meio_x_torre = _torre.x + _torre.sprite_width / 2;
    var _meio_y_torre = _torre.y - _torre.sprite_height / 2;
	
	//criando o criador de estrelas
	var _estrela = instance_create_layer(_meio_x_torre, _meio_y_torre, "Cartas", obj_cria_estrelas);
	_estrela.torre_dona = _torre;
	
	//criando a primeira estrela
	var _mod = random_range(-8, 8);
	var _pos_x = x + _mod;
	var _pos_y = y + _mod;
	var _star = instance_create_layer(_pos_x, _pos_y, "Projeteis", obj_ani_estrela);
	_star.tempo_vida = 120;
	_star.pai = _estrela.id;
	_star.pmod = _mod; 
	
	//procurando o ultimo efeito adicionado
	var _index = array_length(torres_afetadas) - 1;
    
	torres_afetadas[_index].estrela = _estrela;
}

function on_efeito(_torre, _efeito)
{
	//criador de estrelas cuidando do efeito continuo
}

function on_remover(_torre, _efeito)
{
	//destrói as estrelas
	if(is_struct(_efeito) && !is_undefined(_efeito.estrela) && instance_exists(_efeito.estrela))
	{
		instance_destroy(_efeito.estrela);
	}
}