/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Estado idle/correndo/ataque/caixa
estado = "idle"


//Isso vai mover o player
velh = 0;
velv = 0;

dano = false;

//Sistema de vida
posso_perder_vida = true;
tempo_dano	= room_speed * 0.5;
timer_dano	= 0;
inv_tempo	= room_speed * 1.5;
inv_timer	= 0;

//Esses caras que vão guardar a força que eu apliquei neles
velh_real = 0;
velv_real = 0; 


//Velocidade limite de movimentação
max_velh = 20;
max_velv = 35;

grav = 2;



//Força que aplico na movimentação dele
forca = 2.2;
forca_pulo = 25;


resistencia = 0.15;
