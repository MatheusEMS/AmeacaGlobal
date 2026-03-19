//Verificação de segurança
if (!is_struct(efeito_data) || !instance_exists(efeito_data.torre_id))
{
    exit;
}

var torre = efeito_data.torre_id;

//Barra de tempo restante (como fatia de pizza)
var tempo = efeito_data.tempo_restante;
var duracao = efeito_data.duracao_padrao;
var _frac = clamp(tempo / duracao, 0, 1); // porcentagem restante
var angle_end = 360 * _frac;

//Coordenadas do círculo (retângulo envolvente)
var x1 = x - radius;
var y1 = y - radius;
var x2 = x + radius;
var y2 = y + radius;

//Definir início e fim do arco
var x3 = x + radius;
var y3 = y;
var x4 = x + lengthdir_x(radius, angle_end);
var y4 = y + lengthdir_y(radius, angle_end);

//Linha para torre se cursor estiver sobre o círculo
if(hover)
{
	//draw_set_color(c_yellow);
	//draw_line(x, y, torre.x + torre.sprite_width / 2, torre.y - torre.sprite_height / 2);
	
	//Definindo o ponto inicial e final
	var start_x = x;
	var start_y = y;
	var end_x = torre.x + torre.sprite_width / 2;
	var end_y = torre.y - torre.sprite_height / 2;
	
	//Comprimento total
	var total_length = point_distance(start_x, start_y, end_x, end_y);
	
	//Definindo a largura inicial e final
	var initial_width = 3;
	var final_width = 1;
	
	//Número de segmentos que serão desenhados
	var num_segments = 20;
	
	//Loop para desenhar os segmentos de linha
	for (var i = 0; i < num_segments; i++)
	{
		//Calculando a posição atual ao longo da linha
		var current_segment_length = total_length / num_segments;
		var current_x = start_x + (end_x - start_x) * (i + 1) / num_segments;
		var current_y = start_y + (end_y - start_y) * (i + 1) / num_segments;
		
		//Calculando a largura desse segmento (interpolação linear)
		var current_width = initial_width - (initial_width - final_width) * (i + 1) / num_segments;
		
		//Desenhando o segmento de reta
		draw_set_color(c_ltgray);
		draw_line_width(start_x + (end_x - start_x) * i / num_segments, start_y + (end_y - start_y) * i / num_segments, current_x, current_y, current_width);
		start_x = current_x;
		start_y = current_y;
		draw_set_color(-1);
	}
}

//Fundo circular (contorno completo)
draw_set_color(c_black);
draw_circle(x-1, y-1, radius+2, false);
draw_set_color(-1);

//Cor da pizza (tempo restante)
draw_set_color(c_white);
draw_pie(x1, y1, x2, y2, x3, y3, x4, y4, false, 24);
draw_set_color(-1);

//resetando os padrões de draw
draw_set_alpha(1);
define_align(-1, -1);