//mantém na posição
x = pos_x;
y = pos_y;

//define limites
var limite_max = 1;
var limite_min = min_percent;

//define modulação proporcional
var tam_modificador = tam_mod;

//pulsação
if(pulsa)
{
	if(diminuir)
	{
		escala_pulso = max(escala_pulso - tam_modificador, limite_min);
		
		if(escala_pulso <= limite_min)
		{
			diminuir = false;
		}
	}
	else
	{
		escala_pulso = min(escala_pulso + tam_modificador, limite_max);
		
		if(escala_pulso >= limite_max)
		{
			diminuir = true;
		}
	}
}

//aplica a escala proporcional nos dois eixos
image_xscale = tam_x * escala_pulso;
image_yscale = tam_y * escala_pulso;
