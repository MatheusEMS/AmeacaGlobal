if(room == rm_tutorial || room == rm_fase_1 || room == rm_fase_2 || room == rm_fase_3 || room == rm_fase_4 || room == rm_fase_5 || room == rm_mapa || room == rm_album)
{
	//DESENHANDO MINHA WAVE, VIDA E MOEDAS
	draw_set_font(FontJogo);
	
	//desenhando meus reciclaveis
	define_align(fa_middle, fa_center); //definindo o alinhamento do texto
	draw_sprite(spr_reciclaveis, 0, 20, 20); //ícone reciclaveis
	var _contorno = make_color_rgb(178, 102, 0);
	draw_text_outline(20 + sprite_get_width(spr_reciclaveis), 20, global.moedas, c_yellow, _contorno, 1); //valor
	
	draw_set_color(-1); //resetando cor do texto
	define_align(-1 , -1); //resetando alinhamento do texto
	draw_set_font(-1); //resetando a fonte do texto
		
	if(room != rm_mapa && room != rm_album) //DESENHANDO MINHA WAVE, VIDA E MOEDAS
	{
		draw_set_font(FontJogo);
		
		//desenhando minhas pérolas
		define_align(fa_middle, fa_center); //definindo o alinhamento do texto
		var _cor_perola = make_colour_rgb(235, 218, 228); //retirado do spr_perola
		var _cor_contorno = make_colour_rgb(76, 22, 54); //retirado do spr_perola
		draw_sprite(spr_perola_hud, 0, 100, 20); //ícone pérolas
		draw_text_outline(100 + sprite_get_width(spr_perola_hud), 20, global.coins, _cor_perola, _cor_contorno, 1); //valor
		
		//desenhando a wave que estou
		var onda_atual = global.wave + 1;
		var total_ondas = array_length(obj_gerenciador.waves);
		var texto_wave = "Onda " + string(onda_atual) + " de " + string(total_ondas);
		
		define_align(fa_top, fa_right); // alinhamento: direita e topo
		draw_text_outline(1260, 20, texto_wave, c_red, c_white, 1); // 1280 - 20 = 1260
		
		//reset
		draw_set_color(-1);
		define_align(-1, -1);
		draw_set_font(-1);
		
		//desenhando minha vida
		var vida_por_coral = global.hp / corais;
		var vida_atual_local = clamp(global.hp_atual, 0, global.hp);
		
		var coral_espaco = 32; //espaçamento horizontal
		
		var x_inicial = (room_width / 2) - ((corais - 1) * coral_espaco) / 2;
		var y_inicial = RES_H - sprite_get_height(spr_icon_coral_1) * 2;
		
		for (var i = 0; i < corais; i++)
		{
			var index = corais - 1 - i;
			
			var vida_do_slot = vida_atual_local - (index * vida_por_coral);
			var saturacao = clamp(vida_do_slot / vida_por_coral, 0, 1);
			
			if(coral_estado[index] && saturacao <= 0)
			{
				//ficou branco agora
				coral_estado[index] = false;
				
				if(ds_list_size(obj_gerenciador.mensagens_ativas) == 0)
				{
					adicionar_mensagem_base();
				}	
			}
			
			if(saturacao > 0)
			{
				coral_estado[index] = true;
			}
			
			var cor_base = cor_coral[index];
			
			var r = lerp(255, color_get_red(cor_base), saturacao);
			var g = lerp(255, color_get_green(cor_base), saturacao);
			var b = lerp(255, color_get_blue(cor_base), saturacao);
			
			var cor_atual = make_colour_rgb(r, g, b);
			
			draw_sprite_ext(coral_spr_list[i], 0, x_inicial + i * coral_espaco, y_inicial, 1, 1, 0, cor_atual, 1);
		}
		
		draw_set_color(-1); //resetando cor do texto
		define_align(-1 , -1); //resetando alinhamento do texto
		draw_set_font(-1); //resetando a fonte do texto
	}
}

#region MENSAGENS

//configurações
var margem_x = 20;
var margem_y = 100;
var espacamento = 10;
var largura_maxima = display_get_gui_width() * 0.6;
var fundo_cor = c_black;
var fundo_alpha = 0.5;
var texto_cor = c_white;
var altura_acumulada = 0;

for(var i = 0; i < ds_list_size(mensagens_ativas); i++)
{
	var m = mensagens_ativas[| i];
	var texto = m.texto;
	var alpha = m.alpha;
	
	var texto_largura = string_width_ext(texto, -1, largura_maxima);
	var texto_altura = string_height_ext(texto, -1, largura_maxima);
	
	var x1 = margem_x;
	
	//var y1 = margem_y + i * (texto_altura + espacamento);
	var y1 = margem_y + altura_acumulada;
	
	var x2 = x1 + texto_largura + 20;
	var y2 = y1 + texto_altura + 10;
	
	altura_acumulada += texto_altura + espacamento; //acumula a altura
	
	if (y2 > display_get_gui_height() - margem_y) break;
	
	draw_set_alpha(alpha * fundo_alpha);
	draw_set_color(fundo_cor);
	draw_rectangle(x1, y1, x2, y2, false);
	draw_set_alpha(1);
	
	draw_set_font(fnt_mensagens);
	draw_set_alpha(alpha);
	draw_set_color(texto_cor);
	draw_text_ext(x1 + 10, y1 + 5, texto, -1, largura_maxima - margem_x);
	
	draw_set_alpha(1); //reseta o alpha
	draw_set_font(-1); //reseta a fonte
	define_align(-1, -1); //reseta a orientação
	draw_set_color(-1); //reseta a cor
}
#endregion

if(global.debug) 
{
	draw_text(room_width / 2, 20, "instancias na room: "+string(instance_number(all)));
	draw_text(room_width / 2, 40, "trompa sel: "+string(trompa_sel()));
}