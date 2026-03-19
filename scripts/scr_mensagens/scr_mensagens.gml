///@function adicionar_mensagem(_texto)
///@desc Adiciona uma mensagem na lista de mensagens ativas.
///@param _texto Texto da mensagem

function adicionar_mensagem(_texto)
{
	if(!instance_exists(obj_gerenciador)) return;
	
	var nova_mensagem = {
		texto: _texto,
		alpha: 1
	};
	
	with(obj_gerenciador)
	{
		ds_list_add(mensagens_ativas, nova_mensagem);
	}
}

function adicionar_mensagem_base()
{
	if(!instance_exists(obj_gerenciador)) return;
	
	var texto = mensagens_base[indice_mensagem];
	indice_mensagem = (indice_mensagem + 1) mod array_length(mensagens_base);
	
	var nova_mensagem = {
		texto: texto,
		alpha: 1
	};
	
	with(obj_gerenciador)
	{
		ds_list_add(mensagens_ativas, nova_mensagem);
	}
}
