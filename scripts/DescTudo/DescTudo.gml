#region Fases
function FaseNome(qualFase)
{
	var _nome = "";
	
	if(qualFase == rm_tutorial)
	{
		_nome = "Fase Tutorial - Fundo Sujo";
	}
	else if (qualFase == rm_fase_5)
	{
		_nome = "Fase Final - O Grande Vazamento";
	}
	else if (qualFase == rm_fase_4)
	{
		_nome = "Fase 4 - O Aterro Submerso";
	}
	else if (qualFase == rm_fase_3)
	{
		_nome = "Fase 3 - A Fábrica Fantasma";
	}
	else if (qualFase == rm_fase_2)
	{
		_nome = "Fase 2 - Festival do Lataço";
	}
	else if (qualFase == rm_fase_1)
	{
		_nome = "Fase 1 - Operação Saco Plástico";
	}
	
	return _nome;
}

function FaseDescricao(qualFase)
{
	var _descricao = "";
	
	if(qualFase == rm_tutorial)
	{
		_descricao = "Você acaba de criar uma iniciativa de proteção marinha. Um pequeno trecho de recife próximo da costa está sendo ameaçado por resíduos jogados por embarcações de pequeno porte e turistas negligentes. Embora o impacto aqui ainda seja pequeno, é fundamental agir rápido para evitar danos maiores.";
	}
	else if(qualFase == rm_fase_5)
	{
		_descricao = "Todas as ameaças se uniram! Um navio da 'Global Waste' está liberando containers com todos os tipos de lixo conhecidos. É a maior crise ecológica da década - se falharmos, o ecossistema levará décadas para se recuperar.";
	}
	else if(qualFase == rm_fase_4)
	{
		_descricao = "A concessionária 'AutoMar' usou o mar como depósito ilegal de pneus velhos. Cada unidade libera toxinas que matam centenas de peixes por dia. Para piorar, garrafas de óleo de motor acompanham o carregamento!";
	}
	else if(qualFase == rm_fase_3)
	{
		_descricao = "A fábrica clandestina 'Água Pura' despeja garrafas PET não biodegradáveis diretamente no oceano. Seu tamanho pequeno as torna quase invisíveis, mas o volume é assustador: 5.000 unidades por hora!";
	}
	else if(qualFase == rm_fase_2)
	{
		_descricao = "O 'Festival de Música Costeira' deixou um rastro de latas de bebida e comida nas praias. Com a maré alta, elas estão sendo arrastadas para o mar, cortando barbatanas de tartarugas e acumulando-se em cavernas submarinas.";
	}
	else if(qualFase == rm_fase_1)
	{
		_descricao = "A rede de supermercados 'MegaBarril' está testando uma nova embalagem 'biodegradável' que, na realidade, se fragmenta em microplásticos. Sacolas e embalagens de alimentos estão asfixiando os corais. Sua missão: conter o avanço desse material 'inofensivo'.";
	}
	
	return _descricao;
}

function FaseWin(qualFase)
{
	var _vitoria = "";
	
	if(qualFase == rm_tutorial)
	{
		_vitoria = "Graças à sua ação, o recife foi preservado. As entidades responsáveis pela área aplicaram R$ 120 mil em multas contra pescadores e empresas de turismo irregulares.";
	}
	else if qualFase == rm_fase_5
	{
		_vitoria = "MISSÃO CUMPRIDA! A pressão internacional fechou a 'Global Waste'. Vários países assinaram um tratado para banir plásticos de uso único. Você e seus amigos são agora aclamados como heróis dos oceanos!";
	}
	else if qualFase == rm_fase_4
	{
		_vitoria = "Você salvou o berçário de arraias! A 'AutoMar' foi condenada a retirar seus pneus e financiar a criação de um santuário marinho.";
	}
	else if qualFase == rm_fase_3
	{
		_vitoria = "A fábrica 'Água Pura' foi desmantelada! Seu dono foi detido e 80% das garrafas lançadas já foram removidas.";
	}
	else if qualFase == rm_fase_2
	{
		_vitoria = "Você removeu centenas de latas do ecossistema! Os organizadores do festival foram multados em R$ 2 milhões e agora adotaram copos reutilizáveis.";
	}
	else if qualFase == rm_fase_1
	{
		_vitoria = "Você impediu que toneladas de plástico entrassem na cadeia alimentar marinha! A 'MegaBarril' foi processada por propaganda enganosa e obrigada a recolher 90% de suas sacolas.";
	}
	//show_debug_message(_vitoria);
	return _vitoria;
}

