/// @description ?

if layer_sequence_is_finished(layerId)
{
	if(room == rm_SeqTutorial)
	{
		if(instance_exists(obj_tutorial))
		{
			if(obj_tutorial.timer >= 600) Transition(TRANS_MODE.GOTO, rm_mapa);
		}
	}
	else if(room == rm_IntroTutorial)
	{
		Transition(TRANS_MODE.GOTO, rm_mapa);
	}else if (room == rm_CutsFinal)
	{
		global.TerminouJogo = true;
		Transition(TRANS_MODE.GOTO,rm_menu);
	}
	else
	{
		if !instance_exists(oPosPartida)
		{
			instance_create_layer(x,y,"UI",oPosPartida);
		}
	}
}