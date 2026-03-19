function draw_lightning(x, y, x2, y2, branches, colour, thickness) {
    // Garante que a espessura fique dentro de um intervalo razoável
    thickness = clamp(thickness, 0.1, 10);

    var dir = point_direction(x, y, x2, y2);
    var length = point_distance(x, y, x2, y2);

    // Criar pontos de segmentação ao longo do raio
    var point = [0];
    var i = 0;
    while (i < length) {
        i++;
        if (random(1) < 0.06) {
            array_push(point, i);
        }
    }
    array_push(point, length);
    var points = array_length(point);

    // Variáveis auxiliares para desenhar os segmentos
    var i2 = 1;
    var difx = 0, difx2 = 0;
    var dify = 0, dify2 = 0;

    while (i2 < points) {
        difx = random_range(-7, 7);
        dify = random_range(-7, 7);

        var xx  = x + lengthdir_x(point[i2 - 1], dir);
        var yy  = y + lengthdir_y(point[i2 - 1], dir);
        var xx2 = x + lengthdir_x(point[i2], dir);
        var yy2 = y + lengthdir_y(point[i2], dir);

        // Criar uma ramificação (branch)
        if (random(1) < 0.15 && branches) {
            var bdir = dir + choose(random_range(-45, -25), random_range(25, 45));
            var blength = random_range(5, 30);
            draw_lightning(
                xx + difx2, yy + dify2,
                xx + difx2 + lengthdir_x(blength, bdir),
                yy + dify2 + lengthdir_y(blength, bdir),
                false,
                colour,
                thickness * 0.6 // ramificações mais finas
            );
        }

        var size = random_range(thickness * 0.3, thickness);

        // Desenhar o brilho do raio
        draw_set_alpha(0.1);
        draw_line_width_colour(xx + difx2, yy + dify2, xx2 + difx, yy2 + dify, size + 5, colour, colour);
        draw_line_width_colour(xx + difx2, yy + dify2, xx2 + difx, yy2 + dify, size + 3, c_white, c_white);
        draw_line_width_colour(xx + difx2, yy + dify2, xx2 + difx, yy2 + dify, size + 1, c_white, c_white);
        draw_set_alpha(1);

        // Centro branco do raio
        draw_line_width_colour(xx + difx2, yy + dify2, xx2 + difx, yy2 + dify, size, c_white, c_white);

        i2++;
        difx2 = difx;
        dify2 = dify;
    }

    // Desenhar um círculo brilhante na origem
    if (branches) {
        var size = random_range(1, 2);
        draw_set_alpha(0.1);
        draw_circle_colour(x, y, size + 2.5, colour, colour, false);
        draw_circle_colour(x, y, size + 1.5, colour, colour, false);
        draw_circle_colour(x, y, size + 0.5, colour, colour, false);
        draw_set_alpha(1);
        draw_circle_colour(x, y, size, c_white, c_white, false);
    }
}
