
var _list = ds_list_create();

num = collision_rectangle_list(x, y, x + sprite_width, y + sprite_height, obj_ani_dragged_pai, false, true, _list, false)
+ collision_rectangle_list(x, y, x + sprite_width, y + sprite_height, obj_ani_pai, false, true, _list, false);

//show_debug_message(_num);

ds_list_destroy(_list);