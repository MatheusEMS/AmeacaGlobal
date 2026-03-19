//SE CLICOU EM MIM

if room != rm_album //se não estou no album
{
	//PAUSANDO
	if(screen_pause() == true)
	{
		exit; //não executo o resto do código
	}
	
	//se estou no tutorial
	if(instance_exists(obj_tutorial))
	{
		//se ainda não cheguei na etapa 12
		if(obj_tutorial.etapa < 12) exit; //não executo mais nada
	}
	
	//debug
	if(global.debug) {show_debug_message("clicou especial: " +string(nome));}
	
	//se não estou em cooldown nem ativo
	if (cooldown <= 0 && !ativo)
	{
		//ativo meu efeito
		ativo = true;
		
		//entro em cooldown
		cooldown = cooldownSave;
		
		oSFX.upandoPeixeSnd = true;
	}
}
