function set_song_ingame(_song, _fadeoutCurrentSong = 0 , _fadein = 0, _songoverlap = false){
	
	with (ObjectMusicManager)
	{
		targetSongAsset = _song;
		endFadeOutTime = _fadeoutCurrentSong;
		startFadeInTime = _fadein;
		songoverlap = _songoverlap;
	}
}