/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region Colisão

//Fazendo a colisão horizontal
//Checando se estou colidindo com a parede
var _col	= instance_place(x + velh, y, obj_chao);
//Se eu colidir eu grudo em quem colidi
if (_col)
{
	//checando se eu estou indo para a direita
	if (velh > 0)
	{
		//Grundando na parte esquerda da parede
		x = _col.bbox_left + (x - bbox_right);
	}
	
	//Checando se eu estou indo para a esquerda
	if (velh < 0)
	{
		x = _col.bbox_right + (x - bbox_left);
	}
	
	//uma vez que eu colidi, não importa o lado, eu paro
	velh = 0;
}

x += velh;

var _col	= instance_place(x, y + velv, obj_chao);
if (_col)
{
	if (velv > 0)
	{
		//Indo para baixo
		y = _col.bbox_top + (y - bbox_bottom);
	}
	if (velv < 0)
	{
		//indo para cima
		y = _col.bbox_bottom + (y - bbox_top);
	}
	
	velv = 0;
}

y += velv;


#endregion


var _chao = instance_place(x, y + 1, obj_chao);
var _vir = sign(obj_player.x - x);

pode_caixa_bb -= 1;

switch(estado)
{
	//Inicia a room e pensa
	case "pensando":
	
	mudo_sprite(spr_bb_idle);
	velh = 0;
	tempo_decidir-= 1;
	tempo_correr = room_speed * 4;
	pular = true;
	esmagar = false;
	cair = false;
	
	image_xscale = _vir;
	
	if (_chao)
	{
		if (tempo_decidir <= 0)
		{
			if (pode_caixa_bb > 0)
			{
				estado = choose("correndo", "pulo")
			}
			else if (pode_caixa_bb <= 0)
			{
				estado = choose("correndo", "pulo", "caixa")
			}
		}
	}
	else
	{
		velv += grav;
	}
	
	break;
	
	
	//Persegue o player
	case "correndo":
	
	image_xscale = _vir;
	mudo_sprite(spr_bb_run);
	tempo_correr -= 1

	if (tempo_correr > 0 )
	{
		if (distance_to_object(obj_player) < distance)
		{
			velh = _vir * vel;
		}
		
		if (distance_to_object(obj_player) < 100)
		{
			velh = 0;
			estado = "ataque";
		}
	}
	else if (tempo_correr <= 0)
	{
		//Resetando tempo
		tempo_decidir = room_speed * 3;
		
		estado = "pensando";
	}
	
	break;
	
	
	//Ataca o player
	case "ataque":
	
	velh = 0;
	mudo_sprite(spr_bb_ataque);
	
	if (image_index >= image_number)
	{
		//Resetandoo tempo
		tempo_decidir = room_speed * 3;
		tempo_correr = room_speed * 4;
		
		estado = "pensando"
	}
	
	break;
	
	
	//Joga a caixa
	case "caixa":
	
	estado = "caixa"
	velh = 0;
	mudo_sprite(spr_bb_caixa);
	
	if (image_index >= image_number)
	{
		//Jogando a caixa
		var _caixa = instance_create_layer(x, y - 20, "projeteis", obj_cx);
		_caixa.velh = 20 * image_xscale;
		_caixa.velv = -20;
		
		//Resetandoo tempo
		tempo_decidir = room_speed * 3;
		pode_caixa_bb = room_speed * 5;
		
		estado = "pensando"
	}
	
	break;
	
	
	//Pula no player
	case "pulo":
	
	if(tempo_pulo > 0)
	{
		if(!cair)
		{
			mudo_sprite(spr_bb_pulando);
			y -= pulo * 2;
		} 
		else
		{
			y += pulo;
		}
	
		if(y < obj_player.y - altura_maxima){
			//show_message("Altura máxima caindo");
			cair = true;
		}
	
		x += sign((obj_player.x - x)) * 8;
	
		if (x < obj_player.x + 10 and x > obj_player.x - 10)
		{
			//show_message("Testee");
			esmagar = true;
			pular = false
			
		}
	}
	else if (tempo_pulo <= 0 )
	{
		velv = 0;
		velh = 0;
		pular = true;
		esmagar = false;
		cair = false;
		estado = "pensando"
		tempo_decidir = room_speed * 3;
		tempo_pulo = choose((room_speed *.1), (room_speed *.05), (room_speed * .12), (room_speed * .11));
	}

	if(esmagar){
		velv += pulo * 2;	
		mudo_sprite(spr_bb_caindo);
		
		if (_chao)
		{
			velv = 0;
			pular = true;
			esmagar = false;
			cair = false;
			tempo_pulo -= 1;
		}
	}
	
	break;
}