if(!is_struct(efeito_data) || !instance_exists(torre_dona) || !instance_exists(origem_trompa))
{
	instance_destroy();
	exit;
}

//Calculando quantos feedbacks existem para essa trompa
var total = 0;

with(obj_feedback_duracao)
{
	if(instance_exists(origem_trompa) && origem_trompa == other.origem_trompa)
	{
		total++;
	}
}

//Calculando minha posição relativa
var meu_indice = 0;
var achou_self = false;

with(obj_feedback_duracao)
{
	if(instance_exists(origem_trompa) && origem_trompa == other.origem_trompa)
	{
		if(id == other.id)
		{
			other.meu_indice = meu_indice;
			achou_self = true;
		}
		if(!!achou_self)
		{
			meu_indice++;
		}
	}
}

//atualizando a posição numa fila horizontal
x = origem_trompa.x + (meu_indice - (total - 1)/2) * margem;
y = origem_trompa.y - margem;

//Hover detection (com margem generosa)
hover = point_in_circle(mouse_x, mouse_y, x, y, radius);

//Destruir quando o tempo terminar
if(efeito_data.tempo_restante <= 0)
{
	instance_destroy();
}
