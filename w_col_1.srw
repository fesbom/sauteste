$PBExportHeader$w_col_1.srw
forward
global type w_col_1 from window
end type
type st_1 from statictext within w_col_1
end type
end forward

global type w_col_1 from window
integer width = 3566
integer height = 1724
boolean titlebar = true
string title = "Untitled"
string menuname = "m_menu_3"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
end type
global w_col_1 w_col_1

on w_col_1.create
if this.MenuName = "m_menu_3" then this.MenuID = create m_menu_3
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_col_1.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
end on

type st_1 from statictext within w_col_1
integer x = 535
integer y = 484
integer width = 1970
integer height = 196
integer textsize = -24
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Opção 1 do Colégio Aplicação"
boolean focusrectangle = false
end type

