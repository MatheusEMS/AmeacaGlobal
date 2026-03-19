#macro INVENTORY_SLOTS_CARTAS 16
rowLength = 12;
inventory = array_create(INVENTORY_SLOTS_CARTAS, -1);
//randomize();

borderX = 16;
borderY = 36;

for (var i = 0;i < array_length(global.TrancadoCarta); i ++)
{
	if !global.TrancadoCarta[i] 
	{
		inventory[i] = i;
	}
	
}
/*
inventory[0] = 0; //Dueto de Rêmoras
inventory[1] = 1; //Guarda Voraz (piranha)
inventory[2] = 2; //Passo Equino
inventory[3] = 3; //Defesa do Lar (anemona)
inventory[4] = 4; //Casco de Craca
inventory[5] = 5; //Abraço Curativo (estrela)
inventory[6] = 6; //Para o Alto! (stargazer)
*/

depth = -8501;