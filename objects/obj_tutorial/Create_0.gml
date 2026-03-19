//Estado do tutorial
etapa = 0; //Começa na etapa 0
global.tutorial_ativo = true;

//Múltiplas mensagens de Big & Mart
msg_bigmart = 0;

//Referência ao foco da luz
foco_x = 0;
foco_y = 0;
foco_largura = 1;
foco_altura = 1;

//Cria iluminação
if (!instance_exists(obj_iluminacao))
{
    instance_create_layer(0, 0, "Iluminacao", obj_iluminacao);
}

//Aciona a primeira etapa
inicia_etapa(etapa);

//Cutscene
timer = 0;