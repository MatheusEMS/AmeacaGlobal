//se movendo com base numa onda senoidal
tempo = get_timer() / 1000000;

//criando a onda senoidal
var _onda = sin(tempo * vel);

//criando o espaço para se mover
var _y = ystart + _onda * dist;

y = _y;