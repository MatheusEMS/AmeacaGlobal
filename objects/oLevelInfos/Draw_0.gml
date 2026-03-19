//definindo
draw_set_alpha(0.6);

//desenhando
draw_sprite_stretched(sBorda,0,x1,y1,x2 - x1,y2 - y1);
//draw_roundrect_ext(x1,y1,x2,y2,0,0,false);

//resetando
draw_set_alpha(1);

//Draw Text

//Fase
//definindo
define_align(fa_middle, fa_center);
draw_set_font(FontJogo);
draw_set_color(c_black);

//desenhando
draw_text_transformed((x1 + x2) / 2,y1 + 48,FaseNome(qualFase),3,3,0);

draw_set_font(fnt_desc_fases);
//draw descrição fase
draw_text_ext_transformed((x1 + x2) / 2,y1 + 224,FaseDescricao(qualFase),32,512,1,1,0);

//resetando
define_align(-1, -1);
draw_set_color(-1);
draw_set_font(-1);