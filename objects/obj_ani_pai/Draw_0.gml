

if room == rm_album //desenhar na room do Menu Inventorio
{
	
	//draw_circle(x + 32,y + 32,42,true);

	

	//se existe o inventário
	if instance_exists(oAlbum)
	{
		//se clicou em mim
		if oAlbum.clicouQualPeixe == id
		{
			draw_sprite_ext(sItensAni, numero, x, y, 2, 2, 0, c_blue,image_alpha);
		
		}
		else //se não
		{
			draw_sprite_ext(sItensAni, numero, x, y, 2, 2, 0, c_white,image_alpha);	
		}
	}
	
	//se estou trancado
	if trancado
	{
		//desenha cadeado
		draw_sprite_ext(sTrancado, 0, x + sprite_width, y + sprite_height, sprite_width / 32, sprite_width / 32, 0, c_white, 1);
		image_alpha = 0.5;
	}
	else
	{
		image_alpha = 1;
	}
}
else //se não estou no album
{
	draw_self(); 
	if screen_pause() == false //se não está pausado
	{
		if(global.debug) //debug
		{
			//área onde consegue me selecionar
			draw_rectangle(x, y - sprite_height, x + sprite_width, y, true);
			
			//desenhando meu pai
			define_align(fa_middle, fa_center);
			draw_set_color(c_white);
			//draw_text(x + sprite_width, y + 8, object_get_name(pai));
			define_align(-1, -1);
			draw_set_color(-1);
			
			//CONTANDO MEUS TIROS
			define_align(fa_middle, fa_center);
			draw_text(x + sprite_width / 2, y - sprite_height / 2, tiros);
			define_align(-1, -1);
			
			//Estado
			define_align(fa_middle, fa_center);
			draw_text(x + sprite_height, y + 20, estado);
			define_align(-1, -1);
            
            ///efeito de "carta"	
		    if EfeitoCarta
		    {
                define_align(fa_middle, fa_center);
		    	draw_text(x + sprite_height / 2, y + 40, "efeito");
                define_align(-1, -1);
		    }
            
			//minha força
			define_align(fa_middle, fa_center);
			//draw_text(x + sprite_height / 2, y + 60, "FOR: "+string(forca));
			draw_text(x + sprite_height / 2, y + 60, "mov_padrao: "+string(mov_padrao));
			define_align(-1, -1);
			
			//minha força
			define_align(fa_middle, fa_center);
			//draw_text(x + sprite_height / 2, y + 80, "HP: "+string(vida));
			if(timer_criado <= 0) draw_text(x + sprite_height / 2, y + 80, "posso sel: "+string(posso_selecionar()));
			define_align(-1, -1);
            
		}
        
		//draw Hp
		var _healthPercent = vida / vida_max;
		var _hpImage = _healthPercent * (sprite_get_number(sBarradeVida) - 1);
		//draw_sprite_ext(sBarradeVida, _hpImage ,x + sprite_width - 2 ,y-sprite_height,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		
		//DESENHANDO MEU ALCANCE
		if(col_padrao) //se minha "collision box" é padrão
		{
			if(position_meeting(mouse_x, mouse_y, self)) //se colocar o cursor do mouse em cima de mmim
			{
				if(alcance > 0)
				{
					if(!explosao) //se não sou explosiva
					{
						draw_set_color(c_white); //defino a cor do desenho
						draw_rectangle(x + esq_offset, y - sprite_height - alcance, x + sprite_width + dir_offset, y - sprite_height, true); //desenho meu alcance
						draw_set_color(-1); //reseto a cor de desenho
					}
					else //se sou explosiva
					{
						draw_set_color(c_white);
						var _meia_area = alcance / 2;
						draw_rectangle(x - _meia_area, y - _meia_area, x + _meia_area, y + _meia_area, true);
						draw_set_color(-1);
					}
				}
				
			}
		}
	}
}