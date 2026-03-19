//lista de mensagens ativas
if(!global.tutorial_ativo && ds_exists(mensagens_ativas, ds_type_list))
{
	ds_list_destroy(mensagens_ativas);
}

if(audio_is_playing(explosao_perolas__cortado_))
{
	audio_stop_sound(explosao_perolas__cortado_);
}