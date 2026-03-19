if(screen_pause() == true)
{
	exit;
}

//se não tenho dona
if(!instance_exists(torre_dona))
{
	instance_destroy(); //me destruo
	exit;
}

//criando _cavalo
timer_cria++;

var _mod = random_range(-8, 8);

if(timer_cria >= 150)
{
	timer_cria = 0;
}
else if(timer_cria >= 1)
{
	if(random_range(0, 100) <= 5)
	{
		var _cavalo = instance_create_layer(x + _mod, y - sprite_height + _mod, "Projeteis", obj_ani_cavalo);
		_cavalo.vel_flutua = 1;
		_cavalo.encolhimento = 0.01;
		_cavalo.tempo_vida = 60;
		_cavalo.pai = id;
	}
}

//atualizando minha posição
x = torre_dona.x + torre_dona.sprite_width / 2;
y = torre_dona.y - torre_dona.sprite_height / 2;

//FUNÇÃO LOCAL: POSSO SELECIONAR?
function posso_selecionar()
{
	return mouse_check_button_pressed(mb_left) //clicou com o esquerdo
		&& position_meeting(mouse_x, mouse_y, torre_dona) //cursor em mim
		&& torre_dona.image_blend == c_white //cor padrão
		&& !instance_exists(obj_ani_dragged_pai) //nenhuma torre dragged
		&& !instance_exists(obj_item_ostra_dragged) //nenhuma pá dragged
		&& !layer_has_instance("Torres_Selecionadas", obj_ani_pai) //nenhuma torre selecionada
		&& !selecionado //eu não estou selecionado
		&& obj_trompa_pai.selecionado == false;
}

//verificando se clicou na torre
if(posso_selecionar())
{
	selecionado = true; //fico selecionado
	layer_add_instance("Torres_Selecionadas", torre_dona); //vou pra camada das torres selecionadas
}

//se to selecionado E num slot vazio E clicar com direito ou soltar o esquerdo do mouse
if(selecionado && torre_dona.image_blend == c_white && mouse_check_button_pressed(mb_right) && obj_trompa_pai.selecionado == false)
{
	selecionado = false; //deixo de estar selecionado
	layer_add_instance("Torres", torre_dona); //volto pra camada comum das torres
}

//se não estou selecionado, não mostro opções
if(!selecionado) exit;

//SE ESTOU SELECIONADO:
//calculando posições possíveis
offsets = calcular_movimentos_L(torre_dona.x, torre_dona.y - torre_dona.sprite_height);
hover_index = -1;

//checando se o mouse está sobre alguma opção
for(var i = 0; i < array_length(offsets); i++)
{
	var px = offsets[i][0];
	var py = offsets[i][1];
	
	//checando se está dentro da altura permitida e se a posição está livre
	if(py >= altura_min && py <= altura_max && posicao_livre(px, py))
	{
		if(point_in_rectangle(mouse_x, mouse_y, px, py, px + 32, py + 32))
		{
			hover_index = i;
		}
	}
}

//clique = mover torre
if(mouse_check_button_released(mb_left) && hover_index != -1)
{
	var destino = offsets[hover_index];
	torre_dona.x = destino[0];
	torre_dona.y = destino[1] + 32;
	
	selecionado = false; //deixo de estar selecionado
	layer_add_instance("Torres", torre_dona); //volto pra camada comum das torres
}