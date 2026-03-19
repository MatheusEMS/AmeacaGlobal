
if (itemDrag != -1 && (instance_exists(oInventoryFase)))
{
	draw_set_alpha(0.5);
	draw_sprite(sItensAni,itemDrag,mouse_x,mouse_y);
	draw_set_alpha(1);
}else if itemDrag != -1 && (instance_exists(oInventoryTrompas))
{
	draw_set_alpha(0.5);
	draw_sprite(sItensCar,itemDrag,mouse_x,mouse_y);
	draw_set_alpha(1);
}else if itemDrag != -1
{
	draw_set_alpha(0.5);
	draw_sprite(sItensSpc,itemDrag,mouse_x,mouse_y);
	draw_set_alpha(1);
}

