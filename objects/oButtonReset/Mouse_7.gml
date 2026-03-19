//variavel para confimar que passou de fase e outras coisas
oSFX.buttonSnd = true;

reset_stage();

if oPosPartida.ganhou
{
	//show_message("ganhou");
	
	global.moedas += 100;
	
	if global.guardarFase == global.UltimaFase
	{
		global.UltimaFase++;	
		var _qualPeixeLiberar = global.guardarFase - 1;
		if(!global.tutorial_ativo) global.TrancadoPeixe[_qualPeixeLiberar] = false;	
	}
}
else
{
	//show_message("perdeu");
}

save_game();
Transition(TRANS_MODE.GOTO, global.resetFase);