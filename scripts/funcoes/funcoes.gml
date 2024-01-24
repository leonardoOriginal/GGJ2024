// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Script1(){
	
}

function mudo_sprite(_sprite)
{
	image_speed = 1;
	//Checart se eu estou com a sprite certa
	if (sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index = 0;
	}
}