function FaseLose(qualFase)
{
	var _derrota = "";
	
	if qualFase == rm_fase_5
	{
		_derrota = "O desastre foi classificado como 'Irreversível'. Dezenas de espécies entraram em extinção, e a acidificação da água tornou a região inabitável por décadas.";
	}
	else if qualFase == rm_fase_4
	{
		_derrota = "Os pneus criaram uma zona morta no mar. Corais centenários morreram envenenados por substâncias poluentes.";
	}
	else if qualFase == rm_fase_3
	{
		_derrota = "As garrafas formaram uma ilha imensa flutuante. Tubarões-frade, por engano, começaram a ingerir os fragmentos, intoxicando parte da cadeia alimentar.";
	}
	else if qualFase == rm_fase_2
	{
		_derrota = "O aço oxidado contaminou a água. Espécies como o polvo-dourado e o peixe-papagaio desenvolveram lesões por metais pesados.";
	}
	else if(qualFase == rm_fase_1)
	{
		_derrota = "As sacolas plásticas formaram uma grossa camada sobre o recife. Corais jovens morreram sufocados, e peixes herbívoros confundiram os fragmentos com alimento.";
	}
	//show_debug_message(_derrota);
	return _derrota;
}

#endregion

#region Torres

//NOME TORRES
function NomeAnim(qualAnim)
{
	var _nome_anim = [
		"PEIXE-ARQUEIRO"	//0
		,"LAGOSTA-BOXEADORA"//1
		,"TARTARUGA-MARINHA"//2
		,"BAIACU"			//3
		,"PORAQUÊ"			//4
		,"ARRAIA-COMUM"		//5
	];
	
	return _nome_anim[qualAnim];
}

//DESCRIÇÃO TORRES
function DescAnim(qualAnim)
{
	var _desc_anim = [
		"O peixe-arqueiro (Toxotes jaculatrix) é um peixe que consegue atirar água para caçar presas, tanto debaixo quanto acima d'água. Ele é nativo da Ásia e da Oceania."
		,"A Lagosta-boxeadora ou 'mantis shrimp' (Stomatopoda) possui um dos golpes mais rápidos do reino animal, disparando suas garras a velocidades comparáveis a tiros de arma de fogo. Também enxerga cores que os humanos nem imaginam!"
		,"As tartarugas marinhas (família Cheloniidae) existem há mais de 100 milhões de anos. Podem migrar milhares de quilômetros entre áreas de alimentação e desova, usando o campo magnético da Terra como um GPS natural."
		,"O baiacu é um peixe venenoso comum na fauna fluvial da América do Sul e, mais especificamente, do Brasil. Ele é conhecido por inchar o corpo quando se sente ameaçado."
		,"'Poraquê' é o nome em tupi para a enguia-elétrica da bacia amazônica. Ele gera choques elétricos fortes para caçar, se defender, navegar e se comunicar. Apesar do nome, não é uma enguia, mas parente do bagre. Ele inspirou a invenção da bateria elétrica!"
		,"A arraia-comum (Dasyatis pastinaca) é um peixe cartilaginoso marinho com uma cauda longa e um espinho venenoso. Ela é carnívora e se alimenta de crustáceos e cefalópodes."
	];
	
	return _desc_anim[qualAnim];
}

