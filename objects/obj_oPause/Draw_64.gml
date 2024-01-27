var _gui_w = display_get_gui_width();
var _gui_h= display_get_gui_height();

if(pause){

	draw_set_color(c_black);
	draw_set_alpha(.8);
	draw_rectangle(0,0,_gui_w,_gui_h,false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_font(fnt_pause);
	draw_text(_gui_w/2, _gui_h/2 - 40, "JOGO PAUSADO");
	draw_set_font(fnt_pause2);
	draw_text(_gui_w/2, _gui_h/2 + 40, "Aperte 'ESC' para retornar");
	
	
	
	draw_set_font(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
	
}



