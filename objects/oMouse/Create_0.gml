inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;
lixo = false;

depth = -8502;


mouseOver = function() {
    // Reset hover results
    slotHover = -1;
    inventoryHover = -1;
	lixo = false;
    
    // Get camera and mouse info once
    var camX = camera_get_view_x(view_camera[0]);
    var camY = camera_get_view_y(view_camera[0]);
    var camW = camera_get_view_width(view_camera[0]);
    var camH = camera_get_view_height(view_camera[0]);
    var mx = mouse_x;
    var my = mouse_y;
    
    // Check all inventory types
    checkInventory(oInventory, camX + camW/3, camY + camH/3, INVENTORY_SLOTS);
    checkInventory(oInventoryFase, camX + camW/3, camY + camH - 200, INVENTORY_SLOTS_FASE);
    checkInventory(oInventoryTrompas, camX + camW/3, camY + camH/3, INVENTORY_SLOTS_CARTAS);
    checkInventory(oInventoryTrompasFase, camX + camW/3, camY + camH - 200, INVENTORY_CARTAS_FASE);
    checkInventory(oInventoryEspeciais, camX + camW/3, camY + camH/3, INVENTORY_SLOTS_ESPECIAL);
    checkInventory(oInventoryEspeciaisFase, camX + camW/3, camY + camH - 200, INVENTORY_ESPECIAL_FASE);
	checkInventory(oInventoryLixo, camX + camW/3, camY + 64, INVENTORY_LIXO,true);
	
}

function checkInventory(inventoryObj, startX, startY, slotCount, _lixo = false) {
    var camX = camera_get_view_x(view_camera[0]);
    var camW = camera_get_view_width(view_camera[0]);
    var mx = mouse_x;
    var my = mouse_y;

	
    
    with (inventoryObj) {
        var endX = startX + 12 + rowLength * 36;
        var endY = startY + 12 + ((slotCount - 1) div rowLength + 1) * 36;
        
        if (point_in_rectangle(mx, my, startX, startY, endX, endY)) {
            for (var i = 0; i < slotCount; i++) {
                var xx = startX + (i mod rowLength) * 36 + 2;
                var yy = startY + (i div rowLength) * 36 + 2;
                
                if (point_in_rectangle(mx, my, xx, yy, xx + 32, yy + 32)) {
                    other.slotHover = i;
                    other.inventoryHover = id;
					other.lixo = _lixo;
					//show_message(inventoryObj);
                }
                
                draw_rectangle(xx, yy, xx + 32, yy + 32, false);
            }
        }
    }
}

stateFree = function()
{
	mouseOver();
	//Start to drag an item if slot is not empty
	if (mouse_check_button(mb_left)) && (slotHover != -1)&& (inventoryHover.inventory[slotHover] != -1) && !lixo
	{
		//enter drag state
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover];
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
	}/*else if (mouse_check_button(mb_right)) && (slotHover != -1)&& (inventoryHover.inventory[slotHover] != -1)
	{
		InventoryRemove(oInventory,inventoryHover.inventory[slotHover],slotHover);
	}*/
}

stateDrag = function()
{
	mouseOver();
	if (!mouse_check_button(mb_left))
	{
		//swap with slot if hovering
		if (slotHover != -1) InventorySwap(inventoryDrag,slotDrag,inventoryHover,slotHover);
		{
			//Return to free state
			state = stateFree;
			itemDrag = -1;
			inventoryDrag = -1;
			slotDrag = -1;
		}
	}
}

state = stateFree;