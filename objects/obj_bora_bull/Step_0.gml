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
	//Vou diminuir o tempo de decidir andar
	tempo_decidir -= 1;
	
	//Se o tempo acabou, eu decido se eu vou andar
	if (tempo_decidir <= 0)
	{
		andando = choose(true, false);
		
		//Escolhendo a direção se ele decidiu andar
		if (andando)
		{
			velh = choose(vel, -vel);
		}
		else
		{
			velh = 0;
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
else
{
	estado = choose("idle", "ataque");
}


//estado = choose("idle", "correndo");

switch(estado)
{
	case "idle":
	
	mudo_sprite(spr_inimigo_teste);
	
	break;
	
	
	case "correndo":
	
	mudo_sprite(spr_inimigo_run_teste);
	
	break;
	
	
	case "ataque":
	
	mudo_sprite(spr_inimigo_ataque_teste);
	
	if (image_index >= image_number - 1)
	{
		estado = "idle"
	}
	
	break;
}
