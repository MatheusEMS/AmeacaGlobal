draw_self(); //me desenhando

//defindo a cor do texto
var _cor_perola = make_colour_rgb(235, 218, 228); //retirado do spr_perola
var _cor_contorno = make_colour_rgb(76, 22, 54); //retirado do spr_perola
draw_set_font(FontJogo);
define_align(fa_middle, fa_center); //definindo o alinhamento do texto
draw_text_outline(x, y - sprite_height / 2 - 20, "1/2", _cor_perola, _cor_contorno, 1); //desenhando meu custo
draw_set_color(-1); //resetando cor do texto
define_align(-1 , -1); //resetando alinhamento do texto
draw_set_font(-1);