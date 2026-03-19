

//desenhar só na sala inventario
if room == rm_album
{
	//draw_circle(x+32,y+32,42,true);

	if instance_exists(oAlbum)
	{
		if oAlbum.clicouQualInimigo == id //SE CLICOU
		{
			draw_sprite_ext(sItensLixo,numero,x,y,2,2,0,c_blue,image_alpha);
		}
		else //SE NÃO
		{
			draw_sprite_ext(sItensLixo,numero,x,y,2,2,0,c_white,image_alpha);
		}
	}
	
	//se estou trancado
	if trancado
	{
		//desenha cadeado
		draw_sprite_ext(sTrancado, 0, x + 32, y + 32, 1, 1, 0, c_white, 1);
		image_alpha = 0.5;
	}
	else
	{
		image_alpha = 1;
	}
}
else
{
	//me desenhando
	//draw_self();
	
	draw_sprite_ext(sprite_index, image_index, x, y, scale_x, scale_y, image_angle, c_white, image_alpha);
	
	scale_x = lerp(scale_x, image_xscale, 0.2);
	scale_y = lerp(scale_y, image_yscale, 0.2);
	
	//DEBUG
	if(global.debug)
	{
		//desenhando minha vida
		define_align(fa_middle, fa_center);
		draw_text(x, y, hp);
		define_align(-1, -1);
	    
	    //desenhando meu peso
	    define_align(fa_middle, fa_center);
		draw_text(x, y + 20, "Peso: "+string(peso));
		define_align(-1, -1);
		
	    //desenhando meu cooldown para dano
	    define_align(fa_middle, fa_center);
		draw_text(x, y + 40, "timer dano: "+string(timer_dano));
		define_align(-1, -1);
	}
}