depth = -8000;

camX = camera_get_view_x(view_camera[0]);
camW = camera_get_view_width(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);
camH = camera_get_view_height(view_camera[0]);

SpaceFromBorderY = 128;
SpaceFromBorderX = 256;

x1 = SpaceFromBorderX;
x2 = RES_W - SpaceFromBorderX;
y1 = SpaceFromBorderY
y2 = RES_H - SpaceFromBorderY;

instance_create_depth(camX + camW/1.5,camY + camH/1.5,-8001,oButtonVoltarMenu);

if(!global.tutorial_ativo)
{
	instance_create_depth(camX + camW/3,camY + camH/1.5,-8001,oButtonReset);
}

function Cena(_fase)
{
	if(instance_exists(oTranstionPosAnim))
	{
		//show_debug_message("function Cena(): "+string(oTranstionPosAnim.Seq));
		return oTranstionPosAnim.Seq == _fase;
	}
	return false;
}

ganhou = true;

mens = "";
desc = "";
animal = "";
fase = noone;


