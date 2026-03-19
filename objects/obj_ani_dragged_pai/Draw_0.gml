draw_self(); //me desenho

if(col_padrao)
{
	if(alcance > 0)
	{
		if(!explosao)
		{
			draw_set_color(c_white); //defino a cor do desenho
			draw_rectangle(x + esq_offset, y - sprite_height - alcance, x + sprite_width + dir_offset, y - sprite_height, true); //desenho meu alcance
			draw_set_color(-1); //reseto a cor de desenho
		}
		else
		{
			draw_set_color(c_white);
			var _meia_area = alcance / 2;
			draw_rectangle(x - _meia_area, y - _meia_area, x + _meia_area, y + _meia_area, true);
			draw_set_color(-1);
		}
	}
}

//DEBUG
//desenhando meu pai
if(global.debug)
{
	define_align(fa_middle, fa_center);
	draw_set_color(c_white);
	draw_text(x + sprite_width, y + 16, object_get_name(pai.object_index));
	define_align(-1, -1);
	draw_set_color(-1);
}