//EFEITO TORRES
function EfeitoAnim(qualAnim)
{
	var _efeito_anim = [
		"Dispara uma rajada curta de bolhas contra as ameaças."
		,"Golpeia ameaças corpo a corpo com seu soco poderoso."
		,"Pacífica, mas aguenta muito peso em sua carapaça resistente."
		,"Infla até explodir, causando dano massivo em área."
		,"Eletrocuta ameaças próximas, causando dano por segundo."
		,"Dispara ferrões para cima em 'V' contra as ameaças."
	];
	
	return _efeito_anim[qualAnim];
}

//ALCANCE TORRES
function RangeAnim(qualAnim)
{
	var _alcance_anim = [
		128 //Peixe-arqueiro
		,32 //Lagosta-boxeadora
		,0 //Tartaruga-marinha
		,128 //Baiacu
		,192 //Poraquê
		,192 //Arraia-comum
	];
	
	return _alcance_anim[qualAnim];
}

//CUSTO TORRES
function CustoAnim(qualAnim)
{
	var _custo_anim = [
		10 //Peixe-arqueiro
		,20 //Lagosta-boxeadora
		,30 //Tartaruga
		,40 //Baiacu
		,50 //Poraquê
		,60 //Arraia-comum
	];
	
	return _custo_anim[qualAnim];
}

//DANO-ATAQUE TORRES
function AtaqueAnim(qualAnim, level)
{
	//dano por nível
	var _atk_list = [
	//nível:
	//1, 2, 3
	0.2, 0.4, 0.6 //Peixe-arqueiro
	,1.5, 2.5, 3.5 //Lagosta-boxeadora
	,0 ,0 ,0 //Tartaruga
	,3, 4, 5 //Baiacu
	,1, 2, 3 //Poraquê
	,1, 1.5, 2 //Arraia-comum
	];
	
	var n = 0;
	
	for(var i = -1; n < array_length(_atk_list) / 3; i += 2)
	{
		var _atk_anim = _atk_list[qualAnim + level + i];
		
		if(qualAnim == n)
		{
			return _atk_anim;
		}
		
		n++;
	}
	
	//nº do animal	-> pos. do dano no array
	//0				-> 0, 1, 2
	//1				-> 3, 4, 5
	//2				-> 6, 7, 8
	//3				-> 9, 10, 11
	
	//procurando a equação que usa o nº e o level do animal para encontrar a posição do dano no array:
	//[Qa, 1] = Qa * 3
	//[Qa, 2] = [Qa, 1] + 1
	//[Qa, 3] = [Qa, 2] + 1
	
	//var _atk_anim = _atk_list[qualAnim + level - 1] //funciona pro arqueiro
	//							//nº 0
	//var _atk_anim = _atk_list[qualAnim + level + 1] //funciona pro baiacu
	//							//nº 1
	//var _atk_anim = _atk_list[qualAnim + level + 3] //funciona pro arraia
	//							//nº 2
	//var _atk_anim = _atk_list[qualAnim + level + 5] //funciona pro poraquê
	//							//nº 3
	//var _atk_anim = _atk_list[qualAnim + level + 7]
	//							//nº 4
	//var _atk_anim = _atk_list[qualAnim + level + 9]
								//nº 5
}

//VIDA TORRES
function VidaAnim(qualAnim,level)
{
	var _vida_list = [
		1,2,3 //peixe-arqueiro
		,2,3,4 //lagosta
		,3,4,5 //tartaruga
		,0,0,0 //baiacu
		,4,5,6 //poraquê
		,6,7,8 //arraia
	];
	
	var n = 0;
	
	for(var i = -1; n < array_length(_vida_list) / 3; i += 2)
	{
		var _vida_anim = _vida_list[qualAnim + level + i];
		
		if(qualAnim == n)
		{
			return _vida_anim;
		}
		
		n++;
	}
}

