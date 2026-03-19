ativo = false;

clicouTrompa = false;

cooldownSave = CooldownTrompa(numero);
cooldown = cooldownSave;
timerSave = DuracaoTrompa(numero);
duracao = timerSave; //duração do efeito (60 = 1 segundo)
descricao = DescTrompa(numero);
nome = NomeTrompa(numero);
efeito = EfeitoTrompa(numero);

trancado = global.TrancadoCarta[numero];

valorDesbloquear = ValorTrompa(numero);

selecionado = false;
radius = 7; //pizza

torres_afetadas = []; //lista de torres afetadas

ativa_efeito = false; //flag de ativação do efeito

///@function aplicar_em(_torre)
function aplicar_em(_torre)
{
	//verificando se a torre já está sob efeito
	for(var i = 0; i < array_length(torres_afetadas); i++)
	{
		var _efeito = torres_afetadas[i];
		
		if(_efeito.torre_id == _torre.id)
		{
			_efeito.tempo_restante = duracao; //renova o tempo
			return; //não aplica o efeito novamente
		}
	}
	
	//se não encontrou a torre, cria novo efeito
    var efeito = {
        torre_id : _torre.id,
        tempo_restante : duracao,
		duracao_padrao : duracao
    };
    
    array_push(torres_afetadas, efeito);
    on_aplicar(_torre);
	
	criar_feedback_duracao(_torre, efeito);
	
	//_torre.selecionado = false;
	//layer_add_instance("Torres", _torre.id);
}
