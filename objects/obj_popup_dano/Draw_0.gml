
//desenhando o pop up do dano
draw_set_font(fnt_dano);
define_align(fa_middle, fa_center);
draw_text_transformed_color(x, y, dano, escala, escala, 0, cor, cor, cor, c_white, image_alpha);
draw_set_font(-1);
define_align(-1, -1);