draw_self(); //me desenhando

var _cor_contorno = make_colour_rgb(76, 22, 54); //retirado do spr_perola
var _cor_perola = make_colour_rgb(235, 218, 228); //retirado do spr_perola
var _cor = noone;

if(custo > global.coins) //defindo a cor do texto
{
	_cor = c_red; 
}
else
{
	_cor = _cor_perola;
}
draw_set_font(FontJogo);
define_align(fa_middle, fa_center); //definindo o alinhamento do texto

draw_text_outline(x + sprite_width/2, y - sprite_height - 20, custo, _cor, _cor_contorno, 1); //desenhando meu custo

draw_set_color(-1); //resetando cor do texto

draw_set_color(c_black);
//draw_text(x + sprite_height / 2, y + 20, string(width)+"x"+string(height));

draw_set_font(-1);
define_align(-1, -1); //definindo o alinhamento do texto
draw_set_color(-1); //resetando cor do texto

if(global.debug)
{
	draw_set_font(FontJogo);
	define_align(fa_middle, fa_center); //definindo o alinhamento do texto
	
	var _posso_criar = (posso_criar == true) ? "can" : "can't"; 
	_cor = (posso_criar == true) ? c_lime : c_red;
	
	draw_set_color(_cor);
	
	draw_text(x + sprite_width / 2, y - sprite_height / 2, _posso_criar);
	
	draw_set_font(-1);
	define_align(-1, -1); //definindo o alinhamento do texto
	draw_set_color(-1); //resetando cor do texto
}