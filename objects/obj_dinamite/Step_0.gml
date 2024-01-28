/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

var _chao = instance_place(x, y + 1, obj_chao);

switch (estado)
{
	case "idle":
	
	if (!_chao)
	{
		estado = "caindo";
	}
	
	break;
	
	
	//Caindo
	case "caindo":
	
	mudo_sprite(spr_dinamite_caindo)
	velv += grav;
	
	if (_chao)
	{
		//Talvez eu pule direto pra explosão
		estado = choose("ativo", "explosao")
	}
	
	break;
	
	
	//Ativando
	case "ativo":
	
	mudo_sprite(spr_dinamite_idle)
	
	tempo_explodir --;
	
	if (tempo_explodir <= 0)
	{
		estado = "explosao";
	}
	
	break;
	
	
	//Explodo
	case "explosao":
	
	if (sprite_index != spr_explosao)
	{
		mudo_sprite(spr_explosao);
	}
		
	//Se eu terminei a animação, eu me destruo
	if (image_index >= image_number - 1)
	{
		instance_destroy();
	}
	
	break;
}
