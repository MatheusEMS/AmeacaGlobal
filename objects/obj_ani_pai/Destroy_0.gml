//quando sou destruído
with(obj_ani_clickable_pai) //cada clicável verifica se
{
    if(dragged == other.pai) //o dragged que ele cria é igual a meu pai
    {
        posso_criar = true; //se sim, pode criar outro de mim
    }
}