//me desenhando
draw_self();



//desenhando minha duração
if(global.debug)
{
	draw_text(x, y - sprite_height, lado);
	draw_text(x, y + sprite_height, instance_number(obj_ani_remora));
	
	if (is_struct(efeito_data) && variable_instance_exists(efeito_data, "tempo_restante"))
	{
	    define_align(fa_middle, fa_center);
	    draw_set_color(c_white);
	    draw_text(x + sprite_width / 2, y + sprite_height + 2,  string_format(efeito_data.tempo_restante, 0, 2));
		define_align(-1, -1);
		draw_set_color(-1);
	}
}

