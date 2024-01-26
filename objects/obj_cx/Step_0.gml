/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Inherit the parent event
event_inherited();



var _chao = instance_place(x, y + 1, obj_chao);


if(!_chao)
{
	velv = grav;
}
else
{
	estado = "abrindo";
}


switch(estado)
{
	case "abrindo":
	
		mudo_sprite(spr_caixa_idle);
		
		if(abrir_timer > 0)
		{
			abrir_timer--;
		}
		else
		{
			estado = "abriu";
		}
		
	break;
	
	
	case "abriu":
		
		mudo_sprite(spr_caixa_idle);
		
		/*
		if (sprite_index != spr_cx_aberta_teste)
		{
			mudo_sprite(spr_cx_aberta_teste);
		}
		*/
		
		//Se eu terminei a animação, eu me destruo
		/*if (image_index >= image_number - 1)
		{
			instance_destroy();
		}
		*/
		
	break;
}

//show_debug_message(estado);