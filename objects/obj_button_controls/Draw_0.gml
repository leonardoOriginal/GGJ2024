/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

var _gui_w = display_get_gui_width();
var _gui_h= display_get_gui_height();

if(controls_is_active){
	
	draw_set_color(c_black);
	instance_deactivate_all(true);
	draw_rectangle(0,0,_gui_w,_gui_h,false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_font(fnt_pause);
	draw_text(_gui_w/2, _gui_h/2 - 80, "Teclas de movimento: 'A' e 'D'");
	draw_text(_gui_w/2, _gui_h/2, "Teclas de ataque: 'Q' e 'K'");
	draw_text(_gui_w/2, _gui_h/2 + 80, "Aperte 'ESC' para pausar durante o jogo");
	draw_set_font(fnt_pause2);
	
	if(!instance_exists(obj_button_return_menu)){
			instance_create_depth(_gui_w / 2, _gui_h - 200, -2, obj_button_return_menu);
	}
	
	
	
	draw_set_font(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
}

	
