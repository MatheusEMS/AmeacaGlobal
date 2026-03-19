#macro INVENTORY_SLOTS_ESPECIAL 10
rowLength = 12;
inventory = array_create(INVENTORY_SLOTS_ESPECIAL, -1);
//randomize();

borderX = 16;
borderY = 36;

for (var i = 0;i < array_length(global.TrancadoEspecial); i ++)
{
	if !global.TrancadoEspecial[i] 
	{
		inventory[i] = i;
	}
	
}

/*
inventory[0] = 0; //reforço coralino
inventory[1] = 1; //ecco harmônico
*/


depth = -8501;