//FORÇA TORRES
function ForcaAnim(qualAnim)
{
	var _forca_anim = [
		1 //peixe-arqueiro
		,2 //lagosta
		,8 //tartaruga
		,0 //baiacu
		,3 //poraquê
		,4 //arraia	
	];
	
	return _forca_anim[qualAnim];
}

//COOLDOWN DE TIRO TORRES
function CdTiroAnim(qualAnim)
{
	var _cd_tiro_anim = [
		120 //peixe-arqueiro
		,80 //lagosta
		,0 //tartaruga
		,0 //baiacu
		,180 //poraquê
		,20 //arraia
	];
	
	return _cd_tiro_anim[qualAnim];
}

//VALOR UPGRADE TORRES
function UpgradeAnim(qualAnim)
{
	var _val_upgrade = [
		25 //peixe arqueiro
		,25 //lagosta
		,25 //tartaruga
		,50 //baiacu
		,50 //poraquê
		,75 //arraia
	];
	
	return _val_upgrade[qualAnim];
}

//SPRITES TORRES
function SpriteAnim(qualAnim, Sprite)
{
	var _sprite = [
			noone //arqueiro
			,noone //lagosta
			,noone //tartaruga
			,noone //baiacu
			,noone //poraque
			,noone //arraia
		];
		
	switch(Sprite)
	{
		case "idle":
		{
			
			//atualizar aqui
			
			_sprite = [
				spr_ani_arqueiro_idle
				,spr_ani_lagosta_idle
				,spr_ani_tartaruga_idle
				,spr_ani_baiacu_idle
				,spr_ani_enguia_idle
				,spr_ani_arraia_idle
			];
			
			break;
		}
		
		case "swim":
		{
			_sprite = [
				spr_ani_arqueiro_swim
				,spr_ani_lagosta_swim
				,spr_ani_tartaruga_swim
				,noone //baiacu
				,spr_ani_enguia_swim
				,spr_ani_arraia_swim
			];
			
			break;
		}
		
		case "hit":
		{
			_sprite = [
				spr_ani_arqueiro_hit
				,spr_ani_lagosta_hit
				,spr_ani_tartaruga_hit
				,noone //baiacu
				,spr_ani_enguia_hit
				,spr_ani_arraia_hit
			];
			
			break;
		}
		
		case "attack":
		{
			_sprite = [
				spr_ani_arqueiro_attack
				,spr_ani_lagosta_attack
				,noone //tartaruga
				,spr_ani_baiacu_idle
				,spr_ani_enguia_attack
				,spr_ani_arraia_attack
			];
			
			break;
		}
		
		case "extra":
		{
			_sprite = [
				spr_ani_arqueiro_lado //cutscenes
				,noone //lagosta
				,spr_ani_tartaruga_hide
				,noone //baiacu
				,noone //poraque
				,spr_ani_arraia_help //cutscenes
			];
			
			break;
		}
		
		case "album":
		{
			_sprite = [
				spr_ani_arqueiro_icon
				,spr_ani_lagosta_icon
				,spr_ani_tartaruga_icon
				,spr_ani_baiacu_icon
				,spr_ani_enguia_icon
				,spr_ani_arraia_icon
			];
			
			break;
		}
	}
	
	return _sprite[qualAnim];
}

//OBJ DRAGGED TORRES
function DragAnim(qualAnim)
{
	var _drag_anim = [
		obj_ani_drag_0_arqueiro
		,obj_ani_drag_1_lagosta
		,obj_ani_drag_2_tartaruga
		,obj_ani_drag_3_baiacu
		,obj_ani_drag_4_poraque
		,obj_ani_drag_5_arraia
	];
	
	return _drag_anim[qualAnim];
}

