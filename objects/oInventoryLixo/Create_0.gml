#macro INVENTORY_LIXO 5
rowLength = 12;
inventory = array_create(INVENTORY_LIXO, -1);
//randomize();

numberLixos = sprite_get_number(sItensLixo);
TamInv = 0;


for (var i = 0;i < numberLixos; i ++)
{
	
	for (var j = 0;j < array_length(listLixoFase); j ++)
	{
		if listLixoFase[j] == i
		{
			
			inventory[TamInv] = listLixoFase[j];
			
			TamInv++;
			
			j = array_length(listLixoFase) + 1;
			
		}
	}
}

depth = -8501;
