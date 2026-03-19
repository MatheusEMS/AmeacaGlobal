//garantindo somente uma torre de cada por vez
//with(obj_ani_pai) //cada torre verifica se
//{
//	if(!explosao) //torres explosivas não rodam isso pq se destroem em seguida
//	{
//		if(pai == other.dragged) //o dragged que a criou é igual ao dragged que o clicável cria
//		{
//		    other.posso_criar = false; //se sim, o clicável daquela torre não pode criar mais draggeds
//		}
//	}
//}

if(custo > global.coins || instance_exists(GameAnim(numero)))
{
	posso_criar = false;
}
else if(!instance_exists(GameAnim(numero)) && custo <= global.coins)
{
	posso_criar = true;
}

if(!posso_criar) //se nao posso criar
{
    image_alpha = 0.5; //fico transparente
}
else //se posso
{
	image_alpha = 1; //transparencia padrão
}