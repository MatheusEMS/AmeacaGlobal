//draw_self();

if(instance_exists(alvo))
{
    draw_lightning(x, y, alvo.x, alvo.y, false, c_yellow, 2);
}


//debug
if(global.debug)
{
	if(instance_exists(alvo)) //desenhando meu trajeto
	{
		draw_set_color(c_red);
		draw_line(x, y, alvo.x + alvo.sprite_width / 2, alvo.y - alvo.sprite_height / 2);
		draw_set_color(-1);
	}
	
	//meu xscale
	define_align(fa_middle, fa_center);
	draw_text(pai.x + sprite_width / 2, pai.y - 20, "xscale: " + string(image_xscale));
	define_align(-1, -1);
	
	//mostrando meu tempo restante
	define_align(fa_middle, fa_center);
	draw_text(pai.x + pai.sprite_width / 2, pai.y + 20, tempo_vida);
	draw_text(pai.x + pai.sprite_width / 2, pai.y + 40, pai);
	draw_text(pai.x + pai.sprite_width / 2, pai.y + 60, alvo);
	define_align(-1, -1);
}