torre_dona = noone;
lado = "";
ataque = 1; //meu dano
alvo = noone; //alvo
bullet_dir = 0;
cadencia = 60; //contador para tempo entre rajadas
pode_atirar = false; //posso atirar?
tiro = obj_tiro_bolha; //projétil (objeto)
morrer = false;

rajada_ativa = false;
rajada_total = 1; //quantos tiros por rajada? (1 = torre comum)
rajada_intervalo = 0; //intervalo entre tiros da rajada (em frames) (somente quando rajada_total > 1)
rajada_atual = 0; //contador de progresso da rajada
rajada_timer = 0; //recebe o valor da rajada_intervalo

cooldown = 0; //recebe o valor da cadência

estado = "parado";
sprite_idle = spr_ani_remora_idle;
sprite_acao = spr_ani_remora_attack;