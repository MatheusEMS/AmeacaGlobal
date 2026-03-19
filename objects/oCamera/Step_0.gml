/// @description ?
//x = 0;
//y = 0;

if instance_exists(oPreparacao)
{
	y = -200;
}else
{
	yTo = 0;	
}

// Suavização do movimento da câmera
x += (xTo - x) / 25;
y += (yTo - y) / 25;

//Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

camera_set_view_pos(cam,x,y);
camera_set_view_size(cam, RES_W, RES_H);