//OBJ TORRES IN GAME
function GameAnim(qualAnim)
{
	var _game_anim = [
		obj_ani_0_arqueiro
		,obj_ani_1_lagosta
		,obj_ani_2_tartaruga
		,obj_ani_3_baiacu
		,obj_ani_4_poraque
		,obj_ani_5_arraia
	];

	return _game_anim[qualAnim];
}

//OBJ TORRES CLICÁVEIS
function ClickAnim(qualAnim)
{
	var _click_anim = [
		obj_ani_click_0_arqueiro
		,obj_ani_click_1_lagosta
		,obj_ani_click_2_tartaruga
		,obj_ani_click_3_baiacu
		,obj_ani_click_4_poraque
		,obj_ani_click_5_arraia
	];
	
	if (qualAnim >= 0 && qualAnim < array_length(_click_anim))
	{
		return _click_anim[qualAnim];
	}
	return noone;
}

#endregion

#region Trompas
//NOME TROMPAS
function NomeTrompa(qualTrompa)
{
	var _nome_trompa = [
		"DUETO DE RÊMORAS"
		,"GUARDA VORAZ" //piranha
		,"PASSO EQUINO"
		,"DEFESA DO LAR" //anemona
		,"CASCO DE CRACA"
		,"ABRAÇO CURADOR" //estrela do mar
		,"PARA O ALTO!" //stargazer
	];
	
	return _nome_trompa[qualTrompa];
}

//DESCRIÇÃO TROMPAS (CARTAS)
function DescTrompa(qualTrompa)
{
	var _desc_trompa = [
		//DUETO DE RÊMORA
		"A rêmora (família Echeneidae) é conhecida por se prender a tubarões e outros grandes peixes com uma ventosa na cabeça. Ela se aproveita da locomoção do hospedeiro e se alimenta dos restos que ele deixa. A rêmora é frequentemente usada como exemplo de comensalismo."
		//GUARDA VORAZ (PIRANHAS)
		,"As piranhas (família Serrasalmidae) são peixes carnívoros de água doce, famosos por sua mordida forte e dentes afiados. Apesar da fama, são importantes para o equilíbrio ecológico, limpando as águas e regulando a população de outros peixes e organismos aquáticos."
		//PASSO EQUINO
		,"O cavalo-marinho (Hippocampus) é um peixe curioso, com corpo vertical e cauda preênsil. Sua cabeça lembra a de um cavalo, e o macho é quem 'engravida' e carrega os filhotes em uma bolsa especial!"
		//DEFESA DO LAR (ANÊMONA)
		,"As anêmonas-do-mar (ordem Actiniaria) são animais marinhos urticantes que vivem fixos, como se fossem flores aquáticas. Seus tentáculos possuem células com veneno que paralisam pequenas presas ou afastam predadores. A relação entre anêmonas e peixes (especialmente peixes-palhaço) é um exemplo de mutualismo."
		//CASCO DE CRACAS
		,"As cracas (subclasse Cirripedia) são crustáceos que vivem colados em rochas, conchas, navios -até em baleias! Apesar da aparência imóvel, passam a juventude nadando livremente, até que escolhem um ponto para se fixar e o fazem com uma das substâncias naturais mais fortes que se conhece!"
		//ABRAÇO CURADOR (ESTRELA)
		,"As estrelas-do-mar (classe Asteroidea) são equinodermos com grande capacidade de regeneração. Algumas espécies podem reconstruir braços perdidos -e até o corpo inteiro a partir de um só braço!"
		//PARA O ALTO! (STARGAZER)
		,"Os stargazers (família Uranoscopidae) são peixes predadores com olhos e boca voltados para cima. Eles se enterram na areia e atacam de surpresa presas que nadam acima deles."
	];
	
	return _desc_trompa[qualTrompa];
}

