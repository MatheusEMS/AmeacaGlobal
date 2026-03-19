var _cor_recycle = c_yellow;
var _contorno_recycle = make_color_rgb(178, 102, 0);
var _cor_comprar = c_black;
var _contorno_comprar = make_color_rgb(95, 152, 135);

if(instance_exists(obj_tutorial))
{
	if(obj_tutorial.etapa >= 17)
	{
		draw_sprite_ext(spr_balao, 0, 32, 160, 1.266667, 1.266667, 0, c_white, 1);
		
		draw_set_color(c_black);
		draw_set_font(fnt_descricoes);
	
		draw_text_ext(xLeft,yInicial * 2.5, mensagem_tutorial, -1, room_width - 2 * xLeft);
	
		draw_set_color(-1);
		draw_set_font(-1);
	}
	
	//exit;
}
else if(global.tutorial_ativo)
{
	msg_erro("Tutorial");
}

var _num = instance_number(oButtonLevelUp);

//limpar menu torres - ao clicar em outra aba
if limparPeixes
{
	//limpar as torres
	//clicouQualPeixeButton = noone;
	clicouQualPeixe = noone;
	
	if instance_exists(obj_ani_pai)
	{
		instance_destroy(obj_ani_pai);
		qtd = 1;
		contar = 0;
	}
	
	limparPeixes = false;
}

//limpar menu inimigos
if limparInimigos
{
	clicouQualInimigo = noone;
	
	if instance_exists(obj_ini_ame_pai)
	{
		instance_destroy(obj_ini_ame_pai);
		qtd = 1;
		contar = 0;
	}
	
	limparInimigos = false;
}

//limpar menu Trompas
if limparTrompas
{
	clicouQualTrompa = noone;
	
	if instance_exists(obj_trompa_pai)
	{
		instance_destroy(obj_trompa_pai);
		qtd = 1;
		contar = 0;
	}
	
	limparTrompas = false;	
}

//limpar menu Especial
if limparEspeciais
{
	clicouQualEspecial = noone;
	
	if instance_exists(obj_especial_pai)
	{
		instance_destroy(obj_especial_pai);
		qtd = 1;
		contar = 0;
	}
	
	limparEspeciais = false;	
}

//limpar menu Loja
if limparLoja
{
	clicouQualLoja = noone;
	
	if instance_exists(obj_Loja)
	{
		instance_destroy(obj_Loja);
		qtd = 1;
		contar = 0;
	}
	
	limparLoja = false;	
}


