//pause self
if screen_pause() == true
{
	instance_destroy();
	exit;
}

//iniciando variáveis
var _esq_click, _dir_clique, _animal;

_esq_click = mouse_check_button_pressed(mb_left);
_dir_clique = mouse_check_button_pressed(mb_right);
_animal = instance_place(x, y, obj_ani_pai);

//ajustando minha posição
if(!diminuir)
{
	x = mouse_x;
	y = mouse_y;
}

//se estou em cima de uma torre
if(_animal != noone)
{
	//se clico com o botão esquerdo
	if(_esq_click)
	{
		animal = _animal;
		cliquei = true;
	}
}

if(cliquei)
{
	if(instance_exists(animal))
	{
		//inicio minha animação
		image_speed = 1;
	}
		
		//se acabou minha animação
		if(animation_end()) 
		{
			image_speed = 0; //paro minha animação
			image_index = 1; //volto pro primeiro frame (aberto)
			
			var _retorno = animal.custo / 2;
			
			oSFX.ostra_engolindo__cortado_Snd = true;
			
			//destrói a torre
			if(animal.estado != "morrendo") animal.estado = "morrendo";
			
			if(!criei)
			{
				//criando o efeito de pérolas
				cria_perolas(10, 30, x, y);
				
				criei = true;
			}
			
			//o jogador recebe metade do custo da torre
			global.coins += _retorno;
			
			if(!diminuir)
			{
				//sumo
				diminuir = true;
			}
		}
}

//CANCELANDO
//se clicar com o botão direito
if(_dir_clique && !diminuir)
{
	diminuir = true;
}

//SUMINDO
//se é para sumir e ainda não sumi
if(diminuir && image_xscale > 0)
{
	//começo a sumir
	image_xscale -= 0.1; 
	image_yscale = image_xscale;
}

//se sumi
if(image_xscale <= 0)
{
	//me destruo
	instance_destroy();
}