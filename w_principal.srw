$PBExportHeader$w_principal.srw
forward
global type w_principal from window
end type
type mdi_1 from mdiclient within w_principal
end type
end forward

global type w_principal from window
integer width = 4521
integer height = 2688
boolean titlebar = true
string menuname = "m_menu_1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
mdi_1 mdi_1
end type
global w_principal w_principal

type variables
integer ii_menu


//chega de comentários
end variables

on w_principal.create
if this.MenuName = "m_menu_1" then this.MenuID = create m_menu_1
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_principal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;long ll_x, ll_y, ll_h, ll_w

//comentário Telma

ii_menu = 1

OpenSheet (w_menu_principal,w_principal)

ll_x = this.workspacex ( )
ll_y = this.workspacey ( )
ll_h = this.workspaceheight ( )
ll_w = this.workspacewidth ( )

w_menu_principal.x=ll_x + 5000
w_menu_principal.y=0

w_menu_principal.width=1559
w_menu_principal.height=112

messagebox ('teste', 'teste mudando no Franco')
end event

event resize;long ll_x, ll_y, ll_h, ll_w


ll_x = this.workspacex ( )
ll_y = this.workspacey ( )
ll_h = this.workspaceheight ( )
ll_w = this.workspacewidth ( )

if isvalid(w_menu_principal) then
	w_menu_principal.x=ll_h+1720
	w_menu_principal.y=0
	
	w_menu_principal.width=1559
	w_menu_principal.height=112
end if
end event

type mdi_1 from mdiclient within w_principal
long BackColor=268435456
end type

