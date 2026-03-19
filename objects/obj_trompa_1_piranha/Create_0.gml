numero = 1; //guarda voraz

// Inherit the parent event
event_inherited();

dir = 0;

function on_aplicar(_torre)
{
	dir = choose(-1, 1);
	
	//pegando a posição correta para criar as piranhas
    var _meio_x_torre = _torre.x + _torre.sprite_width / 2;
    var _meio_y_torre = _torre.y - _torre.sprite_height / 2;
	
	for (var i = 0; i < 6; i++) 
	{
		
		var _pir = instance_create_layer(_meio_x_torre, _meio_y_torre, "Torres", obj_ani_piranha);
		_pir.torre_dona = _torre;
		_pir.orbit_dir = 60 * i;
		_pir.dir = dir;
		
		//procurando o ultimo efeito adicionado
		var _index = array_length(torres_afetadas) - 1;
    
		torres_afetadas[_index].piranha[i] = _pir;
	}
	
	//_torre.selecionado = false;
}

function on_efeito(_torre, _efeito)
{
	//as piranhas estão cuidando do próprio comportamento
}

function on_remover(_torre, _efeito)
{
	if(is_array(_efeito.piranha))
	{
		for(var i = 0; i < array_length(_efeito.piranha); i++)
		{
			var _p = _efeito.piranha[i];
			if(instance_exists(_p))
			{
				//instance_destroy(_p);
				_p.morrer = true;
			}
		}
	}
}