//aba das torres
if aba == 1
{
	limparInimigos = true;
	limparTrompas = true;
	limparEspeciais = true;
	limparLoja = true;
	
	var _tamanhoLista = array_length(listaPeixe);

	if contar <= _tamanhoLista -1
	{
		if contar >= fileira
		{
			yInicial += EspacamentoY;
			qtd = 1;
			fileira += fileiraInicial;
		}
		
		instance_create_depth(xInicial + (qtd * spacingX), yInicial, 0, listaPeixe[contar]);
		qtd ++;
		contar++;
	}
	else
	{
		qtd = 999;	
	}

	
	if clicouQualPeixe != noone
	{
		if(!global.tutorial_ativo) ScriptVarInv();
		
		if clicouQualPeixe != clicouQualPeixeButton 
		{
			if instance_exists(oButtonLevelUp)
			{
				instance_destroy(oButtonLevelUp);
			}
		
			if(!global.tutorial_ativo) 
			{
				with (instance_create_depth(xLeft-16,yInicial * 6, 1, oButtonLevelUp))
				{
					qualPeixe = other.clicouQualPeixe;
					image_xscale = 2.5;
					image_yscale = 1;
				}
			}
		
			clicouQualPeixeButton = clicouQualPeixe;	
		}
		
		if clicouQualPeixe.level >= clicouQualPeixe.levelMax
		{
			if instance_exists(oButtonLevelUp)
			{
				instance_destroy(oButtonLevelUp);
			}
		}
		else
		{
			if clicouQualPeixe.trancado
			{
				//draw_set_color(c_black);
				draw_set_font(FontJogo);
			
				if(!global.tutorial_ativo) draw_text_outline(xLeft, yInicial * 6, "Jogue para libertar", c_black, _contorno_comprar, 1);
				
				draw_set_color(-1);
				draw_set_font(-1);
			}
			else
			{
				//draw_set_color(c_black);
				draw_set_font(FontJogo);
				
				if(!global.tutorial_ativo) 
				{
					//draw_text(xLeft,yInicial * 6, "Treinar?  " + string(clicouQualPeixe.valor) + " recicláveis");
					draw_text_outline(xLeft, yInicial * 6, "Treinar?", _cor_comprar, _contorno_comprar, 1);
					draw_text_outline(xLeft + string_width("Treinar?_"), yInicial * 6, string(clicouQualPeixe.valor), _cor_recycle, _contorno_recycle, 1);
					draw_sprite(
						spr_reciclaveis, 0,
						
						xLeft +
						string_width("Treinar?_" + string(clicouQualPeixe.valor) + "_") +
						sprite_get_width(spr_reciclaveis) / 2,
						
						yInicial * 6 +
						sprite_get_height(spr_reciclaveis) / 4
					);
				}
				
				draw_set_color(-1);
				draw_set_font(-1);
				
				
			}
		}
	}
	
}

//aba dos inimigos
if aba == 2 
{
	limparPeixes = true;
	limparTrompas = true;
	limparEspeciais = true;
	limparLoja = true;
		
	var _tamanhoListaInim = array_length(listaInimigos);

	if contar <= _tamanhoListaInim -1
	{
		if contar >= fileira
		{
			yInicial += EspacamentoY;
			qtd = 1;
			fileira += fileiraInicial;
		}
		
		instance_create_depth(xInicial + (qtd * spacingX), yInicial, 0, listaInimigos[contar]);
		qtd ++;
		contar++;
	}
	else
	{
		qtd = 999;	
	}
	
	if clicouQualInimigo != noone  
	{
		//draw_sprite(clicouQualInimigo.sprite_index, 0, xLeftButton, yInicial);
		
		if clicouQualInimigo.trancado == false
		{
				if instance_exists(oButtonLevelUp)
				{
					
					instance_destroy(oButtonLevelUp);
				}
				
			
			if(!global.tutorial_ativo) 
			{
				draw_sprite_ext(spr_balao, 0, 32, 160, 1.266667, 1.266667, 0, c_white, 1);
				
				//desenha simbolo lixo
				draw_sprite(clicouQualInimigo.sprite_index,0,xLeftButton , yInicial);
			}
			
			draw_set_font(FontJogo);
			draw_set_color(c_black);
			
			if(!global.tutorial_ativo) draw_text(xLeft,yInicial * 2.1, clicouQualInimigo.nome);
			
			draw_set_font(fnt_descricoes);
			
			if(!global.tutorial_ativo) draw_text_ext(xLeft,yInicial * 2.5, clicouQualInimigo.descricao, -1, room_width - 2 * xLeft);
			
			if(clicouQualInimigo.trancado == false && !global.tutorial_ativo)
			{
				draw_set_font(FontJogo);
				draw_set_color(c_white);
				
				draw_text(xLeft,yInicial * 3.5, "Resistência: " + string(clicouQualInimigo.hp_max));
				draw_text(xLeft,yInicial * 3.7, "Dano: " + string(clicouQualInimigo.dano));
				draw_text(xLeft,yInicial * 3.9, "Velocidade: " + string(clicouQualInimigo.vel * 10));
				draw_text(xLeft,yInicial * 4.1, "Peso: " + string(clicouQualInimigo.peso));
				
				draw_set_color(-1);
				draw_set_font(-1);
			}
		}
		else
		{

			
			if(!global.tutorial_ativo) 
			{
				if(!instance_exists(oButtonLevelUp))
				{
					with (instance_create_depth(xLeft-16,yInicial * 6, 1, oButtonLevelUp))
					{
						image_xscale = 2.75;
						image_yscale = 1;
					}
				}
				else
				{
					with (oButtonLevelUp)
					{
						image_xscale = 2.75;
						image_yscale = 1;
					}
				}
				
			}
			
			
			//draw_set_color(c_black);
			draw_set_font(FontJogo);
			
			if(!global.tutorial_ativo) draw_text_outline(xLeft, yInicial * 6, "Jogue para descobrir", c_black, _contorno_comprar, 1);
			
			draw_set_color(-1);
			draw_set_font(-1);
		}
	}
}

