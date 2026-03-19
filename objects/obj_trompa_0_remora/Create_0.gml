numero = 0; //Dueto de Rêmoras

// Inherit the parent event
event_inherited();

function on_aplicar(_torre)
{
    //pegando a posição correta para criar as remoras
    var _esq_torre = _torre.x;
    var _dir_torre = _torre.x + _torre.sprite_width;
    var _meio_y_torre = _torre.y - _torre.sprite_height / 2;
    
    //criando as remoras e guardando elas dentro da struct do efeito
    var _remora_esq = instance_create_layer(_esq_torre - sprite_get_width(spr_ani_remora_idle) / 2, _meio_y_torre + sprite_get_height(spr_ani_remora_idle) / 2, "Torres", obj_ani_remora);
    var _remora_dir = instance_create_layer(_dir_torre + sprite_get_width(spr_ani_remora_idle) / 2, _meio_y_torre + sprite_get_height(spr_ani_remora_idle) / 2, "Torres", obj_ani_remora);
    _remora_esq.torre_dona = _torre;
    _remora_dir.torre_dona = _torre;
    _remora_esq.lado = "esq";
    _remora_esq.image_xscale = -1;
    _remora_dir.lado = "dir";

    //procurando o ultimo efeito adicionado
    var _index = array_length(torres_afetadas) - 1;
    
    torres_afetadas[_index].remora_esq = _remora_esq;
    torres_afetadas[_index].remora_dir = _remora_dir;
	
	torres_afetadas[_index].remora_esq = _remora_esq;
	torres_afetadas[_index].remora_dir = _remora_dir;

	// Vínculo reverso: da rêmora para a struct
	_remora_esq.efeito_data = torres_afetadas[_index];
	_remora_dir.efeito_data = torres_afetadas[_index];

}

function on_efeito(_torre, _efeito)
{
	//as remoras cuidam do efeito continuo
}

function on_remover(_torre, _efeito)
{
	if(global.debug){show_debug_message("Chamou on_remover da trompa Rêmora para torre: " + string(_torre.object_index));}
	
	if(is_undefined(_efeito.remora_esq) == false && instance_exists(_efeito.remora_esq))
	{
	    //instance_destroy(_efeito.remora_esq);
		_efeito.remora_esq.morrer = true;
	}
	if(is_undefined(_efeito.remora_dir) == false && instance_exists(_efeito.remora_dir))
	{
	    //instance_destroy(_efeito.remora_dir);
		_efeito.remora_dir.morrer = true;
	}
}
