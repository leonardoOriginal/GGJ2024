/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Inherit the parent event
event_inherited();



var _chao = instance_place(x, y + 1, obj_chao);


if(!_chao)
{
	velv += grav;
}
else if (_chao && controle)
{
	velv = 0;
	velh = 0;
	estado = "abrindo";
}


switch(estado)
{
	case "abrindo":
	
	mudo_sprite(spr_caixa_abrindo);
		
	if(abrir_timer > 0)
	{
		abrir_timer--;
	}
	else if (abrir_timer <= 0)
	{
		controle = false;
		estado = "abri";
	}
		
	break;
	
	
	case "abri":
		
		//mudo_sprite(spr_caixa_aberta);
		
		
		if (sprite_index != spr_caixa_aberta)
		{
			mudo_sprite(spr_caixa_aberta);
		}
		
		
		//Se eu terminei a animação, eu me destruo
		if (image_index >= image_number - 1)
		{
			global.obj_spawn = true;
			global.qtd = choose(1, 10, 666, 3, 4, 6, 20);
			instance_destroy();
		}
		
		
	break;
}

//show_debug_message(estado);