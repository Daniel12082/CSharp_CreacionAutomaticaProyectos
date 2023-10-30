@echo off
setlocal enabledelayedexpansion

:menu_principal
cls
echo Menu Principal
echo 1. Creacion de Proyecto
echo 2. Creacion de Entidades
echo 3. Insertar Codigo
echo 4. Salir
set /p "opcion_menu=Seleccione una opcion: "

if "%opcion_menu%"=="1" (
    call :menu_proyecto
) else if "%opcion_menu%"=="2" (
    call :menu_entidades
) else if "%opcion_menu%"=="3" (
    call :insertar_codigo
) else if "%opcion_menu%"=="4" (
    goto :eof
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :menu_principal
)

:insertar_codigo
cls
echo Insertar Código
echo 1. Insertar Código para Proyecto de 3 Capas
echo 2. Insertar Código para Proyecto de 4 Capas
echo 3. Atras
set /p "opcion_codigo=Seleccione una opcion: "

if "%opcion_codigo%"=="1" (
    call :insertar_codigo_tres_capas
) else if "%opcion_codigo%"=="2" (
    call :insertar_codigo_cuatro_capas
) else if "%opcion_codigo%"=="3" (
    goto :menu_principal
) else (
    echo Opción no válida. Intente de nuevo.
    goto :insertar_codigo
)

:menu_proyecto
cls
echo Seleccione el tipo de proyecto que desea crear:
echo 1. Proyecto de 3 capas
echo 2. Proyecto de 4 capas
echo 3. Atras
set /p "opcion_proyecto=Introduzca 1 o 2 para seleccionar el tipo de proyecto (o 3 para volver): "

if "%opcion_proyecto%"=="1" (
    call :proyecto_tres_capas
) else if "%opcion_proyecto%"=="2" (
    call :proyecto_cuatro_capas
) else if "%opcion_proyecto%"=="3" (
    goto :menu_principal
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :menu_proyecto
)

:menu_entidades
cls
echo Seleccione el tipo de proyecto para la creacion de entidades:
echo 1. Proyecto de 3 capas
echo 2. Proyecto de 4 capas
echo 3. Atras
set /p "opcion_entidades=Introduzca 1 o 2 para seleccionar el tipo de proyecto (o 3 para volver): "

if "%opcion_entidades%"=="1" (
    call :entidades_tres_capas
) else if "%opcion_entidades%"=="2" (
    call :entidades_cuatro_capas
) else if "%opcion_entidades%"=="3" (
    goto :menu_principal
) else (
    echo Opción no válida. Intente de nuevo.
    goto :menu_entidades
)

exit /b

:proyecto_tres_capas
cls
echo Creando proyecto de 3 capas...
@echo off
setlocal enabledelayedexpansion

REM Captura la elección del usuario
set "eleccion=%errorlevel%"
REM Muestra las ubicaciones predeterminadas según el idioma
echo.
echo Ubicaciones predeterminadas:
echo 1. Descargas
echo 2. Documentos
echo 3. Escritorio
echo 4. Ubicacion Actual

REM Pregunta al usuario por la ubicación deseada
choice /c 1234 /n /m "Elija una ubicacion predeterminada (1/2/3/4): "
set "eleccion=%errorlevel%"

if !eleccion! == 3 (
    set "ubicacion=Desktop"
) else if !eleccion! == 2 (
    set "ubicacion=Documents"
) else if !eleccion! == 1 (
    set "ubicacion=Downloads"
) else (
	set "ubicacion=%cd%"
)
echo !ubicacion!

REM Muestra la ubicación seleccionada
echo.
echo Ha seleccionado "!ubicacion!" como su ubicacion predeterminada.
if not !eleccion! == 4 (
    set /p "ubicacion2=Introduce la ruta del proyecto (deje vacío para usar la ubicación predeterminada): "
)
REM Pregunta al usuario el nombre del proyecto
set /p "proyecto=Introduce el nombre de tu proyecto: "

REM Validación si la ubicación es vacía
if not defined !ubicacion2! (
	set "ubicacion=!UserProfile!\!ubicacion!\"
) else if !elecion! == 4 (
	set "ubicacion=!ubicacion!"
) else (
    set "ubicacion=!UserProfile!\!ubicacion!\!ubicacion2!\"
)
echo !ubicacion!
REM Crea el directorio del proyecto en la ubicación especificada
cd "!ubicacion!"
mkdir "!proyecto!"
cd "!proyecto!"

