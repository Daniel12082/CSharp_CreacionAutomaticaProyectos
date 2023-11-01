@echo off
setlocal enabledelayedexpansion
::---------------------------------------------------------------------------------------------------------

call :ubicacion

::---------------------------------------------------------------------------------------------------------

:menu_principal
cls
echo "!ubicacionguardada!"
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
    call :menu_seleccion_insertar_codigo
) else if "%opcion_menu%"=="4" (
    goto :eof
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :menu_principal
)

::----------------------------------------------------------------------------------------------------
setlocal enabledelayedexpansion
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
    echo "1"
	set "ubicacion=!UserProfile!\!ubicacion!\"
    set "ubicacionguardada=!ubicacion!!ubicacion2!\"
) else if !eleccion! == 4 (
    echo "2"
	set "ubicacion=!ubicacion!"
    set "ubicacionguardada=!ubicacion!\!ubicacion2!\"
) else (
    echo "3"
    set "ubicacion=!UserProfile!\!ubicacion!\!ubicacion2!\"
    set "ubicacionguardada=!ubicacion!\"
    
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
    echo Opcion no valida. Intente de nuevo.
    goto :menu_entidades
)
::--------------------------------------------------------------------------------------------------------

:menu_seleccion_insertar_codigo
cls
echo Insertar Codigo
echo 1. Insertar Codigo para Proyecto de 3 Capas
echo 2. Insertar Codigo para Proyecto de 4 Capas
echo 3. Atras
set /p "opcion_codigo=Seleccione una opcion: "

if "%opcion_codigo%"=="1" (
    call :menu_insertar_codigo_tres_capas
) else if "%opcion_codigo%"=="2" (
    call :menu_insertar_codigo_cuatro_capas
) else if "%opcion_codigo%"=="3" (
    goto :menu_principal
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :insertar_codigo
)
::--------------------------------------------------------------------------------------------------------

:menu_insertar_codigo_tres_capas
cls
echo Tenga en cuenta que debe tener la entidades ya creadas
pause
cls
echo Automatizacion de codigo:
echo Seleccione una opcion:
echo 1. Context
echo 2. Unit of Work
echo 3. Application Service Extension
echo 4. MappingProfiles
echo 5. IUnitOfWork
echo 6. Salir
set /p "opcioncod=Ingrese el numero de opcion deseada: "
if %opcioncod%==1 (
    call :context_tres_capas
) else if %opcioncod%==2 (
    echo Ha seleccionado Unit of Work.
    REM Logica especifica para Unit of Work
) else if %opcioncod%==3 (
    goto :ApplicationServiceExtension_tres_capas
) else if %opcioncod%==4 (
    echo Ha seleccionado MappingProfiles.
    REM Logica especifica para MappingProfiles
) else if %opcioncod%==5 (
    echo Ha seleccionado IUnitOfWork.
    REM Logica especifica para IUnitOfWork
) else if %opcioncod%==6 (
    goto :menu_principal
    exit
) else (
    echo Opcion no valida. Por favor, seleccione una opcion del menu.
    pause
)
goto :menu_insertar_codigo_tres_capas
::--------------------------------------------------------------------------------------------------------
:menu_insertar_codigo_cuatro_capas
cls
echo Tenga en cuenta que debe tener la entidades ya creadas
pause
cls
echo Automatizacion de codigo:
echo Seleccione una opcion:
echo 1. Context
echo 2. Unit of Work
echo 3. Application Service Extension
echo 4. Helpers
echo 5. Services
echo 6. IUnitOfWork
echo 7. Salir
set /p "opcioncod=Ingrese el numero de opcion deseada: "
if %opcioncod%==1 (
    echo Ha seleccionado Context.
    REM Logica especifica para Context
) else if %opcioncod%==2 (
    echo Ha seleccionado Unit of Work.
    REM Logica especifica para Unit of Work
) else if %opcioncod%==3 (
    echo Ha seleccionado Extension.
    REM Logica especifica para Extension
) else if %opcioncod%==4 (
    echo Ha seleccionado Helpers.
    REM Logica especifica para Helpers
) else if %opcioncod%==5 (
    echo Ha seleccionado Services.
    REM Logica especifica para Services
) else if %opcioncod%==6 (
    echo Ha seleccionado Services.
    REM Logica especifica para Services
) else if %opcioncod%==7 (
    goto :menu_principal
    exit
) else (
    echo Opcion no valida. Por favor, seleccione una opcion del menu.
    pause
)
goto :menu_insertar_codigo_cuatro_capas

::--------------------------------------------------------------------------------------------------------

:creacion_proyecto_tres_capas
cls
echo Creando proyecto de 3 capas...
REM Crea el directorio del proyecto en la ubicacion especificada
cd "!ubicacion!"
mkdir "!proyecto!"
cd "!proyecto!"
REM Continua con la creacion del proyecto
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
goto :menu_principal

::--------------------------------------------------------------------------------------------------------

:creacion_proyecto_cuatro_capas
cls
echo Creando proyecto de 4 capas...
cd "!ubicacion!"
mkdir "!proyecto!"
cd "!proyecto!"
REM Continua con la creacion del proyecto
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
code .
goto :menu_principal

::-------------------------------------------------------------------------------------------------------------------------------------------