//aba das Trompas
if aba == 3
{
	limparPeixes = true;	
	limparInimigos= true;
	limparEspeciais = true;
	limparLoja = true;
		
	var _tamanhoListaTrompa = array_length(listaTrompas);

	if contar <= _tamanhoListaTrompa - 1
	{
		if contar >= fileira
		{
			yInicial += EspacamentoY;
			qtd = 1;
			fileira += fileiraInicial;
		}
		
		instance_create_depth(xInicial + (qtd * spacingX), yInicial, 0, listaTrompas[contar]);
	
		qtd ++;
		contar++;
	}
	else
	{
		qtd = 999;	
	}
	
	if clicouQualTrompa != noone
	{
		if(!global.tutorial_ativo)
		{
			draw_sprite_ext(spr_balao, 0, 32, 160, 1.266667, 1.266667, 0, c_white, 1);
		
			draw_sprite(clicouQualTrompa.sprite_index,0,xLeftButton , yInicial);
			
			draw_set_font(FontJogo);
			draw_set_color(c_black);
			
			draw_text(xLeft,yInicial * 2.25, clicouQualTrompa.nome);
			
			draw_set_font(fnt_descricoes);
			
			draw_text_ext(xLeft,yInicial * 2.6, clicouQualTrompa.descricao, -1, room_width - 2 * xLeft);
			
			draw_set_font(FontJogo);
			draw_set_color(c_white);
			
			draw_text(xLeft,yInicial * 3.5, "Efeito: " + string(clicouQualTrompa.efeito));
			draw_text(xLeft,yInicial * 4, "Tempo de Recarga: " + string(clicouQualTrompa.cooldownSave) + " segundos");
			draw_text(xLeft,yInicial * 4.5, "Duração: " + string(clicouQualTrompa.timerSave) + " segundos");
			
			draw_set_color(-1);
			draw_set_font(-1);
		}
		
		if clicouQualTrompa.trancado
		{
				
			if clicouQualTrompa != clicouQualObjetoButton 
			{
				if instance_exists(oButtonLevelUp)
				{
					
					instance_destroy(oButtonLevelUp);
				}
				
				clicouQualObjetoButton = clicouQualTrompa;
			}
			
			if(!global.tutorial_ativo && !instance_exists(oButtonLevelUp))
			{
				with (instance_create_depth(xLeft-16,yInicial * 6, 1, oButtonLevelUp))
				{
					qualObjeto = other.clicouQualTrompa;
					image_xscale = 2.25;
					image_yscale = 1;
				}
			}
			
			//draw_set_color(c_black);
			draw_set_font(FontJogo);
			
			if(!global.tutorial_ativo) 
			{
				//draw_text(xLeft,yInicial * 6, "Criar?  " + string(clicouQualTrompa.valorDesbloquear) + " recicláveis");
				draw_text_outline(xLeft, yInicial * 6, "Criar?", _cor_comprar, _contorno_comprar, 1);
				draw_text_outline(xLeft + string_width("Criar?_"), yInicial * 6, string(clicouQualTrompa.valorDesbloquear), _cor_recycle, _contorno_recycle, 1);
				draw_sprite(
					spr_reciclaveis, 0,
					
					xLeft +
					string_width("Criar?_" + string(clicouQualTrompa.valorDesbloquear) + "_") +
					sprite_get_width(spr_reciclaveis) / 2,
					
					yInicial * 6 +
					sprite_get_height(spr_reciclaveis) / 4
				);
			}
		
			draw_set_color(-1);
			draw_set_font(-1);
		}
		else
		{
			if(instance_exists(oButtonLevelUp))
			{
				instance_destroy(oButtonLevelUp);
			}
		}
	}
}

