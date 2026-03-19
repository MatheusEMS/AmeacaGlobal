// Inherit the parent event
event_inherited();

//desenhando minha "collision box"
//com for
for(var i = 0; i < alcance / 32; i++)
{
	//esquerda
	draw_rectangle((x - sprite_width * (0.5 + i)), (y - sprite_height * (3 + i)), (x + sprite_width * (0.5 - i)), (y - sprite_height * (1 + i)), true);
	
	//direita
	draw_rectangle((x + sprite_width * (0.5 + i)), (y - sprite_height * (3 + i)), (x + sprite_width * (1.5 + i)), (y - sprite_height * (1 + i)), true);
}

//na unha
//draw_rectangle: canto superior esquerdo (x1), (y1); canto inferior direito (x2), (y2)
/*
//esquerda
draw_rectangle((x - sprite_width * 0.5), (y - sprite_height * 3), (x + sprite_width * 0.5), (y - sprite_height * 1), true);
draw_rectangle((x - sprite_width * 1.5), (y - sprite_height * 4), (x + sprite_width * -0.5), (y - sprite_height * 2), true);
draw_rectangle((x - sprite_width * 2.5), (y - sprite_height * 5), (x + sprite_width * -1.5), (y - sprite_height * 3), true);
draw_rectangle((x - sprite_width * 3.5), (y - sprite_height * 6), (x + sprite_width * -2.5), (y - sprite_height * 4), true);
draw_rectangle((x - sprite_width * 4.5), (y - sprite_height * 7), (x + sprite_width * -3.5), (y - sprite_height * 5), true);
draw_rectangle((x - sprite_width * 5.5), (y - sprite_height * 8), (x + sprite_width * -4.5), (y - sprite_height * 6), true);

//direita
draw_rectangle((x + sprite_width * 0.5), (y - sprite_height * 3), (x + sprite_width * 1.5), (y - sprite_height * 1), true);
draw_rectangle((x + sprite_width * 1.5), (y - sprite_height * 4), (x + sprite_width * 2.5), (y - sprite_height * 2), true);
draw_rectangle((x + sprite_width * 2.5), (y - sprite_height * 5), (x + sprite_width * 3.5), (y - sprite_height * 3), true);
draw_rectangle((x + sprite_width * 3.5), (y - sprite_height * 6), (x + sprite_width * 4.5), (y - sprite_height * 4), true);
draw_rectangle((x + sprite_width * 4.5), (y - sprite_height * 7), (x + sprite_width * 5.5), (y - sprite_height * 5), true);
draw_rectangle((x + sprite_width * 5.5), (y - sprite_height * 8), (x + sprite_width * 6.5), (y - sprite_height * 6), true);
*/