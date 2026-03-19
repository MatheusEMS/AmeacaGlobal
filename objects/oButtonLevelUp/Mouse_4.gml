if(global.tutorial_ativo) exit;

if qualPeixe != noone  && screen_pause() == false
{
	if !qualPeixe.trancado
	{
		if qualPeixe.level < qualPeixe.levelMax
		{
			if global.moedas >= qualPeixe.valor
			{
				oSFX.upandoPeixeSnd = true;
				global.moedas -= qualPeixe.valor;
				qualPeixe.level ++;	
				qualPeixe.salvou = true;
			}
		}
	}
}

/*
if qualPeixe != noone 
{
	if qualPeixe.trancado  
	{
		if global.moedas >= qualPeixe.valorDesbloquear
		{
			global.moedas -= qualPeixe.valorDesbloquear;
			qualPeixe.trancado = false;
		}
	}
}
*/

if  qualObjeto != noone && screen_pause() == false
{
	if qualObjeto.trancado
	{
		if global.moedas >= qualObjeto.valorDesbloquear
		{
			global.moedas -= qualObjeto.valorDesbloquear;
			qualObjeto.trancado = false;
			oSFX.CompraSnd = true;
			
			//cria a tela preta
			if !instance_exists(oTelaPreta)
			{
				instance_create_depth(x,y,0,oTelaPreta);	
			}
			
			//pausa o jogo
			if !instance_exists(oScreenPause)
			{
				instance_create_depth(0,0,0,oScreenPause);
			}else{
				instance_destroy(oScreenPause);
			}
		}
	}
}