draw_self();

if(global.debug)
{
	if(instance_exists(torre_dona))
	{
		var _dir = (dir > 0) ? "> 0" : "< 0";
	
		draw_text(torre_dona.x, torre_dona.y, _dir);
	}
}