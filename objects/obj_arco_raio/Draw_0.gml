//draw_self();

if(instance_exists(alvo))
{
	draw_lightning(x, y, alvo.x, alvo.y, false, c_yellow, 2);
	
    draw_set_color(c_red);
	//draw_line(x, y, alvo.x + alvo.sprite_width / 2, alvo.y - alvo.sprite_height / 2);
	draw_set_color(-1);
}

/*if(instance_exists(origem))
{
	draw_set_color(c_fuchsia);
	draw_circle(origem.x, origem.y, 5, false);
	draw_set_color(-1);
}
if(instance_exists(alvo))
{
	draw_set_color(c_green);
	draw_circle(alvo.x, alvo.y, 5, false);
	draw_set_color(-1);
}