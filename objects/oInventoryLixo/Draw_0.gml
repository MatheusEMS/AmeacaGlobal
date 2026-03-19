var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

for (var i = 0;i < INVENTORY_LIXO; i ++)
{
	var xx = _camX + _camW/3 +(i mod rowLength) * 36 + 2;
	var yy = _camY + 64 + (i div rowLength) * 36 + 2;
	var hover = (oMouse.inventoryHover == id) && (oMouse.slotHover == i);
	
	draw_sprite(sSlot,hover,xx,yy)
	
	if (inventory[i] != -1)
	{
		var alpha = 1;
		if (oMouse.inventoryDrag == id) && (oMouse.slotDrag == i) alpha = 0.5;
		
		draw_set_alpha(alpha);
		
		draw_sprite(sItensLixo,inventory[i],xx,yy);	
		
		draw_set_alpha(1);
	}
}

if oMouse.inventoryHover == id && (oMouse.slotHover != -1) && (id.inventory[oMouse.slotHover] != -1) 
{
	draw_sprite_stretched(
	sBorda,
	0,
	_camX + _camW/12,
	_camY + 64,
	250,
	288
	);
	
	draw_sprite(sItensLixo,id.inventory[oMouse.slotHover],_camX + _camW/6, _camY + 52);
	
	draw_set_color(c_black);
	draw_set_font(FontJogo);
	
	define_align(fa_middle, fa_center);
	draw_text(_camX +_camW/5.5, _camY + 96,NomeAmeaca(id.inventory[oMouse.slotHover]));
	define_align(-1,-1);
	draw_text_ext(_camX +_camW/9, _camY + 112,DescAmeaca(id.inventory[oMouse.slotHover]),16,192);
	
	draw_set_font(-1);
	draw_set_color(-1);
}

