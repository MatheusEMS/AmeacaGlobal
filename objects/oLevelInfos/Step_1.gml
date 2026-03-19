/// @description Criar Butoes
//show_debug_message(qualFase);
if instance_number(oButtonInfosFase) < 2
{
	
	with(instance_create_depth(xButao2,yButao2,-1,oButtonInfosFase))
	{
		irPara = other.qualFase;
		nome = "Jogar";
		sprite_index = spr_botao_play;
	}
	
	with(instance_create_depth(xButao1,yButao1,-1,oButtonInfosFase))
	{
		irParaFase = false;
		nome = "Sair";
		sprite_index = spr_botao_close;
	}
	
	//se ainda não terminou a última etapa do tutorial
	if((global.tutorial[array_length(global.tutorial) - 1] == false) && qualFase == rm_tutorial)
	{
		with(instance_create_depth((xButao1 + xButao2) / 2,yButao1,-1,oButtonInfosFase))
		{
			irParaFase = false;
			nome = "Pular Tutorial";
			sprite_index = spr_botao_reset;
		}
	}
	
}