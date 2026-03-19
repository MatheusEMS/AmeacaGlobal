// Inherit the parent event
event_inherited();

if(screen_pause() == true)
{
	exit;
}

if(ativo) //se estou ativo
{
	if(ecco == noone)
	{
		//show_message("criando golfinho");
		ecco = instance_create_layer(room_width + sprite_get_width(spr_ani_golfinho), room_height / 2, "Especial", obj_ani_golfinho)
	}
	
	with(ecco)
	{
		if(other.timer == 0 && x + sprite_width - 1 > room_width)
		{
			x -= 1;
			image_speed = 0;
		}
		else
		{
			image_speed = 1;
			other.timer++;
			other.draw_onda = true;
			oSFX.dolphinSnd = true;
			
			if(other.timer >= 180)
			{
				image_index = 0;
				image_speed = 0;
				other.draw_onda = false;
				
				if(x - 1 < room_width)
				{
					x+= 1;
				}
				else
				{
					with(obj_trompa_pai)
					{
						if(cooldown >= 5)
						{
							cooldown -= 5;
						}
						else
						{
							cooldown = 0;
						}
					}
					
					other.timer = 0;
					other.cooldown = other.cooldownSave;
					other.ativo = false;
					other.ecco = noone;
					instance_destroy();
				}
			}
		}
	}	
}