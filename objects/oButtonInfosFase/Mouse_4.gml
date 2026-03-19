/// @description ?
oSFX.buttonSnd = true;

//se sou o botão que pula o tutorial
if(sprite_index == spr_botao_reset)
{
	//se ainda não terminou a última etapa do tutorial
	if(!global.tutorial[array_length(global.tutorial) - 1])
	{
		//termina todas as etapas do tutorial
		for(var i = 0; i < array_length(global.tutorial); i++)
		{
			global.tutorial[i] = true;
		}
		
		global.moedas += 100; //recebe 100 recicláveis
		global.UltimaFase++; //libera a fase 1
		room_goto(rm_mapa); //atualiza a room
		save_game();
	}
}

if irParaFase
{
	Transition(TRANS_MODE.GOTO,irPara);
}
else
{
	instance_activate_object(oButton);
	
	if instance_exists(oButton)
	{

		with (oButton)
		{	
			visible = true;	
		}
	}
	
	instance_destroy(oLevelInfos);
	instance_destroy(oButtonInfosFase);
	instance_destroy();
}