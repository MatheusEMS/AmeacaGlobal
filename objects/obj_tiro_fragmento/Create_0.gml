// Inherit the parent event
event_inherited();

//iniciando variáveis
dano = 0.5; //dano
ignorar = noone; //inimigo para ignorar, para não nascer destruido
tempoVida = 60 * 3; //3 segundos

image_angle = random_range(0, 359);
dir = choose(1, -1);

sprite_index = choose(
	spr_tiro_fragmento_1
	,spr_tiro_fragmento_2
	,spr_tiro_fragmento_3
	,spr_tiro_fragmento_4
);

image_blend = choose(
	c_aqua,
	c_blue,
	c_fuchsia,
	c_green,
	c_lime,
	c_maroon,
	c_navy,
	c_olive,
	c_orange,
	c_purple,
	c_red,
	c_teal,
	c_yellow
);

if(global.debug) show_debug_message("Tiro:" + string(id));