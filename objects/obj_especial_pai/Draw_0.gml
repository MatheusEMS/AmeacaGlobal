draw_self();

//desenhar só na sala inventario
if(room == rm_album)
{
	//draw_circle(x+32,y+32,42,true);
	
	//se to trancado
	if(trancado)
	{
		//desenho cadeado
		draw_sprite_ext(sTrancado, 0, x + sprite_width / 2, y + sprite_height / 2, sprite_width / 64, sprite_width / 64, 0, c_white, 1);
		image_alpha = 0.5;
	}
	else
	{
		image_alpha = 1;
	}
	
	//se existe o inventário
	if(instance_exists(oAlbum))
	{
		//se me selecionou
		if(oAlbum.clicouQualEspecial == id)
		{
			//fico azul
			image_blend = c_blue;	
		}
		else //se não
		{
			//cor padrão
			image_blend = c_white;		
		}
	}
}
else //se não estou no álbum
{
	//debug
	if(global.debug)
	{
		var _ativo = (ativo == true) ? "ativo" : "desativo";
		draw_text(x, y + sprite_height / 2, _ativo);
	}
	
	draw_set_font(-1);
	
	//desenhando minha duração
	if(timer > 0 && ativo)
	{
		image_alpha = 0.5; //transparência
		
		#region pizza
		var offset = 4; // margem opcional
		var x_circulo = x - offset;
		var y_circulo = y - offset;

		//Barra de tempo restante (como fatia de pizza)
		var tempo = timer;
		var duracao = timerSave;
		var _frac = clamp(tempo / duracao, 0, 1); // porcentagem restante
		var angle_end = 360 * _frac;
		
		//Coordenadas do círculo (retângulo envolvente)
		var x1 = x_circulo - radius;
		var y1 = y_circulo - radius;
		var x2 = x_circulo + radius;
		var y2 = y_circulo + radius;
		
		//Definir início e fim do arco
		var x3 = x_circulo + radius;
		var y3 = y_circulo;
		var x4 = x_circulo + lengthdir_x(radius, angle_end);
		var y4 = y_circulo + lengthdir_y(radius, angle_end);
		
		if(timer != timerSave)
		{
			//Fundo circular (contorno completo)
			draw_set_color(c_black);
			draw_circle(x_circulo - 1, y_circulo - 1, radius+2, false);
			draw_set_color(-1);
		}
		
		//Cor da pizza (tempo restante)
		draw_set_color(c_white);
		draw_pie(x1, y1, x2, y2, x3, y3, x4, y4, false, 24);
		
		//resetando os padrões de draw
		draw_set_color(-1);
		draw_set_alpha(1);
		define_align(-1, -1);
		
		#endregion
	}
	
	//se estou em cooldown
	if(cooldown > 0)
	{
		image_alpha = 0.5; //transparência
		
		#region pizza
		var offset = 4; // margem opcional
		var x_circulo = x + sprite_width - offset;
		var y_circulo = y + sprite_height - offset;

		//Barra de tempo restante (como fatia de pizza)
		var tempo = cooldown;
		var duracao = cooldownSave;
		var _frac = clamp(tempo / duracao, 0, 1); // porcentagem restante
		var angle_end = 360 * _frac;
		
		//Coordenadas do círculo (retângulo envolvente)
		var x1 = x_circulo - radius;
		var y1 = y_circulo - radius;
		var x2 = x_circulo + radius;
		var y2 = y_circulo + radius;
		
		//Definir início e fim do arco
		var x3 = x_circulo + radius;
		var y3 = y_circulo;
		var x4 = x_circulo + lengthdir_x(radius, angle_end);
		var y4 = y_circulo + lengthdir_y(radius, angle_end);
		
		//Fundo circular (contorno completo)
		draw_set_color(c_black);
		draw_circle(x_circulo - 1, y_circulo - 1, radius+2, false);
		draw_set_color(-1);
		
		//Cor da pizza (tempo restante)
		draw_set_color(c_white);
		draw_pie(x1, y1, x2, y2, x3, y3, x4, y4, false, 24);
		
		//resetando os padrões de draw
		draw_set_color(-1);
		draw_set_alpha(1);
		define_align(-1, -1);
		
		#endregion
	}
	else //se não estou em cooldown
	{
		//transparência padrão
		image_alpha = 1;
	}
}