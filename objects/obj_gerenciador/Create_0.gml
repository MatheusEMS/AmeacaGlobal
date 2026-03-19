randomize();

//iniciando variáveis
global.tela_cheia = false;
global.debug = false;
global.level = 0; //fase
//global.wave = 0; //onda de inimigos //MOVIDO PARA SCRIPT TUTORIAL
global.spd = 0.1; //velocidade geral
global.coins = 250; //dinheiro do jogador

#region VIDA DO PLAYER
global.hp = 10; //vida máxima do jogador
global.hp_atual = global.hp; //vida atual do jogador
corais = 5;
coral_estado = array_create(corais, true); //true = colorido, false = branco

//sprites diferentes para os corais
coral_spr_list = [
	spr_icon_coral_1
	,spr_icon_coral_2
	,spr_icon_coral_3
	,spr_icon_coral_4
	,spr_icon_coral_5
];

//gerando cores aleatórias para cada coral
cor_coral = array_create(corais);

for (var i = 0; i < corais; i++)
{
	var hue = irandom_range(0, 359); // tonalidade (0–359)
	var sat = irandom_range(100, 180); // saturação (0–255)
	var val = irandom_range(150, 225); // brilho (0–255)
	
	var c = make_colour_hsv(hue, sat, val); // cor RGB final
	cor_coral[i] = c;
}

#endregion

#region MENSAGENS

//lidando com mensagens fixas
mensagem_fixa = false;

//lista de mensagens ativas
mensagens_ativas = ds_list_create();

//mensagens pré-definidas
mensagens_base = [
	"De barcos de turismo e navio, à mudança química dos oceanos, a Barreira de Coral da Mesoamérica, no Caribe, é constantemente desafiada por muitas ameaças de uma só vez."
	,"Muitos anos de pesca intensiva, o Recife Apo, nas Filipinas, quase foi totalmente destruído no início de 1990. Apenas um terço resistiu."
	,"Os impactos do turismo, combinados com os danos ocasionados por navios de grande porte, fez com que a UNESCO nomeasse a Barreira de Coral de Belize como Patrimônio Mundial em Perigo."
	,"Infelizmente a Grande Barreira de Coral da Austrália está sob crescente estresse, desde a década de 90, com o aumento das temperaturas dos oceanos e a acidificação das águas, o branqueamento do coral em massa tem sido inevitável."
	,"Muito maior e mais imponente do que qualquer outro recife de coral na Terra, a Grande Barreira de Corais é tão grande quanto o Reino Unido e a Irlanda juntos. Ainda assim, mais da metade da cobertura dos corais do recife já foi perdida."
];

indice_mensagem = 0; //mensagem atual a ser disparada

#endregion

