/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Estado idle/correndo/ataque/caixa
estado = "idle"

//Isso vai mover o inimigo
velh = 0;
velv = 0;

distance = 300;

pulo = 10;
altura_maxima = 1000;

pular = true; 
esmagar = false;
cair = false;
pode_pular = true;

grav = 0.50;

vel = 4;

//atacar = "parado"; //"parado" e o "perserguir"



/*
if (atacar)
{
	if (atacar)
	{
		velh = choose(vel, -vel);
	}
	else
	{
		velh = 0;
	}
}
*/

tempo_decidir = room_speed * 1.5;
pode_caixa_bb	= room_speed * 5;