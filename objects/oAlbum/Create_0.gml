mensagem_tutorial = "";

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

spacingX = 96;
EspacamentoY = 96

xInicial = 216;
yInicial = 96;
xLeft = 68;
xLeftButton = 64;

qtd = 1;
contar = 0;

fileira = 11;
fileiraInicial = 13;

clicouQualPeixe = noone;
clicouQualPeixeButton = noone;
clicouQualInimigo = noone;
clicouQualTrompa = noone;
clicouQualEspecial = noone;
clicouQualLoja = noone;
clicouQualObjetoButton = noone;

aba = 0;
textAba = "";

limparPeixes = false;
limparInimigos = false;
limparTrompas = false;
limparEspeciais = false;
limparLoja = false;

//TORRES
listaPeixe = [
	obj_ani_0_arqueiro
	,obj_ani_1_lagosta
	,obj_ani_2_tartaruga
	,obj_ani_3_baiacu
	,obj_ani_4_poraque
	,obj_ani_5_arraia
];

//INIMIGOS
listaInimigos = [
	obj_ini_ame_0_pneu
	,obj_ini_ame_1_lata
	,obj_ini_ame_2_garrafa
	,obj_ini_ame_3_refri
	,obj_ini_ame_4_sacola
];

//Trompas
listaTrompas = [
	obj_trompa_0_remora //Dueto de Rêmora
	,obj_trompa_1_piranha //Guarda Voraz
	,obj_trompa_2_cavalo //Passo Equino
	,obj_trompa_3_anemona //Defesa do Lar
	,obj_trompa_4_craca //Casco de Craca
	,obj_trompa_5_estrela //Abraço Curativo
	,obj_trompa_6_stargazer //Para o Alto!
];

//ESPECIAIS
listaEspecial = [
	obj_especial_0_coral //Reforço Coralino
	,obj_especial_1_golfinho //Ecco Harmônico
];

//ESPECIAIS
listaLoja = [
	obj_Loja_0 
	,obj_Loja_1 
];