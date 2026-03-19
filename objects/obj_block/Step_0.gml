
//iniciando variáveis
var _lixo = instance_place(x, y, obj_ini_ame_pai)

//se um lixo tocar em mim
if(_lixo)
{
	global.hp_atual -= _lixo.dano; //o player sofre dano
	instance_destroy(_lixo); //destói o lixo
	
	if(!instance_exists(obj_hit_screen))
	{
		instance_create_layer(0, 0, "UI", obj_hit_screen);
	}
}