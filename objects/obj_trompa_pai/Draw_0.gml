draw_self();

if room == rm_album //se estou no álbum
{

	//draw_circle(x+32,y+32,42,true);

	if(trancado)
	{
		draw_sprite_ext(sTrancado, 0, x + sprite_width / 2,y + sprite_height / 2, sprite_width / 64, sprite_width / 64, 0, c_white, 1);
		image_alpha = 0.5;
	}
	else
	{
		image_alpha = 1;
	}

	//verificando se existe o inventário
	if(instance_exists(oAlbum))
	{
		//se me selecionou
		if(oAlbum.clicouQualTrompa == id)
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
	else
	{
		msg_erro("oAlbum");
	}
}
else //se não estou no álbum
{
	if(global.debug)
	{
		define_align(fa_middle, fa_center);
		draw_text(x + sprite_width / 2, y - 20, "Sel: "+string(selecionado));
		define_align(-1, -1);
	}
	
	//se estou em cooldown
	if(cooldown > 0)
	{
		image_blend = c_white;
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
		
		//se não estou selecionado
		if(!selecionado)
		{
			//cor padrão
			image_blend = c_white;
		}
		else //se estou selecionado
		{
			//fico verde
			image_blend = c_green;
		}
	}
}