// Inherit the parent event
event_inherited();

//PAUSANDO
if(screen_pause() == true)
{
	exit;
}

var _ameaca = instance_place(x, y, obj_ini_ame_pai);

//girando
image_angle += random_range(0.5, 1) * dir;

tempoVida--;

if tempoVida <= 0
{
	instance_destroy();	
}

if(instance_exists(_ameaca) && _ameaca != ignorar)
{
	if(_ameaca)
	{
		cria_popup_dano(_ameaca, dano);
		
		if(_ameaca.hp > dano)
		{
			_ameaca.hp -= dano;
		}
		else
		{
			cria_perolas(5, 15, _ameaca.x, _ameaca.y);
			instance_destroy(_ameaca);
		}
		
		//                |
		//ISSO NUNCA RODA V
		
		//if instance_exists(obj_especial_0_coral) && cria_frag(object_index)
		//{
		//	show_message("rodando locura");
		//	if obj_especial_0_coral.especial1 == true
		//	{
		//		show_message("criando fragmento loco");
		//          var _frag = instance_create_layer(x, y, "Projeteis", obj_cria_fragmento); 
		//		  _frag.ignorar = _ameaca;
		//	}
		//}
		
		instance_destroy();
	}
}