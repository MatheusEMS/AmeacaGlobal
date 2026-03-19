//desenhando possíveis posições
if(selecionado)
{
	for(var i = 0; i < array_length(offsets); i++)
	{
		var px = offsets[i][0];
		var py = offsets[i][1];
		
		var dentro_altura = (py >= altura_min && py <= altura_max);
		var livre = posicao_livre(px, py);
		
		draw_set_alpha(.25);
		
		if(dentro_altura && livre)
		{
			draw_set_color(i == hover_index ? c_lime : c_white);
		}
		else
		{
			draw_set_color(c_red);
		}
		
		draw_rectangle(px, py, px + 32, py + 32, false);
	}
	
	draw_set_alpha(1);
	draw_set_color(-1);
}

if(global.debug)
{
	draw_text(x, y - 64, instance_number(obj_cria_cavalos));
}