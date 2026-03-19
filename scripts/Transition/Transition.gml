/// @arg Mode sets transition mode between next, restart and goto.
/// @arg Target sets target room when using the goto mode

function Transition()
{
	with (oTransition)
	{
		mode = argument[0]; 
	
		if argument_count > 1
		{
			target = argument[1];	
		}
	}
}

function CameraShake(_magnitude,_frames)
{
	with oCamera
	{
		if _magnitude > shake_remain
		{
			shake_magnitude = _magnitude;
			shake_remain = _magnitude;
			shake_length = _frames;
		}
	}
}
