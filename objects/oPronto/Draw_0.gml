draw_self();

define_align(fa_middle, fa_center);
draw_set_font(fnt_mensagens);
draw_set_color(cor);
//draw_text(x, y + 48, nome);
draw_text_outline(x, y + 48, nome, cor, c_white, 1);
draw_set_color(-1);
define_align(-1, -1);
draw_set_font(-1);