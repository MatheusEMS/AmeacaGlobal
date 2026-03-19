//pause self
if screen_pause() == true
{
	exit;
}

if(instance_exists(obj_tutorial))
{
	if(obj_tutorial.etapa == 0)
	{
		exit;
	}
}

if(posso_criar) //se posso criar
{
    if(global.coins >= custo && !instance_exists(dragged) && !instance_exists(obj_item_ostra_dragged) && !instance_exists(dragged)) //se tenho dinheiro pra esse animal
    {
    	var _torre_dragged;
    	_torre_dragged = instance_create_layer(mouse_x, mouse_y, "Torres", dragged); //pego ele
    	_torre_dragged.custo = custo;
    	_torre_dragged.pai = id;
    	
    	global.coins -= custo; //gasto dinheiro
    }
}
