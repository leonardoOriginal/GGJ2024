/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Estado idle/correndo/ataque/caixa
estado = "idle"

//Isso vai mover o player
velh = 0;
velv = 0;

grav = 2;

vel = choose(4, -4);

andando = choose(true, false);

/*
if (andando)
{
	if (andando)
	{
		velh = choose(vel, -vel);
	}
	else
	{
		velh = 0;
	}
}
*/

tempo_decidir = room_speed * 3;