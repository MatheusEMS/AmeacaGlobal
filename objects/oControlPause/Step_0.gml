//pauseKeyPressed = global.pauseKey;
var pauseKeyPressed = keyboard_check_pressed(vk_escape);

if instance_exists(oPreparacao)
{
	exit;	
}


//pause menu
if pauseKeyPressed
{
	
	if !instance_exists(oPauseMenu)
	{
		instance_create_depth(0,0,0,oPauseMenu);
	}else{
		instance_destroy(oPauseMenu);
	}
	
}

//pause self
if screen_pause() == true
{
	exit;
}

