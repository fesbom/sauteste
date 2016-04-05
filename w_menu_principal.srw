$PBExportHeader$w_menu_principal.srw
forward
global type w_menu_principal from window
end type
type ddplb_1 from dropdownpicturelistbox within w_menu_principal
end type
end forward

global type w_menu_principal from window
integer width = 1559
integer height = 112
boolean border = false
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ddplb_1 ddplb_1
end type
global w_menu_principal w_menu_principal

on w_menu_principal.create
this.ddplb_1=create ddplb_1
this.Control[]={this.ddplb_1}
end on

on w_menu_principal.destroy
destroy(this.ddplb_1)
end on

type ddplb_1 from dropdownpicturelistbox within w_menu_principal
integer y = 4
integer width = 1550
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"MÓDULO ACADÊMICO","MÓDULO FINANCEIRO"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2}
string picturename[] = {"C:\fontespb9_local\Unesc\academico.ico","C:\fontespb9_local\Unesc\orcamento\orcamento.ico"}
long picturemaskcolor = 536870912
end type

event selectionchanged;string ls_Modulo

choose case index 
	case 1
		ls_modulo = 'ACADÊMICO GRADUAÇÃO'
		
	case 2 
		ls_modulo = 'FINANCEIRO'
end choose

f_troca_menu (w_principal, ls_modulo)
end event

