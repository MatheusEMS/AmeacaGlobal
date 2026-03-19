global.TrancadoEspecial[numero] = trancado;



if room != rm_album
{

	//PAUSANDO
	if(screen_pause() == true)
	{
		exit;
	}
	
	//reduzindo meu cooldown
	cooldown = clamp(cooldown,0,500);
	cooldown -= 1/60;
	
	//se fui ativado E meu efeito tem duração
	if (ativo && timerSave > 0)
	{
		//reduzinho minha duração
		timer -= 1/60;
		
		//se acabou minha duração
		if (timer <= 0)
		{
			ativo = false;	//desativo
			timer = timerSave; //reseto minha duração
		}
	}
}else
{
	if point_in_circle(mouse_x,mouse_y,x+32,y+32,42) && mouse_check_button_pressed(mb_left)
	{
		if instance_exists(oAlbum) //se existe o inventário
		{
			oAlbum.clicouQualEspecial = id; //o inventário grava que clicaram em mim
		}	
	}
}