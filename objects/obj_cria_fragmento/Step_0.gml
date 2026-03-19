//PAUSANDO
if(screen_pause() == true)
{
	exit;
}

for (var i = 0; i < 6; i++) 
{
	//var frag = instance_create_layer(x, y, "Projeteis", obj_area_explosao); //explodir no contato
	var _frag = instance_create_layer(x, y, "Projeteis", obj_tiro_fragmento); // Substitua pelos fragmentos dps
	_frag.direction = i * 60; // 60 graus entre cada fragmento (360/6 = 60)
	_frag.vel = 1; // Velocidade dos fragmentos
	_frag.image_angle = i * 60;
	_frag.ignorar = ignorar;
	_frag.pai = pai;
}

instance_destroy();