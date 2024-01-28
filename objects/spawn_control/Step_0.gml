/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _alvo = obj_player;


if (global.obj_spawn)
{
	var _spawn = choose(1, 2);
	
	if (_spawn == 1)
	{
		while (global.qtd > 0)
		{
			//Decide o lugar randomicamente
			var _xlugar = choose((_alvo.x + 10), (_alvo.x - 10), (_alvo.x + 700), (_alvo.x - 700), (_alvo.x + 200), (_alvo.x - 200), (_alvo.x + 300), (_alvo.x - 300), (_alvo.x + 100), (_alvo.x - 100), (_alvo.x + 400), (_alvo.x - 400), (_alvo.x + 500), (_alvo.x - 500));
			
			var _dinamite = instance_create_layer(_xlugar, _alvo.y - 850, "projeteis", obj_dinamite);
			global.qtd --;
			
			if (global.qtd <= 0)
			{
				global.obj_spawn = false;
			}
		}
		
	}
	else if (_spawn == 2)
	{
			var _bigorna = instance_create_layer(_alvo.x, _alvo.y - 850, "projeteis", obj_bigorna);
	}
	
}



