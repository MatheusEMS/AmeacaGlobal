//paro a minha animação
image_index = 0;

//pause self
if screen_pause() == true
{
	global.coins += custo; //devolve o dinheiro
	instance_destroy(); //me destruo
	exit;
}

//iniciando variáveis
var _aperta_esq = mouse_check_button_pressed(mb_left);
var _aperta_dir = mouse_check_button_pressed(mb_right);
var _slot = instance_place(x, y, obj_slot);

//cancelando compra da torre
if(_aperta_dir) //se apertar o botão direito do mouse
{
	instance_destroy(); //me destruo
	global.coins += custo; //devolvo o valor para o player
}

if(!place_meeting(x, y, obj_ani_pai) && _slot) //se não estou em cima de outra torre
{
	if(_slot.num <= 3)
	{
		image_blend = c_white; //minha cor é a padrão
		
		if(_aperta_esq) //se apertar o botão esquerdo do mouse
		{
			//show_debug_message("clicou com a esquerda");
			
			//largando a torre no jogo
			with(instance_create_layer(x, y, "Torres", animal)) //crio a torre de fato
			{
				alcance = other.alcance;
				custo = other.custo;
				explosao = other.explosao;
                pai = other.object_index;
			}
			instance_destroy(); //me destruo
		}
	}
	else
	{
		image_blend = (c_red); //deixo minha cor avermelhada
	}
}
else //se não, se estou em cima de outra torre
{
	image_blend = (c_red); //deixo minha cor avermelhada
}

//configurando minha posição
var grid = 32;
var spr_w = sprite_width;
var spr_h = sprite_height;

// Alinhamento padrão: canto inferior esquerdo na célula
x = (mouse_x div grid) * grid;
y = ((mouse_y + spr_h) div grid) * grid;

// Se o sprite NÃO for múltiplo de 32, centraliza dentro da célula
if (spr_w mod grid != 0 || spr_h mod grid != 0) {
    x += (grid - spr_w) / 2;
    y -= (grid - spr_h) / 2;
}


//var grid = 32;
//
//// Snap ao grid (considerando origem no canto INFERIOR ESQUERDO)
//x = (mouse_x div grid) * grid;
//y = ((mouse_y + sprite_height) div grid) * grid;


////X
//if(mouse_x % 32 == 0) //se meu destino_x é dentro do grid
//{
//	x = mouse_x; //meu destino final é meu destino_x
//}
//else //se não
//{
//	//descobrindo a diferença entre meu destino_x e a posição mais proxima do grid
//	var _val = real(string_format((mouse_x / 32), 1, 0));
//	var _dif = abs((_val * 32) - mouse_x);
//	
//	//ajustando meu destino final
//	if((mouse_x - _dif) % 32 == 0)
//	{
//		x = mouse_x - _dif;
//	}
//	else
//	{
//		x = mouse_x + _dif;
//	}
//}
//
////Y
//if(mouse_y % 32 == 0) //se meu destino_x é dentro do grid
//{
//	y = mouse_y; //meu destino final é meu destino_x
//}
//else //se não
//{
//	//descobrindo a diferença entre meu destino_x e a posição mais proxima do grid
//	var _val = real(string_format((mouse_y / 32), 1, 0));
//	var _dif = abs((_val * 32) - mouse_y);
//	
//	//ajustando meu destino final
//	if((mouse_y - _dif) % 32 == 0)
//	{
//		y = mouse_y - _dif;
//	}
//	else
//	{
//		y = mouse_y + _dif;
//	}
//}