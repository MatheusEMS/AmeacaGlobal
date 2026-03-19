// Inherit the parent event
event_inherited();

speed = 0; //movimento desativo
image_alpha = 1; //transparência

alvo = noone;
dano_por_frame = dano / 60; //cálculo a partir do dano por segundo (dano)
tempo_vida = 90; //Duração do arco, em frames (ex: 2 segundos)
alcance = 96; //Distancia máxima de um inimigo para outra para o arco "Pular" neles
limite_alvos = 3; //Limite de alvos que o arco pode atingir

criou_proximo = false;
atingidos = ds_list_create();