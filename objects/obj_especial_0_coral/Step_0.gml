// Inherit the parent event
event_inherited();

//FUNÇÃO "hit_bullet_padrao()" NO SCRIPT "scr_ini" ESTÁ CUIDANDO DE TUDO

//if(ativo)
//{
//	if(instance_exists(obj_tiro_pai))
//	{
//		with(obj_tiro_pai)
//		{
//			if(cria_frag(object_index))
//			{
//				var _ameaca = instance_place(x, y, obj_ini_ame_pai);
//				
//				if(instance_exists(_ameaca))
//				{
//					if(_ameaca)
//					{
//						var _frag = instance_create_layer(x, y, "Projeteis", obj_cria_fragmento); 
//						_frag.ignorar = _ameaca;
//						_frag.pai = pai;
//					}
//				}
//			}
//		}
//	}
//}