//EFEITO TROMPAS
function EfeitoTrompa(qualTrompa)
{
	var _efeito_trompa = [
		//DUETO DE RÊMORA
		"Duas rêmoras (Echeneidae) grudam no animal -uma de cada lado- e disparam bolhas nas ameaças."
		//GUARDA VORAZ (PIRANHAS)
		,"Piranhas (Serrasalmidae) passam a orbitar o animal. Ameaças que permanecem ao redor dele sofrem dano por segundo."
		//PASSO EQUINO
		,"Um cardume de cavalos-marinhos (Hippocampus) surge ao redor do animal. Ela passa a se mover em 'L'."
		//DEFESA DO LAR (ANÊMONA)
		,"O animal se abriga em uma poderosa Anêmona (Actinaria), ameaças que tocarem nele sofrem dano e são empurrados para cima."
		//CASCO DE CRACAS
		,"Cracas (Cirripedia) cobrem o animal, aumentando sua resistência mas o impedindo de se mover."
		//ABRAÇO CURADOR (ESTRELA)
		,"Estrelas-do-mar (Asteroidea) reforçam o animal com sua regeneração, fazendo-o recuperar vida por segundo."
		//PARA O ALTO! (STARGAZER)
		,"Um Stargazer (Uranoscopidae) passa a avisar o animal sobre ameaças, fazendo com que ele se mova sozinho para detê-las."
	];
	
	return _efeito_trompa[qualTrompa];
}

//COOLDOWN TROMPAS
function CooldownTrompa(qualTrompa)
{
	
	var _cooldown_trompa = [
		20 //Dueto de Rêmora
		,15 //Guarda Voraz (piranhas)
		,15 //Passo Equino
		,20 //Defesa do Lar (anemona)
		,15 //Casco de Craca
		,15 //Abraço Curador (estrela)
		,25 //Para o Alto! (Stargazer)
	];
	
	return _cooldown_trompa[qualTrompa];
}

//DURAÇÃO TROMPAS
function DuracaoTrompa(qualTrompa)
{
	var _duracao_trompa = [];
	
	if(!global.tutorial_ativo)
	{
		_duracao_trompa = [
			15 //Dueto de Rêmora
			,10 //Guarda Voraz (piranhas)
			,10 //Passo Equino
			,15 //Defesa do Lar (anemona)
			,10 //Casco de Craca
			,10 //Abraço Curativo (estrela)
			,20 //Para o Alto! (Stargazer)
		];
	}
	else
	{
		_duracao_trompa = [
			45 //Dueto de Rêmora
			,10 //Guarda Voraz (piranhas)
			,10 //Passo Equino
			,15 //Defesa do Lar (anemona)
			,10 //Casco de Craca
			,10 //Abraço Curativo (estrela)
			,20 //Para o Alto! (Stargazer)
		];
	}
	
	return _duracao_trompa[qualTrompa];
}

//VALOR TROMPAS
function ValorTrompa(qualTrompa)
{
	var _valor_trompa = [
		150 //dueto de remora
		,100 //guarda voraz
		,75 //passo equino
		,125 //defesa do lar
		,50 //casco de craca
		,100 //abraço curador
		,150 //para o alto!
	];
	
	return _valor_trompa[qualTrompa];
}

//OBJ TROMPAS IN GAME
function GameTrompa(qualTrompa)
{
	var _game_trompa = [
		obj_trompa_0_remora //Dueto de Rêmora
		,obj_trompa_1_piranha //Guarda Voraz
		,obj_trompa_2_cavalo //Passo Equino
		,obj_trompa_3_anemona //Defesa do Lar
		,obj_trompa_4_craca //Casco de Craca
		,obj_trompa_5_estrela //Abraço Curativo
		,obj_trompa_6_stargazer //Para o Alto!
	];
	
	return _game_trompa[qualTrompa];
}

#endregion

#region Especiais
//NOME ESPECIAIS
function NomeEspecial(qualEspecial)
{
	var _nome_especial = [
		"REFORÇO CORALINO"
		,"ECCO HARMÔNICO" //golfinho
	];
	
	return _nome_especial[qualEspecial];
}