//aba dos especiais
if aba == 4
{
	limparPeixes = true;	
	limparInimigos = true;
	limparTrompas = true;
	limparLoja = true;
		
	var _tamanhoListaEsp = array_length(listaEspecial);

	if contar <= _tamanhoListaEsp -1
	{
		if contar >= fileira
		{
			yInicial += EspacamentoY;
			qtd = 1;
			fileira += fileiraInicial;
		}
		
		instance_create_depth(xInicial + (qtd * spacingX), yInicial, 0, listaEspecial[contar]);
		
		qtd ++;
		contar++;
	}
	else
	{
		qtd = 999;
	}

	if clicouQualEspecial != noone
	{
		if(!global.tutorial_ativo)
		{
			draw_sprite_ext(spr_balao, 0, 32, 160, 1.266667, 1.266667, 0, c_white, 1);
			
			draw_sprite(clicouQualEspecial.sprite_index,0,xLeftButton , yInicial);
			
			draw_set_font(FontJogo);
			draw_set_color(c_black);
			
			draw_text(xLeft,yInicial * 2.2, clicouQualEspecial.nome);
			
			draw_set_font(fnt_descricoes);
			
			draw_text_ext(xLeft,yInicial * 2.5, clicouQualEspecial.descricao, -1, room_width - 2 * xLeft);
			
			draw_set_font(FontJogo);
			draw_set_color(c_white);
			
			draw_text(xLeft,yInicial * 3.5, "Efeito: " + string(clicouQualEspecial.efeito));
			draw_text(xLeft,yInicial * 4, "Tempo de Recarga: " + string(clicouQualEspecial.cooldown) + " segundos");
			draw_text(xLeft,yInicial * 4.5, "Duração: " + string(clicouQualEspecial.timer) + " segundos");
			
			draw_set_color(-1);
			draw_set_font(-1);
		}
		
		if clicouQualEspecial.trancado
		{
			if clicouQualEspecial != clicouQualObjetoButton 
			{
				if instance_exists(oButtonLevelUp)
				{
					instance_destroy(oButtonLevelUp);
				}
	
				clicouQualObjetoButton = clicouQualEspecial;
			}
			
			if(!global.tutorial_ativo)
			{
				if(!instance_exists(oButtonLevelUp))
				{
					with (instance_create_depth(xLeft-16,yInicial * 6, 1, oButtonLevelUp))
					{
						qualObjeto = other.clicouQualEspecial;
						image_xscale = 2.5;
						image_yscale = 1;
					}
				}
				else
				{
					with ( oButtonLevelUp)
					{
						image_xscale = 2.5;
						image_yscale = 1;
					}
				}
				
			}
			
			//draw_set_color(c_black);
			draw_set_font(FontJogo);
			
			if(!global.tutorial_ativo) 
			{
				//draw_text(xLeft,yInicial * 6, "Libertar?  " + string(clicouQualEspecial.valorDesbloquear) + " recicláveis");
				draw_text_outline(xLeft, yInicial * 6, "Libertar?", _cor_comprar, _contorno_comprar, 1);
				draw_text_outline(xLeft + string_width("Libertar?_"), yInicial * 6, string(clicouQualEspecial.valorDesbloquear), _cor_recycle, _contorno_recycle, 1);
				draw_sprite(
					spr_reciclaveis, 0,
					
					xLeft +
					string_width("Libertar?_" + string(clicouQualEspecial.valorDesbloquear) + "_") +
					sprite_get_width(spr_reciclaveis) / 2,
					
					yInicial * 6 +
					sprite_get_height(spr_reciclaveis) / 4
				);
			}
			
			draw_set_color(-1);
			draw_set_font(-1);
		}
		else
		{
			if(instance_exists(oButtonLevelUp))
			{
				instance_destroy(oButtonLevelUp);
			}
		}
	}
}


