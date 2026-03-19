//get the volume
var _sfxVol = global.SFX_VOL * global.master_sfx_vol;


//coin snd
if buttonSnd == true
{
	var _snd = audio_play_sound(confirm_style_1_001,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	buttonSnd = false;
}

if buttonDenySnd == true
{
	var _snd = audio_play_sound(error_style_1_001,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	buttonDenySnd = false;
}

if BatidaBorrachaSnd == true
{
	var _snd = audio_play_sound(BatidaBorracha,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	BatidaBorrachaSnd = false;
}

if BatidaPlasticoSnd == true
{
	var _snd = audio_play_sound(BatidaPlastico,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	BatidaPlasticoSnd = false;
}

if punchSnd == true
{
	var _snd = audio_play_sound(punch,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	punchSnd = false;
}



if SplashSnd == true
{
	var _snd = audio_play_sound(Splash,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	SplashSnd = false;
}


if bolhaEstourandoSnd == true
{
	var _snd = audio_play_sound(bolhaEstourando,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	bolhaEstourandoSnd = false;
}


if upandoPeixeSnd == true
{
	var _snd = audio_play_sound(upandoPeixe,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	upandoPeixeSnd = false;
}

if ExplodirBaiacuSnd == true
{
	var _snd = audio_play_sound(ExplodirBaiacu,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	ExplodirBaiacuSnd = false;
}

if CompraSnd == true
{
	var _snd = audio_play_sound(Compra,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	CompraSnd = false;
}

if bolhasSnd == true
{
	var _snd = audio_play_sound(bolhas,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	bolhasSnd = false;
}

if ostra_engolindo__cortado_Snd == true
{
	var _snd = audio_play_sound(ostra_engolindo__cortado_,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	ostra_engolindo__cortado_Snd = false;
}

if ostra_fechandoSnd == true
{
	var _snd = audio_play_sound(ostra_fechando,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	ostra_fechandoSnd = false;
}

if explosao_perolas__cortado_Snd == true
{
	var _snd = audio_play_sound(explosao_perolas__cortado_,8,false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset
	explosao_perolas__cortado_Snd = false;
}


//press button
if buttonPressSnd == true
{
	/*var _snd = audio_play_sound();
	audio_sound_gain(_snd, _sfxVol,0);
	buttonPressSnd = false;*/
}

if buttonReleaseSnd == true 
{
	/*var _snd = audio_play_sound();
	audio_sound_gain(_snd, _sfxVol,0);
	buttonReleaseSnd = false;*/
}


//Looping sfx

	//turn sound effect on and store the instance of the sound
	
	
	if MarteloBatendoBigornaSnd == true && !audio_is_playing(MarteloBatendoBigornaSndInst)
	{
		MarteloBatendoBigornaSndInst = audio_play_sound(MarteloBatendoBigorna,6,true);		
	}
	
	if audio_is_playing(MarteloBatendoBigornaSndInst)
	{
		audio_sound_gain( MarteloBatendoBigornaSndInst, _sfxVol,0);
	}
	
	if MarteloBatendoBigornaSnd == false && audio_is_playing( MarteloBatendoBigornaSndInst)
	{
		audio_stop_sound(MarteloBatendoBigornaSndInst);
	}

	MarteloBatendoBigornaSnd = false;
	
	
	if choqueEletricoSnd == true && !audio_is_playing(choqueEletricoSndInst)
	{
		choqueEletricoSndInst = audio_play_sound(choqueEletrico,6,true);		
	}
	
	if audio_is_playing(choqueEletricoSndInst)
	{
		audio_sound_gain( choqueEletricoSndInst, _sfxVol,0);
	}
	
	if choqueEletricoSnd == false && audio_is_playing( choqueEletricoSndInst)
	{
		audio_stop_sound(choqueEletricoSndInst);
	}

	choqueEletricoSnd = false;
	
	if dolphinSnd == true && !audio_is_playing(dolphinSndInst)
	{
		dolphinSndInst = audio_play_sound(dolphin_noise,6,true);		
	}
	
	if audio_is_playing(dolphinSndInst)
	{
		audio_sound_gain(dolphinSndInst, _sfxVol,0);
	}
	
	if dolphinSnd == false && audio_is_playing( dolphinSndInst)
	{
		audio_stop_sound(dolphinSndInst);
	}

	dolphinSnd = false;
	
	
	if motorBarcoSnd == true && !audio_is_playing(motorBarcoSndInst)
	{
		motorBarcoSndInst = audio_play_sound(motorBarco,6,true);		
	}
	
	if audio_is_playing(motorBarcoSndInst)
	{
		audio_sound_gain( motorBarcoSndInst, _sfxVol,0);
	}
	
	if motorBarcoSnd == false && audio_is_playing( motorBarcoSndInst)
	{
		audio_stop_sound(motorBarcoSndInst);
	}

	motorBarcoSnd = false;
	
	
	
	//SFX FADE IN AND OUT
		//start the loop and turn up the volume
		
		/*
		if beachSndLoop == true 
		{
			//play the sound
			if !audio_is_playing(beachSndLoopInst)
			{
				beachSndLoopInst = audio_play_sound(sndBeach, 6 ,true);
			}
			
			//raise the volume
			if beachSndLoopVol < 1
			{
				beachSndLoopVol += 	beachSndLoopVolSpd;
			}else {
				beachSndLoopVol = 1;
			}
		}
		
		//fade out and turn off
		if beachSndLoop == false 
		{
			//lower the  volume
			if beachSndLoopVol > 0
			{
				beachSndLoopVol -= 	beachSndLoopVolSpd;
			}else {
				beachSndLoopVol = 0;
			}
			
			//stop the sound if the gain is 0
			if beachSndLoopVol <= 0
			{
				audio_stop_sound(beachSndLoopInst);	
			}
		}
		
		//set the volume
		if audio_is_playing(beachSndLoopInst)
		{
			audio_sound_gain(beachSndLoopInst, beachSndLoopVol * _sfxVol,0);	
		}*/
		
		//reset
		beachSndLoop = false;