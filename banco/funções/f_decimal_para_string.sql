drop function f_decimal_para_string
go 

create function f_decimal_para_string (@nr_decimais  smallint,
                                       @vl_numero    numeric(19,6))
returns varchar(50)
as

/* Função retorna um decimal formatado em string */

declare @ds_inteiro  varchar(50),
        @ds_numero   varchar(50),
        @ds_aux      varchar(50),
        @vl_decimal  integer,
        @vl_inteiro  integer,       
        @nr_ponto    smallint

        
/* determina onde está o ponto decimal */        
select @ds_numero = convert(varchar(50), @vl_numero)

select @nr_ponto = charindex('.', @ds_numero)

/* parte inteira e decimal */
select @vl_inteiro = convert(integer, substring(@ds_numero, 1, @nr_ponto - 1)),
       @vl_decimal = convert(integer, substring(@ds_numero, @nr_ponto + 1, 50))
       
if isnull(@vl_inteiro, 0) = 0 
   select @vl_inteiro = 0

if isnull(@vl_decimal, 0) = 0
   select @vl_decimal = 0   
        
select @ds_aux = substring(convert(varchar(20), @vl_decimal), 1, @nr_decimais)

select @ds_numero = convert(varchar(50), @vl_inteiro) + ',' + @ds_aux
       
return @ds_numero
go

grant exec on f_decimal_para_string to grupo_sistema
go