:crecion_entidades_tres_capas
cls
REM Pregunta al usuario por el numero de entidades
set /p "num_entidades=Introduce el numero de entidades: "
REM Ciclo para crear las entidades
set "count=0"
:loop
if %count% lss %num_entidades% (
    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "
    REM Crea la entidad en Core\Entities
    echo.>!ubicacionguardada!Core\Entities\!nombre_entidad!.cs
    REM Crea la interfaz en Core\Interfaces
    echo.>!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs
    REM Crea el controlador en API\Controllers
    echo.>!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs
    REM Crea el Dto en API\Dtos
    echo.>!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs
    REM Agrega codigo al archivo recien creado en Core\Interfaces\IEntidadRepositoy.cs
    echo using System;>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.Linq;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo using Core.Entities;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo. >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo namespace Core.Interfaces>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo { >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo     public interface I!nombre_entidad!Repository:IGenericRepository^<!nombre_entidad!^> >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo     {>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo     }>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    echo } >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!Repository.cs"
    REM Agrega codigo al archivo recien creado en Core\Entities\Entidad.cs
    echo using System;>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo using System.Linq;>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo. >>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo namespace Core.Entities>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo {>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo     public class !nombre_entidad! : BaseEntity>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo     {>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo         // Aqui va tu codigo adicional o personalizado.>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo     }>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    echo }>>"!ubicacionguardada!Core\Entities\!nombre_entidad!.cs"
    REM Agrega Codigo al archivo recien creado API\Dtos
    echo using System; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Collections.Generic; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Linq;; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Threading.Tasks; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo using Core.Entities; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo namespace API.Dtos; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo     public class !nombre_entidad!Dto : GenericDto >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo     { >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo         // Aqui va tu codigo adicional o personalizado. >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo     } >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    set /a "count+=1"
    goto :loop
)
goto :menu_principal

::--------------------------------------------------------------------------------------------------------------

:creacion_entidades_cuatro_capas

::--------------------------------------------------------------------------------------------------------------

:context_tres_capas
cls
echo using System;> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo using System.Collections.Generic;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo using System.Linq;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo using System.Reflection;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo using System.Threading.Tasks;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo using Core.Entities;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo using Microsoft.EntityFrameworkCore;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo.>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo namespace Infrastructure.Data>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo     public class !proyecto!Context : DbContext>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo     {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo         public !proyecto!Context^(DbContextOptions options^) : base^(options^)>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo         {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo         }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo.>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
for %%f in ("!ubicacionguardada!Core\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo         DbSet^<!nombre!^> ^!nombre^!s ^{ get; set; ^}>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
    )
)
echo.>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo         protected override void OnModelCreating^(ModelBuilder modelBuilder^)>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo         {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo             base.OnModelCreating^(modelBuilder^);>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo             modelBuilder.ApplyConfigurationsFromAssembly^(Assembly.GetExecutingAssembly^(^)^);>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo         }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo     }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
echo }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
goto :menu_insertar_codigo_tres_capas
::-------------------------------------------------------------------------------------------------------------

:context_cuatro_capas
cls
echo using System;> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo using System.Collections.Generic;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo using System.Linq;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo using System.Reflection;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo using System.Threading.Tasks;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo using Core.Entities;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo using Microsoft.EntityFrameworkCore;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo.>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo namespace Persistence.Data>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo {>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo     public class !proyecto!Context : DbContext>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo     {>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         public !proyecto!Context^(DbContextOptions options^) : base^(options^)>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         {>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         }>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo.>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
for %%f in ("!ubicacionguardada!Core\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo         DbSet^<!nombre!^> ^!nombre^!s ^{ get; set; ^}>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
    )
)
echo.>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         protected override void OnModelCreating^(ModelBuilder modelBuilder^)>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         {>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo             base.OnModelCreating^(modelBuilder^);>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo             modelBuilder.ApplyConfigurationsFromAssembly^(Assembly.GetExecutingAssembly^(^)^);>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         }>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo     }>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo }>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
goto :menu_insertar_codigo_cuatro_capas
::-------------------------------------------------------------------------------------------------------------

:unit_of_work_tres_capas

::-------------------------------------------------------------------------------------------------------------

:unit_of_work_cuatro_capas

::-------------------------------------------------------------------------------------------------------------

:ApplicationServiceExtension_tres_capas
cls
echo Creando ApplicationServiceExtension
echo using System; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo using System.Collections.Generic; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo using System.Linq; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo using System.Threading.Tasks; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo using AspNetCoreRateLimit; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo using Core.Interfaces; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo using Infrastructure.UnitOfWork; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo. >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo namespace API.Extension >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo     public static class ApplicationServiceExtension >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo     { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         public static void configureCors(this IServiceCollection services) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             services.AddCors(options =^> >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 options.AddPolicy( >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                     "CorsPolicy", >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                     builder =^> >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                         builder >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                             .AllowAnyOrigin() >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                             .AllowAnyMethod() >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                             .AllowAnyHeader() >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 ); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             }); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         public static void AddAplicationService(this IServiceCollection services) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             services.AddScoped^<IUnitOfWork, UnitOfWork^>(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         public static void ConfigureRatelimiting(this IServiceCollection services) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             services.AddMemoryCache(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             services.AddSingleton^<IRateLimitConfiguration, RateLimitConfiguration^>(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             services.AddInMemoryRateLimiting(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             services.Configure^<IpRateLimitOptions^>(options =^> >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 options.EnableEndpointRateLimiting = true; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 options.StackBlockedRequests = false; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 options.HttpStatusCode = 429; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 options.RealIpHeader = "X-Real-IP"; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 options.GeneralRules = new List^<RateLimitRule^> >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                     new RateLimitRule >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                     { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                         Endpoint = "*", >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                         Period = "10s", >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                         Limit = 2 >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                     } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo                 }; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo             }); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo         } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo     } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
echo } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
pause
cls
echo ApplicationServiceExtension creada
pause
goto :menu_insertar_codigo_tres_capas
::-------------------------------------------------------------------------------------------------------------

:ApplicationServiceExtension_cuatro_capas

::-------------------------------------------------------------------------------------------------------------

:MappingProfiles_tres_capas

::-------------------------------------------------------------------------------------------------------------

:
