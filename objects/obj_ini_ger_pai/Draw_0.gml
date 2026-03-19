//subindo e descendo
//se movendo com base numa onda senoidal
tempo_osc = get_timer() / 1000000;

//criando a onda senoidal
var _onda_1 = sin(tempo_osc * vel_osc);

//criando o espaço para se mover
var _y = ystart + _onda_1 * dist_osc;

//y = _y;



draw_sprite_ext(sprite_index, 0, x, _y, image_xscale, image_yscale, image_angle, c_white, 1);