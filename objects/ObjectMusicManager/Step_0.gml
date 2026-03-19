/*if global.pause || global.mapaAberto{
global.musicVolume = 0.25;
global.masterVolume = 0.25;	
}else{
global.musicVolume = 0.5;
global.masterVolume = 0.5;	
}*/

var _finalVol = global.musicVolume*global.masterVolume;


//play the target song
if songAsset != targetSongAsset{
	
	//tell the old song to fade out
	if audio_is_playing(songInstance){
		//add our songInstance to our array of songs to fade out
		array_push(fadeOutIntances, songInstance);
		//add the song instance starting volume(so there no change in volume)
		array_push(fadeOutInstVol, fadeInInsVol);
		//add the fadeout instance fade out frame
		array_push(fadeOutInstTime, endFadeOutTime);
		
		//reset the song instance and song asset variable
		songInstance = noone;
		songAsset = noone;
		
	}
	
	//play the target song, if the old song have fade out
	if array_length(fadeOutIntances) == 0 || songoverlap{
		
		if audio_exists(targetSongAsset){
			//play the song and store its instance in a variable
			songInstance = audio_play_sound(targetSongAsset, 4, true);
			
			
			//start the song volume at 0
			audio_sound_gain( songInstance, 0 ,0);
			fadeInInsVol = 0;
		}
	
		songAsset = targetSongAsset;
		songoverlap = false;
		}
}




//volume control
//main song volume
if audio_is_playing(songInstance){
	
	//fade in song in
	if startFadeInTime > 0 
	{
		
		if fadeInInsVol < 1 {
			
			fadeInInsVol += 1/startFadeInTime;
		}else{
			fadeInInsVol = 1;
		}
	}//immediately start  the song if the fade in time is 0 frames
	else{
		fadeInInsVol = 1;
	}
	
	//actually set the gain
	audio_sound_gain(songInstance, fadeInInsVol*_finalVol, 0);
	
}

//fading song out
for(var i = 0;i < array_length(fadeOutIntances); i++){
	
	//fade the volume
	if fadeOutInstTime[i] > 0 
	{
		
		if fadeOutInstVol[i] > 0{
			fadeOutInstVol[i] -= 1/fadeOutInstTime[i];
		}
	}//cut volume to 0
	else{
		fadeOutInstVol[i] = 0;
	}
	
	audio_sound_gain(fadeOutIntances[i], fadeOutInstVol[i]*_finalVol, 0);
	
	//stop the song when its volume is at 0 and remove it from all arrays
	if fadeOutInstVol[i] <= 0{
		if audio_is_playing(fadeOutIntances[i]){
			audio_stop_sound(fadeOutIntances[i]);
		}
		//remove from the arrays
		array_delete(fadeOutIntances,i,1);
		array_delete(fadeOutInstVol,i,1);
		array_delete(fadeOutInstTime,i,1);
		//set loop back
		i--;
	}
	
}