REM Continúa con la creación del proyecto
dotnet new sln
dotnet new webapi -o API
dotnet sln add API
dotnet new classlib -o Core
dotnet sln add Core
dotnet new classlib -o Infrastructure
dotnet sln add Infrastructure
cd API
del WeatherForecast.cs
mkdir Controllers
cd Controllers
del WeatherForecastController.cs
echo.>BaseControllerApi.Cs
cd ..
mkdir Dtos
mkdir Extension
cd Extension
echo.>ApplicationServiceExtension.cs
cd ..
mkdir Profiles
cd Profiles
echo.>MappingProfiles.cs
cd ..
dotnet add package AspNetCoreRateLimit --version 5.0.0
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer --version 7.0.10
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.10
dotnet add package Microsoft.EntityFrameworkCore.Design --version 7.0.10
dotnet add package Microsoft.Extensions.DependencyInjection --version 7.0.0
dotnet add package System.IdentityModel.Tokens.Jwt --version 6.32.3
dotnet add package Serilog.AspNetCore --version 7.0.0
dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection --version 12.0.1
dotnet add package AspNetCore.RateLimit --version 5.0.0
dotnet add reference ..\Infrastructure
cd ..\Infrastructure\
del Class1.cs
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 7.0.0
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.10
dotnet add package CsvHelper --version 30.0.1
mkdir Data\Configuration
cd Data
echo.>!proyecto!Context.cs
cd ..
mkdir Repository
cd Repository
echo.>GenericRepository.cs
cd ..
mkdir UnitOfWork
cd UnitOfWork
echo.>UnitOfWork.cs
cd ..
dotnet add reference ..\Core
cd ..\Core\
del Class1.cs
mkdir Entities
cd Entities
echo.>BaseEntity.cs
cd ..
mkdir Interfaces
cd Interfaces
echo.>IGenericRepository.cs
echo.>IUnitOfWork.cs
cd ..
cd ..
dotnet build
dotnet restore
goto :menu_principal

:proyecto_cuatro_capas
cls
echo Creando proyecto de 4 capas...

REM Código de creación de proyecto de 4 capas
@echo off
setlocal enabledelayedexpansion


REM Captura la elección del usuario
set "eleccion=%errorlevel%"

REM Muestra las ubicaciones predeterminadas según el idioma
echo.
echo Ubicaciones predeterminadas:
echo 1. Descargas
echo 2. Documentos
echo 3. Escritorio
echo 4. Ubicacion Actual


REM Pregunta al usuario por la ubicación deseada
choice /c 1234 /n /m "Elija una ubicacion predeterminada (1/2/3/4): "
set "eleccion=%errorlevel%"

if !eleccion! == 3 (
    set "ubicacion=Desktop"
) else if !eleccion! == 2 (
    set "ubicacion=Documents"
) else if !eleccion! == 1 (
    set "ubicacion=Downloads"
) else (
	set "ubicacion=%cd%"
)
echo !ubicacion!


REM Muestra la ubicación seleccionada
echo.

echo Ha seleccionado "!ubicacion!" como su ubicacion predeterminada.
if not !eleccion! == 4 (
    set /p "ubicacion2=Introduce la ruta del proyecto (deje vacío para usar la ubicación predeterminada): "
)


REM Pregunta al usuario el nombre del proyecto
set /p "proyecto=Introduce el nombre de tu proyecto: "


REM Validación si la ubicación es vacía
if not defined !ubicacion2! (
	set "ubicacion=!UserProfile!\!ubicacion!\"
    
) else if !elecion! == 4 (
	set "ubicacion=!ubicacion!"
)else (
    set "ubicacion=!UserProfile!\!ubicacion!\!ubicacion2!\"
)

echo "!ubicacion!"


REM Crea el directorio del proyecto en la ubicación especificada
cd "!ubicacion!"
mkdir "!proyecto!"
cd "!proyecto!"


REM Continúa con la creación del proyecto
dotnet new sln
dotnet new webapi -o API
dotnet sln add API
dotnet new classlib -o Domain
dotnet sln add Domain
dotnet new classlib -o Persistence
dotnet sln add Persistence
dotnet new classlib -o Aplication
dotnet sln add Aplication
cd API
del WeatherForecast.cs
mkdir Dtos
mkdir Extension
cd Extension
echo.>ApplicationServiceExtension.cs
cd ..
cd Controllers
del WeatherForecastController.cs
cd ..
mkdir Helpers
cd Helpers
echo.>Authorization.cs
echo.>!proyecto!.cs
cd ..
mkdir Services
cd Services
echo.>IUserService.cs
echo.>UserService.cs
cd ..
dotnet add package AspNetCoreRateLimit --version 5.0.0
dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection --version 12.0.1
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer --version 7.0.12
dotnet add package Microsoft.AspNetCore.Mvc.Versioning --version 5.1.0
dotnet add package Microsoft.AspNetCore.OpenApi --version 7.0.11
dotnet add package Microsoft.EntityFrameworkCore.Design --version 7.0.10

dotnet add reference ..\Aplication
cd ..
cd Aplication
del Class1.cs
mkdir Repository
cd Repository
echo.>GenericRepository.cs
cd..
mkdir UnitOfWork
cd UnitOfWork
echo.>UnitOfWork.cs
cd..
dotnet add reference ..\Domain
dotnet add reference ..\Persistence

