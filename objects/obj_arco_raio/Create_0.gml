//iniciando variáveis
speed = 0; //movimento desativo

//show_debug_message("arco criado");

alvo = noone;
dano_por_frame = 0; //dano
tempo_vida = 20; //Duração do arco, em frames (ex: 1 segundo)
alcance = 96; //Distancia máxima de um inimigo para outra para o arco "Pular" neles
limite_alvos = 3; //Limite de alvos que o arco pode atingir

//inimigo mais próximo do pai no momento da criação 
primeiro_alvo = noone;

origem = noone;
criou_proximo = false;