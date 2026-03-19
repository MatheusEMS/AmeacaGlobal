//checando se minha surface existe
//se minha surface NÃO existe
if(!surface_exists(surf))
{
	//preciso criar minha surface
	surf = surface_create(room_width, room_height);
}
else //se a minha surface existe, eu trabalho em cima dela
{
	//definindo meu alvo
	surface_set_target(surf);
	
	//"limpando" minha surface (pintando por cima)
	draw_clear_alpha(cor, alpha);
	
	//desenhando os "buracos" da luz
	//se existe o objeto luz
	if(instance_exists(obj_luz))
	{
		//ele faz o seguinte:
		with(obj_luz)
		{
			//desenhando o buraco
			gpu_set_blendmode(bm_subtract);
			
			//me desenhando
			draw_sprite_ext(sprite_index, image_index, pos_x, pos_y, image_xscale, image_yscale, image_angle, c_white, other.luz_alpha);
			
			//resetando
			gpu_set_blendmode(bm_normal);
			
			//posição
			//pos_x = other.luz_pos_x;
			//pos_y = other.luz_pos_y;
			
			//tamanho
			//tam_x = other.luz_tam_x / sprite_width;
			//tam_y = other.luz_tam_y / sprite_height;
			//image_xscale = other.luz_tam_x / sprite_width;
			//image_yscale = other.luz_tam_y / sprite_height;
		}
	}
	//É AQUI QUE CRIO OS FOCOS DE LUZ PARA O TUTORIAL
	else //se não existe, crio meus objetos luz
	{
		//NOTA
		//se quiser uma luz mais intensa, ler evento draw do obj_luz
		
		//criando os objetos
		cria_luz(luz_pos_x, luz_pos_y, luz_tam_x, luz_tam_y);
	}
	
	//resetando meu alvo
	surface_reset_target();
	
	//desenhando minha surface
	draw_surface(surf, 0, 0);
}

//QUANDO ACABA O TUTORIAL, ME DESTRUO
if(!global.tutorial_ativo) //por enquanto, o esquerdo do mouse é que me destrói
{
	if(instance_exists(obj_luz))
	{
		with(obj_luz)
		{
			instance_destroy();
		}
	}
	instance_destroy();
}