//aba LOJA
if aba == 5 && !global.tutorial_ativo
{
	limparPeixes = true;	
	limparInimigos = true;
	limparTrompas = true;
	limparEspeciais = true;
		
	var _tamanhoListaEsp = array_length(listaLoja);

	if contar <= _tamanhoListaEsp -1
	{
		if contar >= fileira
		{
			yInicial += EspacamentoY;
			qtd = 1;
			fileira += fileiraInicial;
		}
		
		instance_create_depth(xInicial + (qtd * spacingX), yInicial, 0, listaLoja[contar]);
		
		qtd ++;
		contar++;
	}
	else
	{
		qtd = 999;
	}

	if clicouQualLoja != noone
	{
		if(!global.tutorial_ativo)
		{
			draw_sprite_ext(spr_balao, 0, 32, 160, 1.266667, 1.266667, 0, c_white, 1);
			
			draw_sprite(clicouQualLoja.sprite_index,0,xLeftButton , yInicial);
			
			draw_set_font(FontJogo);
			draw_set_color(c_black);
			
			draw_text(xLeft,yInicial * 2.2, clicouQualLoja.nome);
			
			draw_set_font(fnt_descricoes);
			
			draw_text_ext(xLeft,yInicial * 2.5, clicouQualLoja.descricao, -1, room_width - 2 * xLeft);
			
			draw_set_font(FontJogo);
			draw_set_color(c_white);
			
			//draw_text(xLeft,yInicial * 3.5, "Efeito: " + string(clicouQualLoja.efeito));
			//draw_text(xLeft,yInicial * 4, "Tempo de Recarga: " + string(clicouQualLoja.cooldown) + " segundos");
			//draw_text(xLeft,yInicial * 4.5, "Duração: " + string(clicouQualLoja.timer) + " segundos");
			
			draw_set_color(-1);
			draw_set_font(-1);
		}
		
			
			
			//draw_set_color(c_black);
			draw_set_font(FontJogo);
			
			/*if(!global.tutorial_ativo) 
			{
				//draw_text(xLeft,yInicial * 6, "Libertar?  " + string(clicouQualEspecial.valorDesbloquear) + " recicláveis");
				draw_text_outline(xLeft, yInicial * 6, "Libertar?", _cor_comprar, _contorno_comprar, 1);
				draw_text_outline(xLeft + string_width("Libertar?_"), yInicial * 6, string(clicouQualEspecial.valorDesbloquear), _cor_recycle, _contorno_recycle, 1);
				draw_sprite(
					spr_reciclaveis, 0,
					
					xLeft +
					string_width("Libertar?_" + string(clicouQualEspecial.valorDesbloquear) + "_") +
					sprite_get_width(spr_reciclaveis) / 2,
					
					yInicial * 6 +
					sprite_get_height(spr_reciclaveis) / 4
				);
			}*/
			
			draw_set_color(-1);
			draw_set_font(-1);
	}
}

//título das abas
if aba == 1
{
	textAba = "ANIMAIS";
}
if aba == 2
{
	textAba = "AMEAÇAS";
}
if aba == 3
{
	textAba = "TROMPAS";
}
if aba == 4
{
	textAba = "ESPECIAIS";
}
if aba == 5
{
	textAba = "LOJA";
}

draw_set_font(fnt_creditos);

draw_text(gui_width/20 - 32, gui_height/20, textAba);

draw_set_font(-1);