cd ..
cd Domain
del Class1.cs
mkdir Entities
cd Entities
echo.>BaseEntity.cs
echo.>RefreshToken.cs
cd ..
mkdir Interfaces
cd Interfaces
echo.>IGenericRepository.cs
echo.>IUnitOfWork.cs
cd ..
dotnet add package FluentValidation.AspNetCore --version 11.3.0
dotnet add package itext7.pdfhtml --version 5.0.1
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.12
cd ..
cd Persistence
dotnet add reference ..\Domain
del Class1.cs
mkdir Data
cd Data
mkdir Configuration
echo.>!proyecto!Context.cs
cd ..
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.12
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 7.0.0
cd ..
dotnet build
dotnet restore

goto :menu_principal

:entidades_tres_capas
cls
echo "!ubicacion!"
echo Creando entidades para el proyecto de 3 capas...
REM Código de creación de entidades para el proyecto de 3 capas
@echo off
REM Pregunta al usuario por el número de entidades
set /p "num_entidades=Introduce el número de entidades: "

REM Ciclo para crear las entidades
set "count=0"
:loop
echo "!ubicacion!"
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    
    REM Crea la entidad en Core\Entities
    echo.>!ubicacion!\!proyecto!\Core\Entities\!nombre_entidad!.cs

    REM Crea la interfaz en Core\Interfaces
    echo.>!ubicacion!\!proyecto!\Core\Interfaces\I!nombre_entidad!IGenericRepository.cs

    REM Crea el controlador en API\Controllers
    echo.>!ubicacion!\!proyecto!\API\Controllers\!nombre_entidad!Controller.cs

    REM Crea el Dto en API\Dtos
    echo.>!ubicacion!\!proyecto!\API\Dtos\!nombre_entidad!Dto.cs

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
    ) >> !ubicacion!\!proyecto!\Core\Entities\!nombre_entidad!.cs

    set /a "count+=1"
    goto :loop
)
goto :menu_principal
:entidades_cuatro_capas
cls
echo Creando entidades para el proyecto de 4 capas...

REM Código de creación de entidades para el proyecto de 4 capas
@echo off
setlocal enabledelayedexpansion
REM Pregunta al usuario por el número de entidades
set /p "num_entidades=Introduce el numero de entidades: "

REM Ciclo para crear las entidades
set "count=0"
:loop
echo "!ubicacion!"
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    
    REM Crea la entidad en Core\Entities
    echo.>!ubicacion!\!proyecto!\Domain\Entities\!nombre_entidad!.cs

    REM Crea la interfaz en Core\Interfaces
    echo.>!ubicacion!\!proyecto!\Domain\Interfaces\I!nombre_entidad!Repository.cs

    REM Crea el controlador en API\Controllers
    echo.>!ubicacion!\!proyecto!\API\Controllers\!nombre_entidad!Controller.cs

    REM Crea el Dto en API\Dtos
    echo.>!ubicacion!\!proyecto!\API\Dtos\!nombre_entidad!Dto.cs

    REM Crea los Respositorios API/Repository
    echo.>!ubicacion!\!proyecto!\API\Repository\I!nombre_entidad!Repository.cs

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
    ) >> "!ubicacion3!Core\Entities\!nombre_entidad!.cs"
    REM Agrega código al archivo recién creado en Core\Interfaces\I!nombre_entidad!Repository
    (
        echo using System;
        echo using System.Collections.Generic;
        echo using System.ComponentModel.DataAnnotations;
        echo using System.Linq;
        echo using System.Threading.Tasks;
        echo using Core.Entities;
        echo.
        echo namespace Core.Interfaces
        echo {
        echo     public interface I(Entidad)Repository : IGenericRepository<(Entidad)>
        echo     {
        echo     }
        echo }
    ) >> !ubicacion3!Core\Interfaces\I!nombre_entidad!Repository.c
    set /a "count+=1"
    goto :loop
)
goto :menu_principal




echo using System.Collections.Generic;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo using System.Linq;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo using System.Threading.Tasks;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo using Domain.Entities;>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo.>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo namespace Domain.Interfaces>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo {>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo     public interface I(Entidad)Repository : IGenericRepository<(Entidad)>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo     {>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo     }>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"
    echo }>>"!ubicacion3!Domain\Interfaces\I!nombre_entidad!Repository.c"


    echo using System.Collections.Generic;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Linq;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Threading.Tasks;>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo.>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo namespace Domain.Entities>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo {>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo     public class !nombre_entidad! : BaseEntity>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo     {>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo         // Aquí va tu código adicional o personalizado.>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo     }>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"
    echo }>>"!ubicacion3!Domain\Entities\!nombre_entidad!.cs"