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
code .