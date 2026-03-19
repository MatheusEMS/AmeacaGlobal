
//vfx
function screen_pause()
{
	
	//pause self
	if instance_exists(oScreenPause)
	{
		image_speed = 0;
		return true;
	}else{
		image_speed = 1;
		return false;
	}
	

}

function create_screen_pause(_time = 3)
{
	//screen pause
		with(instance_create_depth(0,0,0, oScreenPauseTimed))
		{
			timer = 8;
		}
	
}

function camera_shake(_amount = 4)
{
	//diminuir shake
	//_amount = *= global.shake;
	
	with(oCamera)
	{
		xShakeAmount = _amount;
		yShakeAmount = _amount;
	}
}

function create_animated_vfx(_sprite,_x,_y,_depth,_xScale = 1,_yScale =1, _rot = 0)
{
	with(instance_create_depth(_x,_y,_depth,oAnimatedVFX))
	{
		sprite_index = _sprite;
		image_xscale = _xScale;
		image_yscale = _yScale;
		image_angle = _rot;
	}
}
