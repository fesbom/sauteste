$PBExportHeader$teste_menu.sra
$PBExportComments$Generated Application Object
forward
global type teste_menu from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables
global type teste_menu from application
string appname = "teste_menu"
end type
global teste_menu teste_menu

on teste_menu.create
appname="teste_menu"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on teste_menu.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_principal)
end event

