// Inherit the parent event
event_inherited();
/*
draw_text(x, y - 80 - sprite_height, "xscale: " + string(image_xscale));

draw_text(x, y - 20 - sprite_height, "estado: " + string(estado));
draw_text(x, y - 40 - sprite_height, "mov padrao: " + string(mov_padrao));
draw_text(x, y - 60 - sprite_height, "selecionado: " + string(selecionado));
//área onde consegue me selecionar
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

var c1 = mouse_check_button_pressed(mb_left);
var c2 = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
var c3 = image_blend == c_white;
var c4 = !instance_exists(obj_ani_dragged_pai);
var c5 = !instance_exists(obj_item_ostra_dragged);
var c6 = !layer_has_instance("Torres_Selecionadas", obj_ani_pai);
var c7 = !selecionado;
var c8 = timer_criado <= 0;
var c9 = !trompa_sel();
var c10 = estado != "morrendo";

draw_set_color(c_white);
draw_text(x, y + 20, "c1 (click): " + string(c1));
draw_text(x, y + 30, "c2 (mouse em mim): " + string(c2));
draw_text(x, y + 40, "c3 (cor branca): " + string(c3));
draw_text(x, y + 50, "c4 (noone drag): " + string(c4));
draw_text(x, y + 60, "c5 (!ostra drag): " + string(c5));
draw_text(x, y + 70, "c6 (noone sel): " + string(c6));
draw_text(x, y + 80, "c7 (!sel): " + string(c7));
draw_text(x, y + 90, "c8 (timer criado): " + string(c8));
draw_text(x, y + 100, "c9 (!trompa sel): " + string(c9));
draw_text(x, y + 110, "c10 (!morrendo): " + string(c10));

// Resultado final
var pode = c1 && c2 && c3 && c4 && c5 && c6 && c7 && c8 && c9 && c10;
draw_text(x, y + 130, "pode sel: " + string(pode));
