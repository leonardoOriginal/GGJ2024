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

//Velocidade de lentidão ao atacar
var _velatq = 5 * sign(velh_real)
//Velocidade de lentidão para jogar a caixa
var _velcx = 2 * sign(velh_real)

//Pegando os inputs
var _esq, _dir, _pulo, _atq, _cx;

_esq	= keyboard_check(ord("A"));
_dir	= keyboard_check(ord("D"));

_atq	= keyboard_check_pressed(ord("K"));
_cx		= keyboard_check_pressed(ord("Q"));

_pulo	= keyboard_check_pressed(vk_space);

velh_real += (_dir - _esq) * forca;

//Lidando com o pulo e gravidade
if (_chao)
{
	
	velv_real = 0;

	if (_pulo)
	{
		velv_real = -forca_pulo;
	}
	
}
else
{
	velv_real += grav;
}


//Passando os valores para o o velh
velh = clamp(velh_real, -max_velh, max_velh);

//Diminuindo a velocidade do velh o velv a gravidade faz
velh_real = lerp(velh_real, 0, resistencia);

//Passando os valores para o velv
velv = clamp(velv_real, -max_velv, max_velv)


//Muda o estado dependendo do ataque, fora do switch pois pode ser mudado a qualquer horas
if (_atq)
{
	estado = "ataque";
}
else if (_cx)
{
	estado = "caixa";
}

switch(estado)
{

	case "idle":
	
	mudo_sprite(spr_player_teste);
	//image_xscale = sign(velh_real);
	
	if (_chao && _esq or _chao && _dir)
	{
		estado = "correndo";
	}
	else if (_pulo)
	{
		estado = "pulando"
	}
	
	break;
	
	
	
	case "correndo":
	
	mudo_sprite(spr_player_correndo_teste);
	image_xscale = sign(velh_real);
	
	if(!_esq && !_dir && !_pulo)
	{
		estado = "idle";
	}
	else if (_pulo)
	{
		estado = "pulando"
	}
	
	break;
	
	
	case "pulando":
	
	mudo_sprite(spr_player_pulo_teste);
	
	if (_chao && !_dir && !_esq)
	{
		estado = "idle";
	}
	else if (_chao && _esq or _chao && _dir)
	{
		estado = "correndo"
	}
	
	break
	
	
	case "ataque":
	
	velh = _velatq;
	mudo_sprite(spr_player_ataque_teste);
	
	if (image_index >= image_number - 1)
	{
		estado = "idle"
	}
	
	break;
	
	
	case "caixa":
	
	velh = _velcx;
	mudo_sprite(spr_player_caixa_teste);
	
	if (image_index >= image_number - 1)
	{
		estado = "idle";
	}
	
	break;
		
}
 
//show_debug_message(estado)