function ForCheckInventario(_slots){
	var _temItem = false;

	 for (var i = 0; i < _slots; i++)
	 {
		if inventory[i] != -1
		{
			_temItem = true;
		}
	 }



	if _temItem == true
	{
		if instance_exists(oPronto)
		{
			oPronto.pronto = true;	
		}
	}else
	{
		if instance_exists(oPronto)
		{
			oPronto.pronto = false;	
		}
	}
}