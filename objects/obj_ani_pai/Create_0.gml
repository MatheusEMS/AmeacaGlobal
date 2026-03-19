/*
TABELA PARA CRIAÇÃO DE NOVAS TORRES
| Tipo de Torre | alcance | rajada_total | tiro.speed |
|---------------|---------|--------------|------------|
| Melee         | baixo   |      1       |     0      |
| Comum         | qualquer|      1       |   > 0      |
| Rajada        | qualquer|    > 1       |   > 0      |

Notas:
- "alcance" baixo geralmente significa 32~64px (ideal pra melee).
- "rajada_total" define a quantidade de projéteis por ataque.
- "speed" é uma variável do obj_tiro, por isso "tiro.speed"
*/

if(room != rm_album) 
{
	cria_explo_bolha(25,50,x + sprite_width / 2,y - sprite_height / 2);
	oSFX.SplashSnd = true;
}

//DEBUG
tiros = 0;
EfeitoCarta = false; //?

//ALBUM
efeito = EfeitoAnim(numero);
sprite_album = SpriteAnim(numero, "album"); //meu sprite no album
levelMax = 3;

trancado = global.TrancadoPeixe[numero];

level = global.LVpeixes[numero];

nome = NomeAnim(numero);
valor = UpgradeAnim(numero); //upar no álbum
descricao = DescAnim(numero);

clicouPeixe = false;
//trancado = true;
valorDesbloquear = 10;

//GAMEPLAY
alcance = RangeAnim(numero);
pai = noone; //torre dragged
ataque = AtaqueAnim(numero, level); //meu dano
alvo = noone; //alvo
bullet_dir = 0;
cooldown_tiro = CdTiroAnim(numero); //contador para tempo entre rajadas
pode_atirar = true; //posso atirar?
tiro = noone; //projétil (objeto)

rajada_total = 1; //quantos tiros por rajada? (1 = torre comum)
rajada_intervalo = 0; //intervalo entre tiros da rajada (em frames) (somente quando rajada_total > 1)

rajada_atual = 0; //contador de progresso da rajada
rajada_timer = 0; //recebe o valor da rajada_intervalo
rajada_ativa = false;

cooldown = 0; //no step, recebe o valor do cooldown_tiro

esq_offset = 0; //collision box com offset para esquerda
dir_offset = 0; //collision box com offset para direita

explosao = false; //se explode?
kaboom = noone; //objeto da área de efeito

estado = "parado"; //começa no estado parado

selecionado = false; //estou selecionado
timer_selecao = 600; //10 segundos
timer_criado = 15; //delay para selecionar depois de criado
mov_padrao = true; //movimentação padrão
col_padrao = true; //collision box padrão

custo = CustoAnim(numero); //custo
resistencia = ForcaAnim(numero); //quanto peso (lixo) aguenta a torre
forca = resistencia;

if(global.tutorial_ativo)
{
	vida_max = 10;
}
else
{
	vida_max = VidaAnim(numero, level); //quanto dano aguenta a torre
}

vida = vida_max;

sprite_idle = SpriteAnim(numero, "idle"); //meu sprite in game
sprite_swim = SpriteAnim(numero, "swim"); //meu sprite in game
sprite_hit = SpriteAnim(numero, "hit"); //meu sprite in game
sprite_attack = SpriteAnim(numero, "attack"); //meu sprite in game
sprite_extra = SpriteAnim(numero, "extra"); //meu sprite in game

lateral = false; //se meu sprite é lateral (false, se for top-down)
x_anterior = x;

hp_bar = noone; //minha barra de vida

salvou = false; //salvando