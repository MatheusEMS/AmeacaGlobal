//Créditos
draw_set_color(c_white);
draw_set_font(fnt_creditos);
draw_text(48,RES_H - 160, "Guilherme Freitas");
draw_text(48,RES_H - 128, "Lucas Severo");
draw_text(48,RES_H - 96, "Matheus Ericson");
draw_text_ext_transformed(48, RES_H - 64, "Agradecimentos à Profa. Dra. Maria Amélia Zazycki", 0, room_width, 0.67, 0.67, 0);
draw_set_font(-1);
draw_set_color(-1);

//draw_text(display_get_gui_width() / 2, 20, msg_timer);
//draw_text(display_get_gui_width() / 2, 40, msg_not_save);

//não tem save
if (msg_not_save) 
{
	
	msg_timer--;
	
	if (msg_timer <= 0)
	{
		msg_not_save = false;
		room_restart();
	}
	
	var _w = 512;
	var _h = 96;
	var _x = (display_get_gui_width() - _w) / 2;
	var _y = (display_get_gui_height() - _h) / 6;
	
	// Fundo preto translúcido
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(_x, _y, _x + _w, _y + _h, false);
	draw_set_alpha(1);
	
	// Texto branco centralizado
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_mensagens);
	draw_text(_x + _w / 2, _y + _h / 2, "Nenhum arquivo para carregar foi encontrado.");
	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
}


if global.TerminouJogo
{
	define_align(fa_middle, fa_center);
	draw_set_color(c_black);
	draw_set_font(fnt_contagem);
	
	//draw_text_ext_transformed(RES_W * 0.5, RES_H * 0.1, "Obrigado por jogar!",-1,-1,4,4,0);
	draw_text_outline(RES_W * 0.5, RES_H * 0.1, "Obrigado por jogar!", c_black, c_white, 3);
	
	draw_set_color(-1);
	define_align(-1, -1);
	draw_set_font(-1);
}

//Oscilação vertical do título
tempo_osc = get_timer() / 1000000;

//Criando a onda senoidal usando a variável de velocidade
var _onda_1 = sin(tempo_osc * vel_osc);

//Aplicando a distância de oscilação
var _y = ameaca_y + _onda_1 * dist_osc;

if(global_visible)
{
	var clip_height = sprite_get_height(global_sprite) * global_appear_progress;
	var offset_y = sprite_get_height(ameaca_sprite)/2;
	var offset_x = sprite_get_height(global_sprite) * 1.125;
	
	//Sombra do AMEAÇA
	if(ameaca_shadow_alpha > 0)
	{
		var final_alpha = ameaca_shadow_alpha * shadow_alpha_factor;
		draw_set_alpha(final_alpha);
		draw_set_color(c_black);
		draw_sprite_ext(
			ameaca_sprite,
			0,
			ameaca_x + shadow_offset,
			_y + shadow_offset,
			1, 1, 0, c_black, final_alpha
		);
		draw_set_alpha(1);
		draw_set_color(c_white);
	}
	
	//Efeito de ondulação do GLOBAL
	var time_factor = current_time * wiggle_speed;
	var wiggle_x = sin(time_factor) * wiggle_intensity;
	var wiggle_y = cos(time_factor * wiggle_frequency) * (wiggle_intensity * 0.75);
	
	//Distorção
	var scale_x = 1 + sin(time_factor * wiggle_scale_speed) * wiggle_scale_intensity;
	var scale_y = 1 + cos(time_factor * wiggle_scale_speed * 0.7) * (wiggle_scale_intensity * 0.5);
	
	var alpha_outline = 0.5;
	var outline_offset = 2;
	var global_draw_x = (global_x - offset_x) + wiggle_x + 20;
	var global_draw_y =	(global_y - offset_y) + wiggle_y;
	
	for (var i = 0; i < 4; i++)
    {
        draw_sprite_part_ext(
            global_outline_sprite, 0,
            0, 0, sprite_get_width(global_sprite), clip_height,
            global_draw_x + (i == 0 ? outline_offset : (i == 1 ? -outline_offset : 0)),
            global_draw_y + (i == 2 ? outline_offset : (i == 3 ? -outline_offset : 0)),
            scale_x, scale_y, 
            c_white, alpha_outline
        );
    }

	
	//global padrão
	draw_sprite_part_ext(
	    global_sprite,
	    0,
	    0, 0,
	    sprite_get_width(global_sprite), clip_height,
	    global_draw_x,
	    global_draw_y,
	    scale_x, scale_y,
	    c_white,
	    1
	);
	
	//Efeito adicional durante o aparecimento
	if(global_appear_progress < 1)
	{
	    var progress_wiggle = (1 - global_appear_progress) * appear_wiggle_intensity;
	    wiggle_x += sin(current_time * appear_wiggle_speed) * progress_wiggle;
	    wiggle_y += cos(current_time * appear_wiggle_speed * 0.8) * progress_wiggle;
	}
}

//AMEAÇA
draw_sprite(ameaca_sprite, 0, ameaca_x, _y);

//menu
if(intro_phase == 2 && menu_visible)
{
	for(var i = 0; i < menu_items; i++)
	{
	var _offset = 2;
	var _txt = menu[i];
	
	if menu_cursor == i
	{
		_txt = string_insert("> " ,_txt,0);
		var _col = c_white;
	}
	else 
	{
		var _col = c_gray;	
	}
	
	var _xx = menu_x;
	var _yy = menu_y - (menu_itemheight*(1.5 * i));
	
	//definindo
	draw_set_font(CustomMenu);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_set_color(c_black);
	
	//desenhando
	draw_text(_xx+_offset,_yy,_txt);
	draw_text(_xx-_offset,_yy,_txt);
	draw_text(_xx,_yy + _offset,_txt);
	draw_text(_xx,_yy - _offset,_txt);
	draw_set_color(_col);
	draw_text(_xx,_yy,_txt);
	
	//resetando
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_color(-1);
	draw_set_font(-1);
	}
}

