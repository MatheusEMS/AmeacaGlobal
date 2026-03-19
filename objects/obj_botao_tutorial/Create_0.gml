image_index = spr_botao_check;

//pulsando
//tamanho base (em escala, não pixels diretamente)
tam_x = 1;
tam_y = 1;

image_xscale = tam_x;
image_yscale = tam_y;

//controle de pulsação
escala_pulso = 1; //escala atual (1 = 100%)
min_percent = 0.75; //mínimo da pulsação (ex: 75%)
diminuir = true;
tam_mod = 0.015; //velocidade da pulsação

//posição
pos_x = 0;
pos_y = 0;