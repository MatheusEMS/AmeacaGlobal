// Inherit the parent event
event_inherited();

if(draw_onda && instance_exists(ecco))
{
	var max_radius = 50; //raio maximo da onda
	var fade_amount = 0.05; //decremento da transparência
	
	//definindo transparência e cor da onda
	draw_set_alpha(alfa);
	draw_set_color(c_white);
	
	//desenhando um círculo que cresce com o tempo
	draw_circle(ecco.x + 8, ecco.y + 10, raio, true);
	
	//aumentando o raio e a transparência
	raio += 5;
	alfa -= fade_amount;
	
	//se a onda sumiu, para de desenhar ela
	if (alfa <= 0)
	{
	    alfa = 1;
	    raio = 0;
	}
	
	//resetando a transparência
	draw_set_alpha(1);
	
	with(obj_trompa_pai)
	{
		//definindo transparência e cor da onda
		draw_set_alpha(other.alfa);
		draw_set_color(c_white);
		
		//desenhando um círculo que cresce com o tempo
		draw_circle(x + sprite_width / 2, y, other.raio / 2, true);
	}
	
	//resetando a transparência
	draw_set_alpha(1);
}

if(global.debug) draw_text(x, y  - 10, timer);