function ScriptVarInv()
{
	//balão
	draw_sprite_ext(spr_balao, 0, 32, 160, 1.266667, 1.266667, 0, c_white, 1);
	
	//definindo cor
	draw_set_color(c_black);
	
	//animal
	draw_sprite_ext(clicouQualPeixe.sprite_idle, 0, xLeftButton, yInicial + sprite_get_height(clicouQualPeixe.sprite_idle) * 1.5, 2, 2, 0, c_white, 1);
	
	//definindo fonte
	draw_set_font(FontJogo);
	
	//nome
	draw_text(xLeft,yInicial * 2.25, clicouQualPeixe.nome);
	
	//definindo fonte
	draw_set_font(fnt_descricoes);
	
	//descrição
	draw_text_ext(xLeft,yInicial * 2.65, clicouQualPeixe.descricao, -1, room_width - 2 * xLeft);
	
	//resetando
	draw_set_color(-1);
	draw_set_font(-1);
	
	if(clicouQualPeixe.trancado == false)
	{
		//definindo fonte
		draw_set_font(FontJogo);
		
		//definindo cor
		draw_set_color(c_white);
		
		//stats
		draw_text(xLeft,yInicial * 3.5, "Efeito: " + string(clicouQualPeixe.efeito));
		draw_text(xLeft,yInicial * 3.7, "Dano: " + string(clicouQualPeixe.ataque));
		draw_text(xLeft,yInicial * 3.9, "Alcance: " + string(clicouQualPeixe.alcance/32));
		draw_text(xLeft,yInicial * 4.1, "Intervalo de Ataque: " + string(clicouQualPeixe.cooldown_tiro / 10));
		draw_text(xLeft,yInicial * 4.3, "Resistência: " + string(clicouQualPeixe.resistencia));
		draw_text(xLeft,yInicial * 4.5, "Vida: " + string(clicouQualPeixe.vida_max));
		draw_text(xLeft,yInicial * 4.9, "Custo: " + string(clicouQualPeixe.custo));
		draw_sprite(spr_perola, 0, xLeft + string_width("Custo:_" + string(clicouQualPeixe.custo) + "_"), yInicial * 4.9 + sprite_get_height(spr_perola));
		
		//resetando
		draw_set_color(-1);
		draw_set_font(-1);
	}
}