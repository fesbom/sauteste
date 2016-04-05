$PBExportHeader$w_acad_1.srw
forward
global type w_acad_1 from window
end type
type st_1 from statictext within w_acad_1
end type
end forward

global type w_acad_1 from window
integer width = 3538
integer height = 1700
boolean titlebar = true
string title = "teste"
string menuname = "m_menu_1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
st_1 st_1
end type
global w_acad_1 w_acad_1

on w_acad_1.create
if this.MenuName = "m_menu_1" then this.MenuID = create m_menu_1
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_acad_1.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
end on

event open;window activesheet

activesheet = w_principal.GetActiveSheet( )

if IsValid(activesheet) then
	this.x=activesheet.x+100
	this.y=activesheet.y+100
else
	this.x=1	
	this.y=1
end if

end event

type st_1 from statictext within w_acad_1
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
string text = "Opção 1 do Acadêmico"
boolean focusrectangle = false
end type

