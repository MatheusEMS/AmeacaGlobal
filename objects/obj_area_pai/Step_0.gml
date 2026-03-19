
//se existem inimgios
if(instance_exists(obj_ini_ame_pai))
{
	with(obj_ini_ame_pai) //cada inimigo verifica se...
	{
		//estou dentro da área E ainda não estou na lista?
		if(point_distance(other.x, other.y, x, y) <= other.alcance && ds_list_find_index(other.na_area, id) == -1)
		{
			//entro na lista
			ds_list_add(other.na_area, id);
		}
	}
}

//para cada inimigo na lista
for(var i = 0; i < ds_list_size(na_area); i++)
{
	var _inimigo = ds_list_find_value(na_area, i);
	
	if(!instance_exists(_inimigo)) continue; //se não existe mais aquele inimigo eu vou pro próximo
	
	//se não
	if (efeito == "dano" || efeito == "ambos")	//se for uma área de dano
	{
		cria_popup_dano(_inimigo, dano);
		
		if(_inimigo.hp > dano) //se o inimigo aguenta
		{
			_inimigo.hp -= dano; //aplico dano
		}
		else //se não
		{
			cria_perolas(5, 15, _inimigo.x, _inimigo.y);
			instance_destroy(_inimigo); //destruo o inimigo
		}
	}

	if(efeito == "slow" || efeito == "ambos") //se for uma área de slow
	{
		_inimigo.vel *= slow; //aplica slow
	}
}

//se a minha animação acabou
if(image_index > image_number - 1)
{
	instance_destroy(); //me destruo
}