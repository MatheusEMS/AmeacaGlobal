


menu_x += (menu_x_target - menu_x) / menu_speed;

if menu_control
{
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight *1.5);
		
		if mouse_check_button_pressed(mb_left)
		{
			menu_x_target = gui_width+200;
			menu_committed = menu_cursor;
			menu_control = false;
			
		}
	}
}

if (menu_x > gui_width+150) && (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 0:
			game_end();	
		break;
		
		case 1:
			var _filename = "savedata.sav";
	
			if !file_exists(_filename)
			{
				msg_not_save = true;
				if(msg_timer <= 0) msg_timer = 180; // 3 segundos
				//room_restart();
			}else
			{
				load_game();
			}
			
		break;
		
		case 2:
			draw_set_font(FontJogo);
			Transition(TRANS_MODE.GOTO,rm_IntroTutorial);
		break;
	}

}

//Título
switch(intro_phase)
{
	case 0:// Movimento horizontal do "AMEAÇA"
	{
		ameaca_x += (ameaca_target_x - ameaca_x) / 10;
		
		if(abs(ameaca_x - ameaca_target_x) < 1)
		{
		    ameaca_x = ameaca_target_x; // trava a posição final
		    intro_phase = 1;
		    global_visible = true;
		
		    // Captura posição fixa para o GLOBAL usar
		    global_x = ameaca_x;
		    global_y = ameaca_y;
		}
		
		break;
	}


	case 1: //"Escorrendo" GLOBAL
	{
		if(global_appear_progress < 1)
		{
			global_appear_progress += global_vel;
		}
		else
		{
			global_appear_progress = 1;
			intro_timer += 1;
			
			if(intro_timer > 30)
			{
				intro_phase = 2;
				menu_control = true;
			}
		}
		
		break;
	}
	case 2: //Menu já é manipulado normalmente
	{
		if (!menu_animation_started) 
		{
		    menu_x = menu_initial_x; // Força recomeçar da direita
		    menu_animation_started = true;
		    menu_visible = true; // Agora pode desenhar!
		}
		menu_x += (menu_x_target - menu_x) / menu_speed;
		break;
	}
}

if(intro_phase >= 1) // Quando o AMEAÇA parar de se mover
{
    ameaca_shadow_ready = true;
}

if ameaca_shadow_ready && ameaca_shadow_alpha < ameaca_shadow_max_alpha {
    ameaca_shadow_alpha += ameaca_shadow_fadein_speed;
    if ameaca_shadow_alpha > ameaca_shadow_max_alpha {
        ameaca_shadow_alpha = ameaca_shadow_max_alpha;
    }
}