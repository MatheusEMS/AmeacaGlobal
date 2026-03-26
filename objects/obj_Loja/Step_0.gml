
	if point_in_circle(mouse_x,mouse_y,x+32,y - 32,42) && mouse_check_button_pressed(mb_left)
	{
		if instance_exists(oAlbum) //se existe o inventário
		{
			oAlbum.clicouQualLoja = id; //o inventário grava que clicaram em mim
		}	
	}
