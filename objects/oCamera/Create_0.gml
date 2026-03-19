#macro RES_W 1280
#macro RES_H 720

cam = view_camera[0];

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

x = 0;
y = 0;

xTo = 0;
yTo = 0;

window_set_size(RES_W,RES_H);
surface_resize(application_surface, RES_W, RES_H);
display_set_gui_size(RES_W, RES_H);