//DESCRIÇÃO ESPECIAIS
function DescEspecial(qualEspecial)
{
	var _desc_especial = [
		//REFORÇO CORALINO
		"Os corais (classe Anthozoa) formam colônias incríveis de minúsculos animais chamados pólipos. Juntos, constroem recifes que abrigam 25% da vida marinha -mesmo cobrindo menos de 1% do fundo oceânico! O branqueamento de corais é um dos efeitos mais visíveis das mudanças climáticas, que estão causando o aumento da temperatura das águas do mar."
		//ECCO HARMÔNICO
		,"O golfinho-comum (Delphinus delphis) é um dos animais mais inteligentes do planeta. Usa ecolocalização para se comunicar e caçar, além de exibir comportamentos sociais complexos e até culturas próprias. O termo 'boto' é usado popularmente no Brasil para se referir aos golfinhos de água doce, principalmente na região amazônica, onde tem origem uma conhecida lenda indígina sobre botos."
	];
	
	return _desc_especial[qualEspecial];
}

//EFEITO ESPECIAIS
function EfeitoEspecial(qualEspecial)
{
	var _efeito_especial = [
		//REFORÇO CORALINO
		"Disparos geram fragmentos que atingem outros inimigos."
		//ECCO HARMÔNICO
		,"Reduz em 5 segundos o tempo de recarga de todas as trompas."
	];
	
	return _efeito_especial[qualEspecial];
}

//COOLDOWN ESPECIAIS
function CooldownEspecial(qualEspecial)
{
	var _cooldown_especial = [
		20 //Reforço Coralino
		,10 //Ecco Harmônico
	];
	
	return _cooldown_especial[qualEspecial];
}

//DURAÇÃO ESPECIAIS
function DuracaoEspecial(qualEspecial)
{
	var _duracao_especial = [];
	
	if(!global.tutorial_ativo)
	{
		_duracao_especial = [
			15 //Reforço Coralino
			,0 //Ecco Harmônico
		];
	}
	else
	{
		_duracao_especial = [
		45 //Reforço Coralino
		,0 //Ecco Harmônico
		];
	}
	
	return _duracao_especial[qualEspecial];
}

//VALOR ESPECIAIS
function ValorEspecial(qualEspecial)
{
	var _valor_especial = [
		0 //reforço coralino
		,200 //Ecco harmômico
	];
	
	return _valor_especial[qualEspecial];
}

//OBJ ESPECIAIS IN GAME
function GameEspecial(qualEspecial)
{
	var _game_especial = [
		obj_especial_0_coral //Reforço Coralino
		,obj_especial_1_golfinho //Ecco Harmônico
	];
	
	return _game_especial[qualEspecial];
}

#endregion

#region Inimigos
//NOME INIMIGOS
function NomeAmeaca(qualAmeaca)
{
	var _nome_ameaca = [
		"PNEU"
		,"LATA DE COMIDA"
		,"GARRAFA PLÁSTICA"
		,"LATA DE BEBIBA"
		,"SACOLA PLÁSTICA"
	];
	
	return _nome_ameaca[qualAmeaca];
}

