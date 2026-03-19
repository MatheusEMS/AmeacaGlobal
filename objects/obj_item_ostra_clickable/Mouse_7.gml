//pause self
if screen_pause() == true
{
	exit;
}

//se estou no tutorial
if(instance_exists(obj_tutorial))
{
	//se ainda não cheguei na etapa 13
	if(obj_tutorial.etapa < 13) exit; //não executo mais nada
}

//se não estou com a pá nem torre na mão
if(!instance_exists(obj_item_ostra_dragged) && !instance_exists(obj_ani_dragged_pai))
{
	if(instance_exists(obj_trompa_pai))
	{
		if(!obj_trompa_pai.selecionado)
		{
			oSFX.ostra_fechandoSnd = false;	
			//pego a pá
			with(instance_create_layer(mouse_x, mouse_y, "UI", obj_item_ostra_dragged))
			{
				image_speed = 0;
			}
		}
	}
}