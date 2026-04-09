draw_self();

//desenhar só na sala inventario
if(room == rm_album)
{
	//draw_circle(x+32,y-32,42,true);
	
	//se to trancado
	if(trancado)
	{
		//desenho cadeado
		draw_sprite_ext(sTrancado, 0, x + sprite_width / 2, y - sprite_height / 2, sprite_width / 64, sprite_width / 64, 0, c_white, 1);
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
		if(oAlbum.clicouQualLoja == id)
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
