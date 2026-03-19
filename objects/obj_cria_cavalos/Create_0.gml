/// @description Insert description here
// You can write your code in this editor
timer_cria = noone;
torre_dona = noone;
offsets = []; //posiçõe spossíveis no grid (em pixels)
hover_index = -1; //indice da ppção que está sob o mouse
selecionado = false;
altura_min = 96;
altura_max = 576;

//funções locais
function calcular_movimentos_L(_base_x, _base_y)
{
	var grid = 32;
	var posicoes = [];
	
	//8 offsets (em L)
	array_push(posicoes, [_base_x + grid, _base_y - grid * 3]);
	array_push(posicoes, [_base_x - grid, _base_y - grid * 3]);
	
	array_push(posicoes, [_base_x + grid, _base_y + grid * 3]);
	array_push(posicoes, [_base_x - grid, _base_y + grid * 3]);
	
	array_push(posicoes, [_base_x + grid * 3, _base_y - grid]);
	array_push(posicoes, [_base_x + grid * 3, _base_y + grid]);
										
	array_push(posicoes, [_base_x - grid * 3, _base_y - grid]);
	array_push(posicoes, [_base_x - grid * 3, _base_y + grid]);
	
	return posicoes;
}

function posicao_livre(_px, _py)
{
	//verifica se a posição está livre de torres
	if(collision_rectangle(_px, _py, _px + 32, _py + 32, obj_ani_pai, false, true) != noone)
	{
		return false;
	}
	
	//verifica se há inimigos na posição
	if(collision_rectangle(_px, _py, _px + 32, _py + 32, obj_ini_ame_pai, false, true) != noone)
	{
		return false;
	}
	
	return true;
}