#region CONFIGURANDO O SPAWNER
//definindo as fases e waves
fases = [
	[//fase tutorial
		[obj_ini_ame_1_lata, 1], //wave 1
		[obj_ini_ame_1_lata, 2], //wave 2
		[obj_ini_ame_4_sacola, 3, obj_ini_ame_1_lata, 1], //wave 3
		[obj_ini_ame_2_garrafa, 1], //wave de segurança. NÃO VAI SPAWNAR.
	],
	[//fase 1
		[obj_ini_ame_4_sacola, 2], // Wave 1: 2 sacolas (introdução)
		[obj_ini_ame_4_sacola, 3], // Wave 2: 3 sacolas (controle de espaço)
		[obj_ini_ame_1_lata, 2, obj_ini_ame_4_sacola, 1], // Wave 3: 2 latas + 1 sacola (primeiro mix)
		[obj_ini_ame_1_lata, 4] // Wave 4: 4 latas (teste de dano)
	],
	[//fase 2
		[obj_ini_ame_4_sacola, 3], // Wave 1: Revisão (3 sacolas)
		[obj_ini_ame_3_refri, 1], // Wave 2: 1 lata bebida (primeiro 16x16!)
		[obj_ini_ame_1_lata, 2, obj_ini_ame_3_refri, 1], // Wave 3: Combinação leve
		[obj_ini_ame_3_refri, 2, obj_ini_ame_4_sacola, 1], // Wave 4: 2 latas bebida + 1 sacola
		[obj_ini_ame_1_lata, 3, obj_ini_ame_3_refri, 1], // Wave 5: Pressão média
		[obj_ini_ame_3_refri, 3] // Wave 6: 3 latas bebida (desafio de precisão)
	],
	[//fase 3
		[obj_ini_ame_1_lata, 3], // Wave 1: Latas comida (aquecimento)
		[obj_ini_ame_2_garrafa, 1], // Wave 2: 1 garrafa (alvo difícil)
		[obj_ini_ame_3_refri, 2, obj_ini_ame_2_garrafa, 1], // Wave 3: Dupla pequena
		[obj_ini_ame_1_lata, 2, obj_ini_ame_2_garrafa, 2], // Wave 4: 2 latas + 2 garrafas
		[obj_ini_ame_4_sacola, 3, obj_ini_ame_2_garrafa, 1], // Wave 5: Sacolas + 1 garrafa
		[obj_ini_ame_2_garrafa, 3], // Wave 6: 3 garrafas (pico de precisão)
		[obj_ini_ame_1_lata, 4, obj_ini_ame_3_refri, 1], // Wave 7: Enxurrada média
		[obj_ini_ame_2_garrafa, 2, obj_ini_ame_3_refri, 2] // Wave 8: Fim tenso!
	],
	[//fase 4
		[obj_ini_ame_3_refri, 2], // Wave 1: 2 latas bebida
		[obj_ini_ame_2_garrafa, 2], // Wave 2: 2 garrafas
		[obj_ini_ame_0_pneu, 1], // Wave 3: 1 PNEU (boss solitário!)
		[obj_ini_ame_1_lata, 3, obj_ini_ame_2_garrafa, 1], // Wave 4: Recovery pós-boss
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_4_sacola, 2], // Wave 5: Pneu + sacolas
		[obj_ini_ame_2_garrafa, 3, obj_ini_ame_3_refri, 1], // Wave 6: Garrafas + lata bebida
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_1_lata, 2], // Wave 7: Pneu + latas comida
		[obj_ini_ame_3_refri, 4], // Wave 8: 4 latas bebida (rápidas)
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_2_garrafa, 2], // Wave 9: Pneu + 2 garrafas
		[obj_ini_ame_1_lata, 3, obj_ini_ame_0_pneu, 1] // Wave 10: Clímax!
	],
	[
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_4_sacola, 1], // Wave 1: Pneu + sacola
		[obj_ini_ame_2_garrafa, 2], // Wave 2: 2 garrafas
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_3_refri, 1], // Wave 3: Pneu + lata bebida
		[obj_ini_ame_1_lata, 2, obj_ini_ame_2_garrafa, 1], // Wave 4: 2 latas + 1 garrafa
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_4_sacola, 2], // Wave 5: Pneu + 2 sacolas
		[obj_ini_ame_3_refri, 3], // Wave 6: 3 latas bebida
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_2_garrafa, 2], // Wave 7: Pneu + 2 garrafas
		[obj_ini_ame_1_lata, 4], // Wave 8: 4 latas comida
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_3_refri, 2], // Wave 9: Pneu + 2 latas bebida
		[obj_ini_ame_2_garrafa, 4], // Wave 10: 4 garrafas (apocalipse!)
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_1_lata, 2, obj_ini_ame_4_sacola, 1], // Wave 11: Combinação mista
		[obj_ini_ame_3_refri, 3, obj_ini_ame_2_garrafa, 1], // Wave 12: 3 latas + 1 garrafa
		[obj_ini_ame_0_pneu, 2], // Wave 13: 2 PNEUS (boss duplo!)
		[obj_ini_ame_1_lata, 3, obj_ini_ame_2_garrafa, 2, obj_ini_ame_4_sacola, 1], // Wave 14: Caos completo
		[obj_ini_ame_0_pneu, 1, obj_ini_ame_2_garrafa, 3, obj_ini_ame_3_refri, 2] // Wave 15: Desafio final!
	]
];

//pega a fase atual
waves = fases[global.level];
#endregion

