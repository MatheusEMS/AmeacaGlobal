if(instance_exists(animal))
{
	//Barra de tempo restante (como fatia de pizza)
	var _frac = clamp(animal.vida / animal.vida_max, 0, 1); // porcentagem restante
	var angle_end = 360 * _frac;
	
	//Coordenadas do círculo (retângulo envolvente)
	var x1 = x - radius;
	var y1 = y - radius;
	var x2 = x + radius;
	var y2 = y + radius;
	
	//Definir início e fim do arco
	var x3 = x + radius;
	var y3 = y;
	var x4 = x + lengthdir_x(radius, angle_end);
	var y4 = y + lengthdir_y(radius, angle_end);
	
	//se o animal tem vida
	if(animal.vida_max > 0)
	{
		//Fundo circular (contorno completo)
		draw_set_color(c_black);
		draw_circle(x-1, y-1, radius+2, false);
		//var _cor = (animal.vida < animal.vida_max) ? c_red : c_lime;
		//draw_set_color(_cor);
		//draw_circle(x, y, radius, false);
		
		//Cor da pizza (tempo restante)
		draw_set_color(c_lime);
		if(animal.vida < animal.vida_max)
		{
			draw_pie(x1, y1, x2, y2, x3, y3, x4, y4, false, 24);
		}
		else
		{
			draw_circle(x, y, radius, false);
		}
		
		//resetando os padrões de draw
		draw_set_color(-1);
		draw_set_alpha(1);
		define_align(-1, -1);
	}
}
else
{
	instance_destroy();
	exit;
}


