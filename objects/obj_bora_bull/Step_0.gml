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


if(_chao)
{
	//Vou diminuir o tempo de decidir atacar
	tempo_decidir -= 1;
	//Vou diminuir o tempo de poder usar a caixa
	pode_caixa_bb -= 1;
	
	//Se o tempo acabou, eu decido se eu vou atacar
	if (tempo_decidir <= 0)
	{
		atacar = choose("parado", "perseguir");
		
		//Escolhendo a direção se ele decidiu andar
		if (atacar == "parado")
		{
			
			if (pode_caixa_bb > 0)
			{
				velh = 0;
				estado = "pulo";
			}
			else if (pode_caixa_bb <= 0)
			{
				velh = 0;
				estado = choose("caixa", "pulo");
			}
		}
		else if (atacar == "perseguir")
		{
			//velh = choose(vel, -vel);
			if distance_to_object(obj_player) < distance
			{
				estado = "correndo";
			}
		}
		
		//Resetandoo tempo
		tempo_decidir = room_speed * 3;
	}
}
else
{
	velv += grav;
}



if(velh != 0)
{
	estado = "correndo";
	image_xscale = sign(velh);
}


//estado = choose("idle", "correndo");

switch(estado)
{
	case "idle":
	
	mudo_sprite(spr_inimigo_teste);
	
	break;
	
	
	case "correndo":
	
	mudo_sprite(spr_inimigo_run_teste);
	
	var _vir = sign(obj_player.x - x);
	velh = _vir * vel;
	
	if (distance_to_object(obj_player)) > distance
	{
		estado = "idle";
	}
	else if (distance_to_object(obj_player)) < 100
	{
		estado = "ataque";
	}
	
	/*
	if ( velh == 0)
	{
		estado = "idle"
	}
	*/
	
	break;
	
	
	case "ataque":
	
	velh = 0;
	mudo_sprite(spr_inimigo_ataque_teste);
	
	if (image_index >= image_number - 1)
	{
		estado = "idle"
	}
	
	break;
	
	
	case "pulo":
	
	velv += pulo;
	mudo_sprite(spr_teste_bb_pulo);
	//show_message("deveria pular")
	
	/*
	if (_chao && velh == 0)
	{
		estado = "idle";
	}
	else if (_chao && velh != 0)
	{
		estado = "correndo"
	}
	*/
	
	
	break;
	
	
	case "caixa":
	
	mudo_sprite(spr_teste_bora_bull_caixa)
	
	if (image_index >= image_number - 1)
	{
		pode_caixa_bb = room_speed * 5;
		estado = "idle"
	}
	
	break ;
}
