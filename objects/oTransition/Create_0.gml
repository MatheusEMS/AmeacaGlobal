/// @description Size variables and mode setup

depth = -1;

w = RES_W
//w = display_get_gui_width();
h = RES_H
h_half = h * 0.5;

enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	RESTARTROOM
}

mode = TRANS_MODE.INTRO;
percent = 1;
percentTarget = 1.2;
target = room;

