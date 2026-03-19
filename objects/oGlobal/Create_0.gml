//moedas loja (recicláveis)
global.moedas = 0;

global.TerminouJogo = false;

global.resetFase = noone;

#region tutorial
global.tutorial_ativo = false;

global.tutorial = [
	//PARTE 1. JOGANDO
	/*0*/ false //animais
	/*1*/,false //animais
	/*2*/,false //animais
	/*3*/,false //pérolas
	/*4*/,false //inimigos
	/*5*/,false //ameaças e vida
	/*6*/,false //movimentação
	/*7*/,false //testando a gameplay
	//BARCO COMEÇA A SE MOVER NORMALMENTE
	/*8*/,false //trompas
	/*9*/,false //trompas
	/*10*/,false //testando a gameplay
	/*11*/,false //especiais
	/*12*/,false //testando a gameplay
	/*13*/,false //ostra
	/*14*/,false //progressão
	
	//PARTE 2. MAPA
	/*15*/,false //desbloquio de fases
	//CUTSCENE 2.
	/*16*/,false //loja, coleção
	
	//PARTE 3. BIG & MART
	/*17*/,false //loja, coleção, Big e Mart
	/*18*/,false //aba animais
	/*19*/,false //animais
	/*20*/,false //aba ameaças
	/*21*/,false //ameaças
	/*22*/,false //aba trompas
	/*23*/,false //trompas
	/*24*/,false //aba especiais
	/*25*/,false //especiais
	
	//PARTE 4. ENCERRAMENTO
	/*26*/,false //fim do tutorial
	/*27*/,false //fim do tutorial
	/*28*/,false //fim do tutorial
	/*29*/,false //fim do tutorial
	/*30*/,false //fim do tutorial
];
#endregion

global.UltimaFase = 1;
global.guardarFase = 1;

//nível dos animais
global.LVpeixes = [
	1	//peixe-arqueiro
	,1	//lagosta
	,1	//tartaruga
	,1	//baiacu
	,1	//poraquê
	,1	//arraia
];

global.TrancadoPeixe = [
	false //peixe-arqueiro
	,true //lagosta
	,true //tartaruga
	,true //baiacu
	,true //poraquê
	,true //arraia
];

//Especiais
global.TrancadoEspecial = [
	false //reforço coralino
	,true //ecco harmonico
];

//Trompas
global.TrancadoCarta = [
	false //dueto de rêmoras
	,true //guarda voraz
	,true //passo equino
	,true //defesa do lar
	,true //casco de craca
	,true //abraço curador
	,true //para o alto!
];

//Inimigos
global.TrancadoInimigo = [
	true //pneu
	,true //lata comida
	,true //garrafa plastico
	,true //lata bebida
	,true //sacola
];