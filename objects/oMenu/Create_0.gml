gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

msg_not_save = false;
msg_timer = 0;

menu_x = gui_width+200;
menu_y = gui_height - gui_margin;

global_outline_sprite = spr_global_outline;

menu_x_target = gui_width - gui_margin;
menu_speed = 25; //lower is faster
menu_font = CustomMenu;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;


menu[2] = "Novo Jogo";
menu[1] = "Continuar";
menu[0] = "Sair";

menu_items = array_length(menu);

menu_top = menu_y - ((menu_itemheight * 1.5)*menu_items);

menu_cursor = 2;

menu_initial_x = gui_width + 200; // Posição inicial (fora da tela)
menu_x = menu_initial_x; // Resetar posição
menu_animation_started = false; // Controle de animação
menu_visible = false;

//Configurações básicas do título
ameaca_sprite = spr_ameaca;
global_sprite = spr_global;
ameaca_x = display_get_gui_width() + sprite_get_width(ameaca_sprite)/2;
ameaca_y = display_get_gui_height() * 0.5;
ameaca_target_x = display_get_gui_width() / 2;

//Controle de aparecimento
global_visible = false;
global_appear_progress = 0;
global_vel = 0.01;
global_x = 0;
global_y = 0;

//Controle de sombra
ameaca_shadow_alpha = 0;
ameaca_shadow_fadein_speed = 0.02;
ameaca_shadow_ready = false;
ameaca_shadow_max_alpha = 0.6;

//Controle de sequência
intro_phase = 0;
intro_timer = 0;

//Oscilação vertical
vel_osc = 4; //Valor mais suave que 4
dist_osc = 3; //Aumentei para movimento mais visível
tempo_osc = 0;

//Parâmetros de efeitos
wiggle_intensity = 1;
wiggle_speed = 0.003 //Velocidade ajustada
wiggle_frequency = 1.3; //controle de frequência vertical
wiggle_scale_speed = 0.7; //velocidade da escala
wiggle_scale_intensity = 0.02; //intensidade da escala

//Sombra
shadow_offset = 3;
shadow_alpha_factor = 0.6; //controle extra de transparência

//Efeitos de aparecimento
appear_wiggle_intensity = 5;
appear_wiggle_speed = 0.01;
