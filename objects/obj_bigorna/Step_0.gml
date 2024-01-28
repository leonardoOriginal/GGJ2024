/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

var _chao = instance_place(x, y + 1, obj_chao);


if (!_chao)
{
	velv += grav;
}
else if (_chao && tempo_sumir <= 0)
{
	instance_destroy();
}
else if (_chao && tempo_sumir > 0)
{
	tempo_sumir --;
}