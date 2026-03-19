//iniciando variáveis
spawn_rate = 1 * game_speed; //tempo entre os spawns
timer = 0;
spawn_fila = [];
spawn_index = 0; //controle da lista de lixo a ser spawnado
nova_wave = false; //só inicia wave depois da contagem
spawnando = false;
vel = 1; //velocidade de movimentação do spawner
check = false;

cor = make_color_rgb(47, 100, 82);

x = irandom_range(1, 1279); //posição inicial

//oscilando
vel_osc = 4;
tempo_osc = 0;
dist_osc = 3;

//feedback visual wave 1
contagem_ativa = false;
contador = 0;
tempo_contagem = 0;
contagem_finalizou = false;

//direção inicial
if(x == room_width / 2)
{
	x += choose(1, -1);
}

if(x < room_width / 2) //se estou na direita
{
	dir = "esquerda"; //gravo que preciso ir para esquerda
}
else //senão
{
	dir = "direita"; //gravo que preciso ir para direita
}

//garantindo que eu olhe para o lado certo
x_anterior = x;

//movimento no tutorial
max_x_tutorial = 832;
min_x_tutorial = 448;

//fim da partida
perdeu = false;
ganhou = false;