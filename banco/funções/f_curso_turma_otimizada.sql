drop function f_curso_turma_otimizada
go 

create function f_curso_turma_otimizada (@cd_disciplina integer,
                                         @cd_turma      smallint,
                                         @ano           char(4),
                                         @semestre      tinyint)
returns varchar(255)
as

--teste alteração telma

-- refs #24384 : proc para retornar os vários cursos de uma disciplina que foi orimizada

declare @nm_curso   varchar(500),
        @nm_curso_w varchar(80)

select @nm_curso = ''

if exists (select *
           from disciplina_otimizada
           where cd_disciplina_otimizada  = @cd_disciplina
             and cd_turma_otimizada       = @cd_turma
             and ano                      = @ano
             and semestre                 = @semestre)
   begin
      if exists (select *
                 from movto_turma mt
                 where cd_disciplina   = @cd_disciplina
                   and cd_turma        = @cd_turma
                   and ano             = @ano
                   and semestre        = @semestre)
         begin
            declare cursor_curso_1 cursor for
                select distinct h.nm_habilitacao + ' (' + h.periodo + ')'
            from disciplina_otimizada d, movto_turma mt, habilitacao h
            where d.cd_disciplina_otimizada  = @cd_disciplina
              and d.cd_turma_otimizada       = @cd_turma
              and d.ano                      = @ano
              and d.semestre                 = @semestre
              and mt.cd_disciplina           = d.cd_disciplina
              and mt.cd_turma                = d.cd_turma
              and mt.ano                     = d.ano
              and mt.semestre                = d.semestre
              and h.cd_departamento          = mt.cd_departamento
              and h.cd_curso                 = mt.cd_curso
              and h.cd_habilitacao           = mt.cd_habilitacao
            order by  h.nm_habilitacao + ' (' + h.periodo + ')' 
            for read only 
            
            open cursor_curso_1

            fetch cursor_curso_1 into @nm_curso_w

            while (@@sqlstatus = 0)
               begin
                  if char_length(@nm_curso) <= 1
                     select @nm_curso = @nm_curso_w
                  else
                     select @nm_curso = ', ' + @nm_curso
                  
                  fetch cursor_curso_1 into @nm_curso_w
               end
               
            close cursor_curso_1
            
            -- incluir a própria disciplina ofertada
            select @nm_curso_w = h.nm_habilitacao + ' (' + h.periodo + ')'
            from movto_turma mt, habilitacao h
            where mt.cd_disciplina           = @cd_disciplina
              and mt.cd_turma                = @cd_turma
              and mt.ano                     = @ano
              and mt.semestre                = @semestre
              and h.cd_departamento          = mt.cd_departamento
              and h.cd_curso                 = mt.cd_curso
              and h.cd_habilitacao           = mt.cd_habilitacao           

            select @nm_curso = @nm_curso_w + ', ' + @nm_curso  
         end        
      else
         begin
            declare cursor_curso_2 cursor for
                select distinct h.nm_habilitacao + ' (' + h.periodo + ')'
            from disciplina_otimizada d, turma t, habilitacao h
            where d.cd_disciplina_otimizada  = @cd_disciplina
              and d.cd_turma_otimizada       = @cd_turma
              and d.ano                      = @ano
              and d.semestre                 = @semestre
              and t.cd_disciplina            = d.cd_disciplina
              and t.cd_turma                 = d.cd_turma
              and t.ano                      = d.ano
              and t.semestre                 = d.semestre
              and h.cd_departamento          = t.cd_departamento
              and h.cd_curso                 = t.cd_curso
              and h.cd_habilitacao           = t.cd_habilitacao
            order by  h.nm_habilitacao + ' (' + h.periodo + ')' 
            for read only 
            
            open cursor_curso_2

            fetch cursor_curso_2 into @nm_curso_w

            while (@@sqlstatus = 0)
               begin
                  if char_length(@nm_curso) <= 1
                     select @nm_curso = @nm_curso_w
                  else
                     select @nm_curso = @nm_curso + ', ' + @nm_curso_w
                  
                  fetch cursor_curso_2 into @nm_curso_w
               end
               
            close cursor_curso_2   
            
            -- incluir a própria disciplina ofertada
            select @nm_curso_w = h.nm_habilitacao + ' (' + h.periodo + ')'
            from turma t, habilitacao h
            where t.cd_disciplina            = @cd_disciplina
              and t.cd_turma                 = @cd_turma
              and t.ano                      = @ano
              and t.semestre                 = @semestre
              and h.cd_departamento          = t.cd_departamento
              and h.cd_curso                 = t.cd_curso
              and h.cd_habilitacao           = t.cd_habilitacao           

            select @nm_curso = @nm_curso_w + ', ' + @nm_curso  
         end
   end 
else
   begin
      select @nm_curso = h.nm_habilitacao + ' (' + h.periodo + ')'
      from turma t, habilitacao h
      where t.cd_disciplina            = @cd_disciplina
        and t.cd_turma                 = @cd_turma
        and t.ano                      = @ano
        and t.semestre                 = @semestre
        and h.cd_departamento          = t.cd_departamento
        and h.cd_curso                 = t.cd_curso
        and h.cd_habilitacao           = t.cd_habilitacao
   end
   
 
return @nm_curso
go

grant exec on f_email_pessoa to grupo_sistema
go
