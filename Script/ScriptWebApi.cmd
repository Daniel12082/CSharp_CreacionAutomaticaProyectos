@echo off
setlocal enabledelayedexpansion
::---------------------------------------------------------------------------------------------------------

call :ubicacion

::---------------------------------------------------------------------------------------------------------

:menu_principal
cls
echo Menu Principal
echo 1. Creacion de Proyecto
echo 2. Creacion de Entidades
echo 3. Insertar Codigo
echo 4. Salir
set /p "opcion_menu=Seleccione una opcion: "

if "%opcion_menu%"=="1" (
    call :menu_seleccion_proyecto
) else if "%opcion_menu%"=="2" (
    call :menu_seleccion_entidades
) else if "%opcion_menu%"=="3" (
    call :insertar_codigo
) else if "%opcion_menu%"=="4" (
    goto :eof
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :menu_principal
)

::----------------------------------------------------------------------------------------------------

:ubicacion
cls
set "eleccion=%errorlevel%"
echo Seleccion de ubicacion:
echo 1. Descargas
echo 2. Documentos
echo 3. Escritorio
echo 4. Ubicacion Actual

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
if not !eleccion! == 4 (
    set /p "ubicacion2=Introduce la ruta del proyecto (deje vacio para usar la ubicacion predeterminada): "
)
set /p "proyecto=Introduce el nombre de tu proyecto: "
if not defined !ubicacion2! (
	set "ubicacion=!UserProfile!\!ubicacion!\"
    set "ubicacionguarda = !ubicacion!\!ubicacion2!\"
) else if !elecion! == 4 (
	set "ubicacion=!ubicacion!"
    set "ubicacionguarda = !ubicacion!\!ubicacion2!\"
) else (
    set "ubicacion=!UserProfile!\!ubicacion!\!ubicacion2!\"
    set "ubicacionguarda = !ubicacion!\"
)
goto :menu_principal

::--------------------------------------------------------------------------------------------------------

:menu_seleccion_proyecto
cls
echo Seleccione el tipo de proyecto que desea crear:
echo 1. Proyecto de 3 capas
echo 2. Proyecto de 4 capas
echo 3. Atras
set /p "opcion_proyecto=Introduzca 1 o 2 para seleccionar el tipo de proyecto: "
if "%opcion_proyecto%"=="1" (
    call :creacion_proyecto_tres_capas
) else if "%opcion_proyecto%"=="2" (
    call :creacion_proyecto_cuatro_capas
) else if "%opcion_proyecto%"=="3" (
    goto :menu_principal
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :menu_proyecto
)

::--------------------------------------------------------------------------------------------------------

:menu_seleccion_entidades
cls
echo Seleccione el tipo de proyecto para la creacion de entidades:
echo 1. Proyecto de 3 capas
echo 2. Proyecto de 4 capas
echo 3. Atras
set /p "opcion_entidades=Introduzca 1 o 2 para seleccionar el tipo de proyecto: "
if "%opcion_entidades%"=="1" (
    call :crecion_entidades_tres_capas
) else if "%opcion_entidades%"=="2" (
    call :creacion_entidades_cuatro_capas
) else if "%opcion_entidades%"=="3" (
    goto :menu_principal
) else (
    echo Opción no válida. Intente de nuevo.
    goto :menu_entidades
)

::--------------------------------------------------------------------------------------------------------

:creacion_proyecto_tres_capas
echo Creando proyecto de 3 capas...
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
code .