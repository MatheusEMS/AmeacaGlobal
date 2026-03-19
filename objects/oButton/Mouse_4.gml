if(screen_pause()) exit;

//show_message(string(global.tutorial));

if(irPara == rm_tutorial && !pulsa) 
{
	exit;
}

if(global.tutorial_ativo)
{
	if(irPara == rm_tutorial)
	{
		pulsa = false;
		image_xscale = 1;
		image_yscale = 1;
	}
	
	if(irPara == rm_fase_1)
	{
		if(obj_tutorial.etapa == 15) Transition(TRANS_MODE.GOTO, rm_SeqTutorial);
	}
	else if(irPara == rm_album)
	{
		if(obj_tutorial.etapa == 16) Transition(TRANS_MODE.GOTO, rm_album);
	}
	else if(irPara == rm_mapa)
	{
		if(obj_tutorial.etapa == 29) Transition(TRANS_MODE.GOTO, rm_mapa);
	}
	exit;
}

global.guardarFase = fase;
//show_message(global.guardarFase);

oSFX.buttonSnd = true;

if irPara != rm_album && irPara != rm_mapa
{
	global.level = level;
	//show_message(global.level);
	if !instance_exists(oLevelInfos)
	{
		with (oButton)
		{
			visible = false;	
			instance_deactivate_object(oButton);
		}
		with(instance_create_depth(x,y,0,oLevelInfos))
		{
			qualFase = other.irPara;
		};
	}
}
else
{
	Transition(TRANS_MODE.GOTO, irPara);
}

