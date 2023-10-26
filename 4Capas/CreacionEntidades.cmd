@echo off
setlocal enabledelayedexpansion
(
    echo using System;
    echo using System.Collections.Generic;
    echo using System.ComponentModel.DataAnnotations;
    echo using System.Linq;
    echo using System.Threading.Tasks;
    echo using Core.Entities;
    echo.
    echo namespace Core.Entities
    echo {
    echo     public class !nombre_entidad! : BaseEntity
    echo     {
    echo         Task<T> GetByIdAsync(int id);
    echo         Task<IEnumerable<T>> GetAllAsync();
    echo         Task<(int totalRegistros, IEnumerable<T> registros)> GetAllAsync(int pageindex, int pageSize);
    echo         IEnumerable<T> Find(Func<T, bool> predicate);
    echo         void Add(T entity);
    echo         void AddRange(IEnumerable<T> entities);
    echo         void Update(T entity);
    echo         void Delete(T entity);
    echo         void DeleteRange(IEnumerable<T> entities);
    echo     }
    echo }
) >> Core\Interfaces\IGenericRepository.cs

REM Pregunta al usuario por el número de entidades
set /p "num_entidades=Introduce el número de entidades: "

REM Ciclo para crear las entidades
set "count=0"
:loop
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    
    REM Crea la entidad en Core\Entities
    echo.>Core\Entities\!nombre_entidad!.cs

    REM Crea la interfaz en Core\Interfaces
    echo.>Core\Interfaces\I!nombre_entidad!.cs

    REM Crea el controlador en API\Controllers
    echo.>API\Controllers\!nombre_entidad!Controller.cs

    REM Crea el Dto en API\Dtos
    echo.>API\Dtos\!nombre_entidad!Dto.cs

    REM Agrega código al archivo recién creado en Core\Entities\!nombre_entidad!.cs
    (
        echo using System;
        echo using System.Collections.Generic;
        echo using System.ComponentModel.DataAnnotations;
        echo using System.Linq;
        echo using System.Threading.Tasks;
        echo.
        echo namespace Core.Entities
        echo {
        echo     public class !nombre_entidad! : BaseEntity
        echo     {
        echo         // Aquí va tu código adicional o personalizado.
        echo     }
        echo }
    ) >> Core\Entities\!nombre_entidad!.cs

    set /a "count+=1"
    goto :loop
)