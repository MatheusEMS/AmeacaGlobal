draw_self();


if(global.debug)
{
	//desenhando meu range
	var _left, _top, _right, _bottom;
	_left = torre_dona.x - 1;
	_right = torre_dona.x + torre_dona.sprite_width + 1;
	_top = torre_dona.y - torre_dona.sprite_height - 1;
	_bottom = torre_dona.y + 1;
	
	draw_rectangle(_left, _top, _right, _bottom, true);
}