window_set_fullscreen(global.tela_cheia);

#region MENSAGENS
for(var i = ds_list_size(mensagens_ativas) - 1; i >= 0; i--)
{
	var m = mensagens_ativas[| i];
	
	if(!mensagem_fixa)
	{
		if(!global.tutorial_ativo)
		{
			m.alpha -= 0.0015;
		}
		else
		{
			m.alpha -= 0.015;
		}
		
	}
	
	if(m.alpha <= 0)
	{
		ds_list_delete(mensagens_ativas, i);
	}
	else
	{
		mensagens_ativas[| i] = m;
	}
}


#endregion