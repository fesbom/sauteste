$PBExportHeader$n_teste_menu.sru
$PBExportComments$Generated COM/MTS Component
forward
global type n_teste_menu from nonvisualobject
end type
end forward

global type n_teste_menu from nonvisualobject descriptor "PB_ObjectCodeAssistants" = "{BB0DD547-B36E-11D1-BB47-000086095DDA}" 
event activate pbm_component_activate
event deactivate pbm_component_deactivate
end type
global n_teste_menu n_teste_menu

on n_teste_menu.create
TriggerEvent( this, "constructor" )
end on

on n_teste_menu.destroy
TriggerEvent( this, "destructor" )
end on

