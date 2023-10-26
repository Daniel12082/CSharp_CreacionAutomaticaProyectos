@echo off
setlocal enabledelayedexpansion

REM Pregunta al usuario por el número de entidades
set /p "num_entidades=Introduce el numero de entidades: "

REM Ciclo para crear las entidades
set "count=0"
:loop
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    
    REM Crea la entidad en Core\Entities
    echo.>Domain\Entities\!nombre_entidad!.cs

    REM Crea la interfaz en Core\Interfaces
    echo.>Domain\Interfaces\I!nombre_entidad!Repository.cs

    REM Crea el controlador en API\Controllers
    echo.>API\Controllers\!nombre_entidad!Controller.cs

    REM Crea el Dto en API\Dtos
    echo.>API\Dtos\!nombre_entidad!Dto.cs

    REM Crea los Respositorios API/Repository
    echo.>API\Repository\I!nombre_entidad!Repository.cs

    REM Agrega código al archivo recién creado en Core\Entities\!nombre_entidad!.cs
    (
        echo using System;
        echo using System.Collections.Generic;
        echo using System.ComponentModel.DataAnnotations;
        echo using System.Linq;
        echo using System.Threading.Tasks;
        echo.
        echo namespace Domain.Entities
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