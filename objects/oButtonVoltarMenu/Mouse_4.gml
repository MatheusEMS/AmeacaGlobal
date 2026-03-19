//variavel para confimar que passou de fase e outras coisas
oSFX.buttonSnd = true;

reset_stage();

if oPosPartida.ganhou
{
	//show_message("ganhou");
	
	if room == rm_SalvaArraia
	{
		global.moedas += 100;
		global.TrancadoPeixe[5] = false;
		save_game();
		
		Transition(TRANS_MODE.GOTO, rm_CutsFinal);
	}else
	{
		global.moedas += 100;
	
		if global.guardarFase == global.UltimaFase
		{
			global.UltimaFase++;
			var _qualPeixeLiberar = global.guardarFase - 1;
			if(!global.tutorial_ativo) global.TrancadoPeixe[_qualPeixeLiberar] = false;	
			
		}
	}
	

}
else
{
	//show_message("perdeu");
}

if room != rm_SalvaArraia
{
	save_game();
	Transition(TRANS_MODE.GOTO, rm_mapa);
}