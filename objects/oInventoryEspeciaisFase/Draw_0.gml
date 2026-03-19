var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);



draw_sprite_stretched(
sBorda,
0,
(_camX + _camW/3) - borderX,
(_camY + _camH - 200) - borderY,
(12+rowLength*36) + borderX,
(12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36) + borderY
);

draw_set_color(c_black);
draw_set_font(FontJogo);

draw_text(_camX + _camW/3,_camY + _camH - 224,"ESCOLHIDOS PARA A BATALHA");

draw_set_font(-1);
draw_set_color(-1);

for (var i = 0;i < INVENTORY_ESPECIAL_FASE; i ++)
{
	var xx = _camX + _camW/3+(i mod rowLength) * 36 + 2;
	var yy = _camY + _camH - 200 + (i div rowLength) * 36 + 2;
	var hover = (oMouse.inventoryHover == id) && (oMouse.slotHover == i);
	
	draw_sprite(sSlot,hover,xx,yy)
	
	if (inventory[i] != -1)
	{
		var alpha = 1;
		if (oMouse.inventoryDrag == id) && (oMouse.slotDrag == i) alpha = 0.5;
		
		draw_set_alpha(alpha);
		
		draw_sprite(sItensSpc,inventory[i],xx,yy);	
		
		draw_set_alpha(1);
	}
}
