@echo off
setlocal enabledelayedexpansion

REM Menu de selección de capas
:menu
echo Seleccione el tipo de proyecto que desea crear:
echo 1. Proyecto de 3 capas
echo 2. Proyecto de 4 capas
set /p "opcion=Introduzca 1 o 2 para seleccionar el tipo de proyecto: "

if "%opcion%"=="1" (
    call :proyecto_tres_capas
) else if "%opcion%"=="2" (
    call :proyecto_cuatro_capas
) else (
    echo Opción no válida. Por favor, seleccione 1 o 2.
    goto :menu
)

exit /b

:proyecto_tres_capas
REM Código del proyecto de 3 capas
echo Creando proyecto de 3 capas...
REM (Agregue su código de 3 capas aquí)

:proyecto_tres_capas
REM Código del proyecto de 3 capas
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
if "!ubicacion2!"==" " (
	set "ubicacion=!UserProfile!\!ubicacion!\"
) else if !elecion! == 4 (
	set "ubicacion=!ubicacion!"
) else (
    set "ubicacion=!UserProfile!\!ubicacion!\!ubicacion2!\"
)

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
REM Creación de entidades para el proyecto de 3 capas
REM Pregunta al usuario por el número de entidades
set /p "num_entidades=Introduce el número de entidades: "

REM Ciclo para crear las entidades
set "count=0"
:loop_entities_3_capas
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    
    REM Crea la entidad en Core\Entities
    echo.>!ubicacion!\Core\Entities\!nombre_entidad!.cs

    REM Crea la interfaz en Core\Interfaces
    echo.>!ubicacion!\Core\Interfaces\I!nombre_entidad!IGenericRepository.cs

    REM Crea el controlador en API\Controllers
    echo.>!ubicacion!\API\Controllers\!nombre_entidad!Controller.cs

    REM Crea el Dto en API\Dtos
    echo.>!ubicacion!\API\Dtos\!nombre_entidad!Dto.cs

    REM Crea Repositorios
    echo.>!ubicacion!\Infrastructure\Repository\I!nombre_entidad!Repository.cs

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
    ) >> !ubicacion!\Core\Entities\!nombre_entidad!.cs

    set /a "count+=1"
    goto :loop_entities_3_capas
)
code .
exit /b

:proyecto_cuatro_capas
REM Código del proyecto de 4 capas
echo Creando proyecto de 4 capas...
REM (Agregue su código de 4 capas aquí).
:proyecto_cuatro_capas
REM Código del proyecto de 4 capas
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
if "!ubicacion2!"==" " (
	set "ubicacion=!UserProfile!\!ubicacion!\"
) else if !eleccion! == 4 (
	set "ubicacion=!ubicacion!"
) else (
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

REM Creación de entidades para el proyecto de 4 capas
REM Pregunta al usuario por el número de entidades
set /p "num_entidades=Introduce el numero de entidades: "

REM Ciclo para crear las entidades
set "count=0"
:loop_entities_4_capas
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    
    REM Crea la entidad en Domain\Entities
    echo.>!ubicacion!\Domain\Entities\!nombre_entidad!.cs

    REM Crea la interfaz en Domain\Interfaces
    echo.>!ubicacion!\Domain\Interfaces\I!nombre_entidad!Repository.cs

    REM Crea el controlador en API\Controllers
    echo.>!ubicacion!\API\Controllers\!nombre_entidad!Controller.cs

    REM Crea el Dto en API\Dtos
    echo.>!ubicacion!\API\Dtos\!nombre_entidad!Dto.cs

    REM Crea los Respositorios API\Repository
    echo.>!ubicacion!\API\Repository\I!nombre_entidad!Repository.cs

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
    ) >> !ubicacion!\Domain\Entities\!nombre_entidad!.cs

    set /a "count+=1"
    goto :loop_entities_4_capas
)
code .
goto :eof
exit /b
