if(!sobe)
{
	if(speed > 0.5)
	{
		speed -= atrito;
	}
	else
	{
		sobe = true;
		speed = 0.5;
	}
	
}
else if(abs(x - dest_x) > 4 && abs(y - dest_y) > 4)
{
	speed += atrito;
	direction = point_direction(x, y, dest_x, dest_y);
}
else
{
	instance_destroy();
}

if(image_alpha > 0)
{
	image_alpha -= alpha;
}
else
{
	instance_destroy();
}