drop function f_ds_requerimento_online
go 


/* teste git */ 

create function f_ds_requerimento_online (@nr_requerimento  integer)
returns varchar(20000)
as
/* Retorna a descrição de um requerimento, reportando passo a passo
   as respostas do requerente com o assistente virtual
*/

declare @id                integer,
        @dt_historico      datetime,
        @tp_historico      char(3),
        @ds_de             varchar(20),
        @ds_requerimento   varchar(20000),
        @ds_data           varchar(20),
        @ds_historico      varchar(20000)

        
select @ds_requerimento = '<p>'        

declare cursor_requerimento cursor for
   select rh.id,
          rh.dt_historico,
          rh.tp_historico,
          convert(varchar(20000), rh.ds_historico)
   from requerimento_historico rh
   where rh.requerimento_id   = @nr_requerimento
     and rh.tp_historico     in ('NAV','NAL')
   order by rh.id  
for read only 
   
open cursor_requerimento

fetch cursor_requerimento into @id, @dt_historico, @tp_historico, @ds_historico

while (@@sqlstatus = 0)
   begin
      -- converte a data para string 
      if @tp_historico = 'NAV' 
         select @ds_de = 'Atendente -> '
      else
         select @ds_de = 'Aluno -> '
         
      select @ds_data = dbo.f_data_para_string ('dd/mm/yyyy hh:mi', @dt_historico)

      select @ds_historico    = @ds_data + ' : ' + @ds_de + @ds_historico
      
      select @ds_requerimento = @ds_requerimento + '</p><p>' + @ds_historico 
      
      fetch cursor_requerimento into @id, @dt_historico, @tp_historico, @ds_historico
   end

select @ds_requerimento = @ds_requerimento + '</p>'        

close cursor_requerimento

return @ds_requerimento
go

grant exec on f_ds_requerimento_online to grupo_sistema
go




