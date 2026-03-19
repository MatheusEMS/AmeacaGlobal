// Inherit the parent event
event_inherited();

if screen_pause() == false //se não está pausado
{
	if (room != rm_album && position_meeting(mouse_x, mouse_y, self)) //se colocar o cursor do mouse em cima de mmim
	{
		//desenhando minha "collision box"
		for (var i = 0; i < 6; i++)
		{
			//Esquerda
			var x1_e = x - sprite_width * (0.5 + i);
			var y1_e = y - sprite_height * (3 + i);
			var x2_e = x + sprite_width * (0.5 - i);
			var y2_e = y - sprite_height * (1 + i);
			
			draw_rectangle(x1_e, y1_e, x2_e, y2_e, true);
			
			//Direita
			var x1_d = x + sprite_width * (0.5 + i);
			var y1_d = y - sprite_height * (3 + i);
			var x2_d = x + sprite_width * (1.5 + i);
			var y2_d = y - sprite_height * (1 + i);
			
			draw_rectangle(x1_d, y1_d, x2_d, y2_d, true);
		}
		/*
		for(var i = 0; i < alcance / 32; i++)
		{
			//esquerda
			draw_rectangle((x - sprite_width * (0.5 + i)), (y - sprite_height * (3 + i)), (x + sprite_width * (0.5 - i)), (y - sprite_height * (1 + i)), true);
			
			//direita
			draw_rectangle((x + sprite_width * (0.5 + i)), (y - sprite_height * (3 + i)), (x + sprite_width * (1.5 + i)), (y - sprite_height * (1 + i)), true);
		}
		*/
	}
}