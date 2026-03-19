//if(room != rm_album && room != rm_init && room != rm_mapa && room != rm_menu && room != rm_IntroTutorial && room != rm_SeqTutorial)
//{
//	//desenhando meu grid
//	var _w = 1;
//	
//	draw_set_color(c_ltgray);
//	draw_set_alpha(.33);
//	for (var i = 0; i < room_height; i += 32)
//	{
//		draw_line_width(0, i, room_width, i, _w);
//	}
//	for (var i = 0; i < room_width; i += 32)
//	{
//		draw_line_width(i, 0, i, room_height, _w);
//	}
//	draw_set_color(-1);
//	draw_set_alpha(1);
//}