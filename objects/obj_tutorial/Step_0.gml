if(global.tutorial_ativo)
{
	//verifica se o input foi atendido
	if(input_confirmado(etapa))
	{
		if(etapa <= 16)
		{
			//Só permite avançar se não houver mensagens ativas
			obj_gerenciador.mensagem_fixa = false;
		}
		else
		{
			avancar_etapa();
		}
	}
	
	if(etapa <= 16)
	{
		if((ds_list_size(obj_gerenciador.mensagens_ativas) == 0))
		{
			avancar_etapa();
		}
	}
}

if(room == rm_SeqTutorial)
{
	timer++;
}