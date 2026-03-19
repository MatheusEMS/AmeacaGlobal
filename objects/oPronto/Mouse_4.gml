if !pronto
{
	exit;	
}

oSFX.buttonSnd = true;
global.resetFase = room;

if instance_exists(oInventoryEspeciais)
{
	criou = 0;
	for (var i = 0; i < INVENTORY_ESPECIAL_FASE; i++)
	{
		
		for (var j = 0; j < array_length(listCriarEspeciais); j++)
		{
			if oInventoryEspeciaisFase.inventory[i] == -1
			{
				j =  array_length(listCriarEspeciais) + 1;
			}else
			{	
				if oInventoryEspeciaisFase.inventory[i] == j
				{
					instance_create_layer(1152,608,"UI",listCriarEspeciais[j]);
					criou++;
					j =  array_length(listCriarEspeciais) + 1;
				}
			}

		}
		
		/*if (oInventoryEspeciaisFase.inventory[i] == 0)
		{
			instance_create_layer(1152,608,"UI",obj_especial_0_coral); //Reforço Coralino
			criou++;
		}else if(oInventoryEspeciaisFase.inventory[i] == 1)
		{
			instance_create_layer(1152,608,"UI",obj_especial_1_golfinho); //Ecco Harmônico
			criou ++;
		}*/
	}
	
	if criou > 0
	{
		instance_destroy(oInventoryEspeciais);
		instance_destroy(oInventoryEspeciaisFase);
		instance_destroy(oPreparacao);
		
		if(instance_exists(oButtonBack))
		{
			instance_destroy(oButtonBack);
		}
		
		inicia_contagem(); //inicia o spawner
		
		instance_destroy();
	}
}

if instance_exists(oInventoryTrompas)
{
	criou = 0;
	
	for (var i = 0; i < INVENTORY_CARTAS_FASE; i++)
	{
		//instance_create_layer(xInicialTrompas + (adicionar * criou), yInicialTrompas, "UI", GameTrompa(i));
		//criou++;
		
		for (var j = 0; j < array_length(listCriarTrompas); j++)
		{
			if oInventoryTrompasFase.inventory[i] == -1
			{
				j =  array_length(listCriarTrompas) + 1;
			}else
			{	
				if oInventoryTrompasFase.inventory[i] == j
				{
					instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",listCriarTrompas[j]);
					criou++;
					j =  array_length(listCriarTrompas) + 1;
				}
			}

		}
		
		/*if (oInventoryTrompasFase.inventory[i] == 0)
		{
			instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",obj_trompa_0_remora); //Dueto de Rêmoras
			criou++;
		}else if(oInventoryTrompasFase.inventory[i] == 1)
		{
			instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",obj_trompa_1_piranha); //Guarda Voraz
			criou ++;
		}else if(oInventoryTrompasFase.inventory[i] == 2)
		{
			instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",obj_trompa_2_cavalo); //Passo Equino
			criou++;
		}else if(oInventoryTrompasFase.inventory[i] == 3)
		{
			instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",obj_trompa_3_anemona); //Defesa do Lar
			criou++;
		}else if(oInventoryTrompasFase.inventory[i] == 4)
		{
			instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",obj_trompa_4_craca); //Casco de Cracas
			criou++;
		}else if(oInventoryTrompasFase.inventory[i] == 5)
		{
			instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",obj_trompa_5_estrela); //Abraço Curativo
			criou++;
		}else if(oInventoryTrompasFase.inventory[i] == 6)
		{
			instance_create_layer(xInicialTrompas + (adicionar * criou),yInicialTrompas,"UI",obj_trompa_6_stargazer); //Para o Alto!
			criou++;
		}*/
	}
	
	if criou > 0
	{
		instance_destroy(oInventoryTrompas);
		instance_destroy(oInventoryTrompasFase);
		instance_create_depth(x,y,0,oInventoryEspeciais);
		instance_create_depth(x,y,0,oInventoryEspeciaisFase);
		//instance_destroy(oPreparacao);
		//instance_destroy();
	}
}

if instance_exists(oInventoryFase)
{
	for (var i = 0; i < INVENTORY_SLOTS_FASE; i++)
	{

		for (var j = 0; j < array_length(listCriarPeixes); j++)
		{
			if oInventoryFase.inventory[i] == -1
			{
				j =  array_length(listCriarPeixes) + 1;
			}else
			{	
				if oInventoryFase.inventory[i] == j
				{
					instance_create_layer(xInicial + (adicionar * criou),yInicial,"UI",listCriarPeixes[j]);
					criou++;
					j =  array_length(listCriarPeixes) + 1;
				}
			}

		}
		
		/*if (oInventoryFase.inventory[i] == 0)
		{
			instance_create_layer(xInicial + (adicionar * criou),yInicial,"UI",obj_ani_click_0_arqueiro);
			criou++;
		}else if(oInventoryFase.inventory[i] == 1)
		{
			instance_create_layer(xInicial + (adicionar * criou),yInicial,"UI",obj_ani_click_3_baiacu);
			criou ++;
		}else if(oInventoryFase.inventory[i] == 2)
		{
			instance_create_layer(xInicial + (adicionar * criou),yInicial,"UI",obj_ani_click_5_arraia);
			criou++;
		}else if(oInventoryFase.inventory[i] == 3)
		{
			instance_create_layer(xInicial + (adicionar * criou),yInicial,"UI",obj_ani_click_4_poraque);
			criou ++;
		}else if(oInventoryFase.inventory[i] == 4)
		{
			instance_create_layer(xInicial + (adicionar * criou),yInicial,"UI",obj_ani_click_1_lagosta);
			criou ++;
		}else if(oInventoryFase.inventory[i] == 5)
		{
			instance_create_layer(xInicial + (adicionar * criou),yInicial,"UI",obj_ani_click_2_tartaruga);
			criou ++;
		}*/
	}
	
	if criou > 0
	{
		instance_destroy(oInventory);
		instance_destroy(oInventoryFase);
		instance_create_depth(x,y,0,oInventoryTrompas);
		instance_create_depth(x,y,0,oInventoryTrompasFase);
		//instance_destroy(oPreparacao);
		//instance_destroy();
	}
}

