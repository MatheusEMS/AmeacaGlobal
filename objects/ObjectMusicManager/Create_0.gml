/// @description Insert description here
// You can write your code in this editor
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0;
startFadeInTime = 0;
fadeInInsVol = 0.5; //volume

global.musicVolume = 0.1;
global.masterVolume = 1;

//for fading out and stopping songs that are no lonher playing
fadeOutIntances = array_create(0);
fadeOutInstVol = array_create(0);
fadeOutInstTime = array_create(0);

songoverlap = false;