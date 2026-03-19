event_inherited(); // herda comportamento do pai

if (room != rm_album)
{
	if (estado != "morrendo" && estado != "nadando") 
	{
		//se há inimigo nas costas
		if (place_meeting(x, y - 1, obj_ini_ame_pai))
		{
			//se ainda não estou no estado "extra"
			if (estado != "extra")
			{
				selecionado = false; //deixo de estar seleciona <- precisa disso? só fico selecionado no estado nadando e só entro aqui SE NÃO estou no estado nadando
				layer_add_instance("Torres", id); //volto para a camada das torres NÃO selecionadas <- precisa disso? só fico selecionado no estado nadando e só entro aqui SE NÃO estou no estado nadando
				estado = "extra"; //mudo para o estado "extra"
				image_index = 0; //começo no frame 1
				image_speed = 1; //velocidade normal da animação
			}
		}
		else //se não tem inimigo nas minhas costas
		{
			//se estou no estado "extra" e minha animação acabou
			if (estado == "extra" && animation_end())
			{
				//volta para parado
				estado = "parado";
				image_speed = 1;
			}
		}
	
		//se estou no estado extra
		if (estado == "extra")
		{
			//se chegou no final da animação
			if (animation_end())
			{
				//para no último frame	
				image_index = image_number - 1;
				image_speed = 0;
			}
			
			//condição para troca de estados
			//indo para nadando
			if(mov_padrao) //se meu movimento é padrão
			{
				//timer para evitar grudar no mouse quando criado
				if(timer_criado > 0)
				{
					timer_criado--;
				}
				
				//se os critérios pra me selecionar são atendidos
				if(posso_selecionar())
				{
					selecionado = true; //fico selecionado
					layer_add_instance("Torres_Selecionadas", id); //vou pra camada das torres selecionadas
					estado = "nadando";
				}
			}
		}
	}
}
