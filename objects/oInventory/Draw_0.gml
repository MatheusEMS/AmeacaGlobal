var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);




draw_sprite_stretched(
sBorda,
0,
(_camX + _camW/3) - borderX,
(_camY + _camH/3) - borderY,
(12+rowLength*36) + borderX,
(12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36) + borderY
);

draw_set_color(c_black);
draw_set_font(FontJogo);

draw_text(_camX + _camW/3,_camY + _camH/3 - 24,"ANIMAIS DISPONÍVEIS");

draw_set_font(-1);
draw_set_color(-1);

for (var i = 0;i < INVENTORY_SLOTS; i ++)
{
	var xx = _camX + _camW/3 +(i mod rowLength) * 36 + 2;
	var yy = _camY + _camH/3 + (i div rowLength) * 36 + 2;
	var hover = (oMouse.inventoryHover == id) && (oMouse.slotHover == i);
	
	draw_sprite(sSlot,hover,xx,yy)
	
	if (inventory[i] != -1)
	{
		var alpha = 1;
		if (oMouse.inventoryDrag == id) && (oMouse.slotDrag == i) alpha = 0.5;
		
		draw_set_alpha(alpha);
		
		draw_sprite(sItensAni,inventory[i],xx,yy);	
		
		draw_set_alpha(1);
	}
}

if oMouse.inventoryHover == id && (oMouse.slotHover != -1) && (id.inventory[oMouse.slotHover] != -1) 
{
	draw_sprite_stretched(
	sBorda,
	0,
	_camX + _camW/12 - 8,
	_camY + _camH/3,
	216,
	320
	);
	
	
	draw_sprite(sItensAni,id.inventory[oMouse.slotHover],_camX + _camW/6.7, _camY + _camH/3.15);
	
	draw_set_font(FontJogo);
	draw_set_color(c_black);
	
	define_align(fa_middle, fa_center);
	draw_text(_camX +_camW/6.15,_camY + _camH/2.6,NomeAnim(id.inventory[oMouse.slotHover]));
	define_align(-1,-1);
	draw_text_ext(_camX + _camW/10, _camY + _camH/2.45, EfeitoAnim(id.inventory[oMouse.slotHover]), 16, 160);
	draw_text(_camX + _camW/10, _camY + _camH/1.95, "Dano: " + string(AtaqueAnim(id.inventory[oMouse.slotHover],global.LVpeixes[id.inventory[oMouse.slotHover]])));
	draw_text(_camX + _camW/10, _camY + _camH/1.85, "Alcance: " + string(RangeAnim(id.inventory[oMouse.slotHover])/32));
	draw_text(_camX + _camW/10, _camY + _camH/1.75, "Intervalo de Ataque: " + string(CdTiroAnim(id.inventory[oMouse.slotHover]) / 10));
	draw_text(_camX + _camW/10, _camY + _camH/1.65, "Resistência: " + string(ForcaAnim(id.inventory[oMouse.slotHover])));
	draw_text(_camX + _camW/10, _camY + _camH/1.55, "Vida: " + string(VidaAnim(id.inventory[oMouse.slotHover],global.LVpeixes[id.inventory[oMouse.slotHover]])));
	draw_text(_camX + _camW/10, _camY + _camH/1.4, "Custo: " + string(CustoAnim(id.inventory[oMouse.slotHover])));
	draw_sprite(spr_perola, 0, _camX + _camW/10 + string_width("Custo:_" + string(CustoAnim(id.inventory[oMouse.slotHover])) + "_"), _camY + _camH/1.4 + sprite_get_height(spr_perola));
	
	draw_set_font(-1);
	draw_set_color(-1);
}
