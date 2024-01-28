/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Estado idle/correndo/ataque/caixa
estado = "pensando" //pensando/correndo/atacando/caixa/pulando

//Isso vai mover o inimigo
velh = 0;
velv = 0;
vel  = 4;

grav = 0.5;
distance = 100000;

pulo = 7;
altura_maxima = 1000;

pular = true;
esmagar = false;
cair = false;

morto = false;
dano = false;

tempo_decidir	= room_speed * 1.5;
pode_caixa_bb	= room_speed * 5;
tempo_correr	= room_speed * 4;
tempo_pulo		= choose((room_speed *.1), (room_speed *.05), (room_speed * .12), (room_speed * .11));