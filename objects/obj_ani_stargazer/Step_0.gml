// Evento Step

// Se o jogo está pausado
if (screen_pause()) {
    exit;
}

// --- Controle de Sprite Baseado no Estado (Mantido Simples) ---
switch (estado)
{
    case "parado":
    {
        muda_sprite(spr_ani_stargazer_idle);
        // Garante que o image_speed esteja padrão para o idle, se necessário
        // image_speed = 1; 
        break;
    }

    case "ação":
    {
		muda_sprite(spr_ani_stargazer_aviso); 
		
        // A animação de aviso deve rodar UMA VEZ e então voltar para "parado"
        if (image_index >= image_number - 1) // Se a animação terminou um ciclo
        {
			
            estado = "parado"; // Volta para o estado parado
            //image_index = 0; // Garante que o sprite idle comece do frame 0
            // Nao precisamos mais do image_speed = 0 aqui, pois o estado vai mudar.
        }
        break;
    }
}

// Bolhas
cria_bolhas(x, y - sprite_height / 2);

// Morrendo
if (morrer) {
    image_xscale -= 0.1;
    image_yscale = image_xscale;
}
if (image_xscale <= 0) {
    instance_destroy();
}

if (!instance_exists(torre_dona)) {
    morrer = true;
} else {
    if (!morrer) {
        // Movimentação do stargazer (ligado à torre)
        x = torre_dona.x + torre_dona.sprite_width / 2;
        y = torre_dona.y + sprite_height / 2;
    }

    // --- Lógica de Busca e Ação ---
    // Só tenta buscar um novo movimento se estiver "pronto"
    if (pronto_para_procurar) { 
        if (cooldown_busca > 0) {
            cooldown_busca--;
            exit;
        }

        if (torre_dona.alvo != noone) { 
            cooldown_busca = cooldown_max;
            exit;
        }

        // --- BUSCA DE DESTINO ---
        var lista_candidatos = array_create(0);
        var dy_peso = 1.0;
        var dx_peso = 1.5;

        var inimigos_data = array_create(0);
        with (obj_ini_ame_pai) {
            array_push(inimigos_data, [x, y, sprite_height]);
        }

        for (var i = 0; i < array_length(inimigos_data); i++) {
            var ini_x = inimigos_data[i][0];
            var ini_y = inimigos_data[i][1];
            var ini_h = inimigos_data[i][2];

            var ini_meio_x = ini_x;
            var ini_base = ini_y + ini_h / 2;
            var torre_topo = torre_dona.y - torre_dona.sprite_height;
            var torre_meio_x = torre_dona.x + torre_dona.sprite_width / 2;

            var dx = abs(ini_meio_x - torre_meio_x);
            var dy = abs(ini_base - torre_topo);

            if (dy > 0 && dx > 0 && ini_base < torre_topo) {
                var prioridade = (dy_peso / (dy + 1)) + (dx_peso / (dx + 1));
                array_push(lista_candidatos, [prioridade, ini_meio_x]);
            }
        }

        if (array_length(lista_candidatos) > 0) {
            array_sort(lista_candidatos, function(a, b) {
                return (a[0] > b[0]) - (a[0] < b[0]);
            });

            var destino_encontrado_e_valido = false; // Flag para saber se achamos um destino neste ciclo

            for (var i = 0; i < array_length(lista_candidatos); i++) {
                var destino_grid_x = round(lista_candidatos[i][1] / 32) * 32;
                var ocupado = false;
                alvo_escolhido = destino_grid_x;

                if (instance_place(destino_grid_x, torre_dona.y, obj_ani_pai)) {
                    ocupado = true;
                }
                if (!ocupado && instance_place(destino_grid_x, torre_dona.y, obj_ini_ame_pai)) {
                    ocupado = true;
                }

                if (!ocupado) {
                    var pos_inicial = torre_dona.x + torre_dona.sprite_width / 2;
                    var diff = destino_grid_x - pos_inicial;
                    var caminho_livre = true;

                    if (diff == 0) {
                        caminho_livre = false;
                    } else {
                        var passo = sign(diff) * 32;
                        var start_px = (passo > 0) ? pos_inicial + passo : pos_inicial + passo;
                        var end_px = (passo > 0) ? destino_grid_x : destino_grid_x;

                        // Loop de verificação de caminho
                        for (var px_check = start_px; (passo > 0 && px_check <= end_px) || (passo < 0 && px_check >= end_px); px_check += passo) {
                            for (var j = 0; j < array_length(inimigos_data); j++) {
                                var ini_grid_x = round(inimigos_data[j][0] / 32) * 32;
                                var ini_grid_y = round(inimigos_data[j][1] / 32) * 32;
                                var grid_slot = 32;

                                var linha_torre = round(torre_dona.y / 32) * 32;
                                var linha_acima = round((torre_dona.y - grid_slot) / 32) * 32;

                                if ((ini_grid_x == px_check) && (ini_grid_y == linha_torre || ini_grid_y == linha_acima)) {
                                    caminho_livre = false;
                                    break;
                                }
                            }
                            if (!caminho_livre) break;
                        }
                    }

                    if (caminho_livre) {
                        movendo_para = destino_grid_x; // Define o destino
                        
                        // *** AQUI É A MUDANÇA CRÍTICA ***
                        // Apenas ativa o estado "ação" e reinicia a animação UMA VEZ
                       if estado !="ação" estado = "ação"; 
                        
                        //image_speed = 1; // Garante que a animação comece a rodar
                        
                        pronto_para_procurar = false; // Impede nova busca até o movimento terminar
                        destino_encontrado_e_valido = true;
                        break; // Sai do loop de busca de candidatos
                    }
                }
            }
            // Se terminou o loop de candidatos e não achou um válido, reseta cooldown
            if (!destino_encontrado_e_valido) {
                cooldown_busca = cooldown_max;
            }
        } else { // Se não há candidatos
            cooldown_busca = cooldown_max;
        }
    }

    // --- Movendo a torre (Continua a ser executado mesmo se o estado for "ação") ---
    if (movendo_para != noone) {
        var dif = (round(movendo_para / 32) * 32) - torre_dona.x;

        if (abs(dif) >= 32) {
            torre_dona.x += sign(dif) * 32;
        } else {
            torre_dona.x = round(movendo_para / 32) * 32;
            movendo_para = noone; // Movimento concluído
            cooldown_busca = cooldown_max;
            alvo_escolhido = noone;
            
            pronto_para_procurar = true; // Permite uma nova busca e ação no próximo ciclo
        }
    }
}

