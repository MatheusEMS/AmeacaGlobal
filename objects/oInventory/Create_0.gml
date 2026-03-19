#macro INVENTORY_SLOTS 15

borderX = 16;
borderY = 36;

rowLength = 12;
inventory = array_create(INVENTORY_SLOTS, -1);
//randomize();
for (var i = 0;i < array_length(global.TrancadoPeixe); i ++)
{
	if !global.TrancadoPeixe[i] 
	{
		inventory[i] = i;
	}
	//inventory[0] = 0; //arqueiro
	//inventory[1] = 1; //baiacu
	//inventory[2] = 2; //arraia
	//inventory[3] = 3; //poraquê
	//inventory[4] = 4; //lagosta
}

depth = -8501;
