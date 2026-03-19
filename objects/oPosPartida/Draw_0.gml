

draw_sprite_stretched(
sBorda,
0,
camX + camW/4,
camY + camH/8,
camX + camW/2,
camY + camH/1.5
);

if(room == rm_tutorial)
{
	fase = rm_tutorial;
}
else if(Cena(SeqResgatouArraia) || room == rm_fase_5)
{
	fase = rm_fase_5;
	animal = "Raji, a Arraia";
}
else if(Cena(SeqResgatouPoraque) || room == rm_fase_4)
{
	fase = rm_fase_4;
	animal = "Troff, o Poraquê";
}
else if(Cena(SeqResgatouBaiacu) || room == rm_fase_3)
{
	fase = rm_fase_3;
	animal = "Bum, o Baiacu";
}
else if(Cena(SeqResgatouTartaruga) || room == rm_fase_2)
{
	fase = rm_fase_2;
	animal = "Chel, a Tartaruga-marinha";
}
else if(Cena(SeqResgatouLagosta) || room == rm_fase_1)
{
	fase = rm_fase_1;
	animal = "Tamy, a Lagosta-boxeadora";
}

var _cor_recycle = c_yellow;
var _contorno_recycle = make_color_rgb(178, 102, 0);

if ganhou
{
	//show_debug_message("step pospartida ganhou: "+string(fase)+" / "+string(animal));
	mens = "VITÓRIA!";
	desc = "+ 100";
	
	draw_set_font(fnt_mensagens);
	draw_set_color(c_black);
	define_align(fa_middle, fa_center);
	
	draw_text(camX + camW/2, camY + camH/5, mens);
	draw_text_ext((x1 + x2) / 2, y1 + 160, FaseWin(fase),32,512);
	if(!global.tutorial_ativo) draw_text(camX + camW/2, camY + camH/3.5, "Libertou "+animal+"!");
	//draw_text(camX + camW/2, camY + camH/1.5, desc);
	draw_text_outline(camX + camW/2 - 12, camY + camH/1.75, desc, _cor_recycle, _contorno_recycle, 1);
	draw_sprite(
		spr_reciclaveis, 0,
		
		camX + camW/2 +
		string_width(desc) +
		sprite_get_width(spr_reciclaveis) / 2 - 8,
		
		camY + camH/2 +
		sprite_get_height(spr_reciclaveis) * 1.75 - 4
	);
	
	draw_set_color(-1);
	define_align(-1, -1);
}
else if perdeu
{
	//show_debug_message("step pospartida perdeu: "+string(fase)+" / "+string(animal));
	mens = "DERROTA!";
	//desc = "+ 100 Recicláveis";
	
	draw_set_font(fnt_mensagens);
	draw_set_color(c_black);
	define_align(fa_middle, fa_center);
	
	draw_text(camX + camW/2, camY + camH/5, mens);
	draw_text_ext((x1 + x2) / 2, y1 + 160, FaseLose(fase),32,512);
	if(!global.tutorial_ativo) draw_text(camX + camW/2, camY + camH/3.5, animal+", continua em cativeiro!");
	//draw_text(camX + camW/2, camY + camH/1.7, desc);
	
	draw_set_color(-1);
	define_align(-1, -1);
}