//DESCRIÇÃO INIMIGOS
function DescAmeaca(qualAmeaca)
{
	var _desc_ameaca =
	[
		"O descarte inadequado de pneus compromete rios, solos e a saúde pública, polui a água com microplásticos e metais pesados, contamina o solo e bloqueia o fluxo hídrico. Podem levar até 600 anos para se decompor totalmente. Estima-se que mais de 1 milhão de toneladas de pneus sejam descartadas incorretamente por ano no mundo, parte delas em ambientes aquáticos."
		,"Latas de aço enferrujam em contato com a água, liberando óxidos metálicos e substâncias tóxicas que poluem a água e o solo, prejudicando a vida aquática. Leva cerca de 100 anos para se deteriorar por completo. Centenas de milhares de toneladas de latas ainda vão parar nos oceanos anualmente."
		,"Garrafas plásticas sufocam a fauna aquática e liberam microplásticos que entram na cadeia alimentar. Levam até 450 anos para se decompor. Estima-se que mais de 8 milhões de toneladas de plástico entrem nos oceanos todos os anos."
		,"Mesmo reciclável, a lata de alumínio quando descartada nos mares libera resíduos que afetam peixes e corais. Pode demorar entre 200 e 500 anos para desaparecer na natureza. Cerca de 29 bilhões de latas são descartadas por ano, com uma parcela significativa indo parar nos rios e mares."
		,"Sacolas plásticas facilmente se dispersam em rios e oceanos, onde se tornam armadilhas mortais para tartarugas, aves e outros animais marinhos. Levam até 200 anos para se decompor e, nesse processo, liberam microplásticos. Estima-se que mais de 500 bilhões de sacolas plásticas sejam utilizadas por ano no mundo, muitas delas descartadas incorretamente."
	];
	
	return _desc_ameaca[qualAmeaca];
}

//PESO INIMIGOS
function PesoAmeaca(qualAmeaca)
{
	var _peso_ameaca =
	[
		2 //penu
		,0.5 //lata comida
		,0.2 //garrafa plastico
		,0.25 //lata bebida
		,0.2 //sacola
	];
	
	return _peso_ameaca[qualAmeaca];
}

//DANO INIMIGOS
function DanoAmeaca(qualAmeaca)
{
	var _dano_ameaca =
	[
		2 //pneu
		,1 //lata comida
		,0.25 //garrafa plastico
		,0.5 //lata bebida
		,0.5 //sacola
	];
	
	return _dano_ameaca[qualAmeaca];
}

//VIDA INIMIGOS
function VidaAmeaca(qualAmeaca)
{
	var _vida_ameaca =
	[
		4 //pneu
		,2.5 //lata comida
		,1 //garrafa plastico
		,1.5 //lata bebida
		,1 //sacola
	];
	
	return _vida_ameaca[qualAmeaca];
}

//VELOCIDADE INIMIGOS
function VelAmeaca(qualAmeaca)
{
	var _vel_ameaca =
	[
		0.5 //pneu
		,0.3 //lata comida
		,0.2 //garrafa plastico
		,0.25 //lata bebida
		,0.1 //sacola
	];
	
	return _vel_ameaca[qualAmeaca];
}

//SPRITE INIMIGOS
function SpriteAmeaca(qualAmeaca, pctVida)
{
	var _vida;
	
	if(pctVida > .66)
	{
		_vida = 1;
	}
	else if(pctVida > .33)
	{
		_vida = 2;
	}
	else
	{
		_vida = 3;
	}
	
	//sprite por vida
	var _sprite_list = [
		//por centagem vida:
		//100-67, 66-34, 33-1
		spr_ini_ame_pneu_1, spr_ini_ame_pneu_2, spr_ini_ame_pneu_3 //Pneu
		,spr_ini_ame_lata_1, spr_ini_ame_lata_2, spr_ini_ame_lata_3 //Lata comida
		,spr_ini_ame_garrafa_1, spr_ini_ame_garrafa_2, spr_ini_ame_garrafa_3 //garrafa plastico
		,spr_ini_ame_refri_1, spr_ini_ame_refri_2, spr_ini_ame_refri_3 //lata bebida
		,spr_ini_ame_sacola_1, spr_ini_ame_sacola_2, spr_ini_ame_sacola_3 //sacola
	];
	
	var n = 0;
	
	for(var i = -1; n < array_length(_sprite_list) / 3; i += 2)
	{
		var _sprite_ameaca = _sprite_list[qualAmeaca + _vida + i];
		
		if(qualAmeaca == n)
		{
			return _sprite_ameaca;
		}
		
		n++;
	}
}
#endregion