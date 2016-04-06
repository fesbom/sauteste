create trigger ti_atividade_seminario
on atividade_seminario
for insert
as 
 
declare @nr_linhas  integer

select @nr_linhas  = @@rowcount

if @nr_linhas = 0 
   return


/* Gera log de movimentação */
insert log_atividade_seminario
   select suser_name(), getdate(), "I", *
from inserted


return
