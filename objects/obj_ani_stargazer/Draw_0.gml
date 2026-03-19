draw_self();
/*
draw_set_font(fnt_mensagens);

draw_text(x, y + sprite_height + 20, estado);
draw_set_font(-1);

if(global.debug)
{
	var _morrer = (morrer == true) ? "morrer" : "viver";
	
	draw_text(x, y + sprite_height + 20, _morrer);
	draw_text(x, y + sprite_height + 10, cooldown_busca);
	
	// Apenas desenha se torre_dona e o alvo escolhido existirem
	if (instance_exists(torre_dona) && alvo_escolhido != noone)
	{
	    // Topo central da torre
	    var _meio_torre_x = torre_dona.x + torre_dona.sprite_width / 2;
	    var _meio_torre_y = torre_dona.y - torre_dona.sprite_height / 2;
	
	    // Centro do inimigo alvo do stargazer
	    var _alvo_x = alvo_escolhido;
	    var _alvo_y = torre_dona.y - torre_dona.sprite_height / 2;
	
	    // Configurações de desenho
	    draw_set_color(c_red);
	
	    draw_line(_meio_torre_x, _meio_torre_y, _alvo_x, _alvo_y);
	
	    draw_set_color(c_white);
	}
}


