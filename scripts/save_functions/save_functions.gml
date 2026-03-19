
//overall save
function save_game(){
	
	var _saveArray = array_create(0);
	
	//save the room you're in
	//save_room();
	
	//set and save
	global.statData.save_rm = rm_mapa;
	
	global.statData.moedas = global.moedas;
	global.statData.peixesTrancados = global.TrancadoPeixe;
	global.statData.especiaisTrancados = global.TrancadoEspecial;
	global.statData.cartasTrancados = global.TrancadoCarta;
	global.statData.inimigosTrancados = global.TrancadoInimigo;
	global.statData.nivelPeixes = global.LVpeixes;
	global.statData.ultimaFase = global.UltimaFase;
	global.statData.etapasTutorial = global.tutorial;
	global.statData.tutorialAtivo = global.tutorial_ativo;
	
	array_push(_saveArray, global.statData);
	
	//save all the room data
	//array_push(_saveArray, global.leveldata);
	
	//Actual Save
	var _filename = "savedata.sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, + 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	
	buffer_delete(_buffer);
	
	
}

function load_game(){
	//loading our save data
	var _filename = "savedata.sav";
	
	if !file_exists(_filename){exit;};
	
	//load the buffer, get the json and delete the buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer,buffer_string);
	buffer_delete(_buffer);
	
	//unstrigfy and get the data array
	var _loadArray = json_parse(_json);
	
	//set the data in our game to match  our loaded data
	global.statData = array_get(_loadArray, 0);
	//global.leveldata = array_get(_loadArray, 1);
	
	global.moedas = global.statData.moedas;
	global.TrancadoPeixe = global.statData.peixesTrancados;
	global.TrancadoEspecial = global.statData.especiaisTrancados;
	global.TrancadoCarta = global.statData.cartasTrancados;
	global.TrancadoInimigo = global.statData.inimigosTrancados;
	global.LVpeixes = global.statData.nivelPeixes;
	global.UltimaFase = global.statData.ultimaFase;
	global.tutorial = global.statData.etapasTutorial;
	global.tutorial_ativo = global.statData.tutorialAtivo;

	//use the new data to get back to where we were in the game
		//go to correct room
		//var _loadRoom = asset_get_index(global.statData.save_rm);
		
		Transition(TRANS_MODE.GOTO,rm_mapa);
		
		draw_set_font(FontJogo);
		
		Obj_saveload.skipRoomSave = true;
		

}


