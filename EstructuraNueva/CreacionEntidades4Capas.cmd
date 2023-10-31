:entidades_cuatro_capas
REM Pregunta al usuario por el número de entidades
set /p "num_entidades=Introduce el numero de entidades: "
REM Ciclo para crear las entidades
set "count=0"
:loop2
echo "!ubicacion3!"
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    REM Crea la entidad en Core\Entities
    echo.>!ubicacion3!Domain\Entities\!nombre_entidad!.cs
    REM Crea la interfaz en Core\Interfaces
    echo.>!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs
    REM Crea el controlador en API\Controllers
    echo.>!ubicacion3!API\Controllers\!nombre_entidad!Controller.cs
    REM Crea el Dto en API\Dtos
    echo.>!ubicacion3!API\Dtos\!nombre_entidad!Dto.cs
    REM Crea los Respositorios API/Repository
    echo.>!ubicacion3!Aplication\Repository\!nombre_entidad!Repository.cs
    REM Agrega código al archivo recién creado en Core\Interfaces\I!nombre_entidad!Repository
    echo using System;>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.Collections.Generic;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.Linq;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.Threading.Tasks;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo using Domain.Entities;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo. >>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo namespace Domain.Interfaces>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo { >>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo     public interface I!nombre_entidad!Repository:IGenericRepository^<!nombre_entidad!^> >> "!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo     {>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo     }>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo } >>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Collections.Generic;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Linq;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Threading.Tasks;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo. >>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo namespace Domain.Entities>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo {>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo     public class !nombre_entidad! : BaseEntity>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo     {>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo         // Aquí va tu código adicional o personalizado.>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo     }>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo }>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    pause
    set /a "count+=1"
    goto :loop2
)