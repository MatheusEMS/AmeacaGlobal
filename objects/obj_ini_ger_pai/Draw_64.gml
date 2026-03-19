
if(instance_exists(oPronto))
{
	draw_set_font(fnt_mensagens);
	define_align(fa_middle, fa_center);
	draw_text_outline(RES_W / 2, RES_H / 2 + 48, "Pressione e arraste para selecionar.", cor, c_white, 1);
	define_align(-1, -1);
	draw_set_font(-1);
}

#region FEEDBACK VISUAL WAVE 1
if(contagem_ativa || contagem_finalizou)
{
	var texto = "";
	
	if(contagem_finalizou)
	{
		texto = "HORA DO PEIXE!";
	}
	else
	{
		switch(contador)
		{
			case 3: texto = "3..."; break;
			case 2: texto = "2..."; break;
			case 1: texto = "1..."; break;
		}
	}
	
	if(texto != "")
	{
		define_align(fa_middle, fa_center);
		draw_set_font(fnt_contagem);
		draw_text_outline(display_get_gui_width()/2, display_get_gui_height()/2, texto, c_white, c_black, 2);
	}
	
	//resetando
	define_align(-1, -1);
	draw_set_color(-1);
	draw_set_font(-1);
}
#endregion