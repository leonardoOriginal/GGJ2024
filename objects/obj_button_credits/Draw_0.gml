/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


event_inherited();

var _gui_w = display_get_gui_width();
var _gui_h= display_get_gui_height();

if(credits_is_active){

	draw_set_color(c_black);
	instance_deactivate_all(true);
	draw_rectangle(0,0,_gui_w,_gui_h,false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_font(fnt_pause);
	draw_text(_gui_w/2, _gui_h/2 - 300, "A Lenda do Sapo");
	
	draw_text(_gui_w/2, _gui_h/2 - 140, "Programadores");
	draw_set_font(fnt_pause2);
	draw_text(_gui_w/2, _gui_h/2 - 60, "Leonardo");
	draw_text(_gui_w/2, _gui_h/2, "Cláudio");
	draw_set_font(fnt_pause);
	draw_text(_gui_w/2, _gui_h/2 + 100, "Artistas");
	draw_set_font(fnt_pause2);
	draw_text(_gui_w/2, _gui_h/2 + 180, "Thiago");
	draw_text(_gui_w/2, _gui_h/2 + 240, "Guilherme");
	
	
	if(!instance_exists(obj_button_return_menu)){
			instance_create_depth(_gui_w / 2, _gui_h - 200, -2, obj_button_return_menu);
	}
	
	
	draw_set_font(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
}


