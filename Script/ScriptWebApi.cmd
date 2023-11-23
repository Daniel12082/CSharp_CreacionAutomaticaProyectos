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
setlocal enabledelayedexpansion
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
    set "ubicacionguardada=!ubicacion!!proyecto!\"
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
    goto :menu_seleccion_proyecto
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
    goto :menu_seleccion_entidades
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
    goto :menu_seleccion_insertar_codigo
)
::--------------------------------------------------------------------------------------------------------

:menu_insertar_codigo_tres_capas
cls
echo Tenga en cuenta que debe tener la entidades ya creadas
pause
:menu_insertar_codigo_tres_capas2
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
    goto :MappingProfiles_tres_capas
) else if %opcioncod%==5 (
    goto :IUnitOfWork_tres_capas
) else if %opcioncod%==6 (
    goto :menu_principal
    exit
) else (
    echo Opcion no valida. Por favor, seleccione una opcion del menu.
    pause
)
goto :menu_insertar_codigo_tres_capas2
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
echo 3. Application Service Extension Sin Jwt
echo 4. Application Service Extension Con Jwt
echo 5. Helpers
echo 6. Services
echo 7. IUnitOfWork
echo 8. MappingProfiles
echo 9. Salir
set /p "opcioncod=Ingrese el numero de opcion deseada: "
if %opcioncod%==1 (
    echo Ha seleccionado Context.
    goto :context_cuatro_capas
) else if %opcioncod%==2 (
    goto :unit_of_work_cuatro_capas
) else if %opcioncod%==3 (
    goto :ApplicationServiceExtension_sinJWT_cuatro_capas
) else if %opcioncod%==4 (
    ::goto :ApplicationServiceExtension_conJWT_cuatro_capas
    REM Logica especifica para Helpers
) else if %opcioncod%==5 (
    echo Ha seleccionado Helpers.
    REM Logica especifica para Helpers
) else if %opcioncod%==6 (
    echo Ha seleccionado Services.
    REM Logica especifica para Services
) else if %opcioncod%==7 (
    goto:IUnitOfWork_cuatro_capas
) else if %opcioncod%==8 (
    goto:MappingProfiles_cuatro_capas
) else if %opcioncod%==9 (
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
echo.>IGeneric.cs
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
dotnet new classlib -o Application
dotnet sln add Application
cd API
del WeatherForecast.cs
mkdir Profiles
echo.>MappingProfiles.cs
mkdir Dtos
:: Generacion BaseDto
    echo using System; >"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo using System.Collections.Generic; >>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo using System.Linq; >>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo using System.Threading.Tasks; >>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo.>>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo namespace API.Dtos; >>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo     public class BaseDto>>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo     { >>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo         public int Id { get; set; }>>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
    echo     } >>"!ubicacionguardada!\API\Dtos\BaseDto.cs"
mkdir Extension
cd Extension
echo.>ApplicationServiceExtensions.cs
cd ..
cd Controllers
:: Generacion BaseController
    echo using System;>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo using System.Linq;>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo using Microsoft.AspNetCore.Mvc;>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo.>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo [ApiController]>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo [Route("[controller]")]>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo public class BaseController : ControllerBase>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo {>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo.>>"!ubicacionguardada!API\Controllers\BaseController.cs"
    echo }>>"!ubicacionguardada!API\Controllers\BaseController.cs"
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
dotnet add reference ..\Application
cd ..
cd Application
del Class1.cs
mkdir Repository
cd Repository
:: Generacion GenericRepository
    echo using System;>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo using System.Linq;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo using Domain.Entities;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo using Domain.Interfaces;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo using Microsoft.EntityFrameworkCore;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo using Persistence.Data;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo namespace Api.Repository>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo     public class GenericRepository^<T^> : IGeneric^<T^> where T : BaseEntity>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo     {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         private readonly !proyecto!Context _context;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public GenericRepository(!proyecto!Context context)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             _context = context;>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual void Add(T entity)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             _context.Set^<T^>^().Add(entity);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual void AddRange(IEnumerable^<T^> entities)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             _context.Set^<T^>^().AddRange(entities);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual void Delete(T entity)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             _context.Set^<T^>^().Remove(entity);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual void DeleteRange(IEnumerable^<T^> entities)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             _context.Set^<T^>^().RemoveRange(entities);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual IEnumerable^<T^> Find(Func^<T, bool^> predicate)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             return _context.Set^<T^>^().Where(predicate);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual async Task^<IEnumerable^<T^>^> GetAllAsync()>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             return await _context.Set^<T^>^().ToListAsync();>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual async Task^<(int totalRegistros, IEnumerable^<T^> registros)^> GetAllAsync(int pageIndex, int pageSize)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             var totalRegistros = await _context.Set^<T^>^().CountAsync();>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             var registros = await _context.Set^<T^>^()>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             .Skip((pageIndex - 1) * pageSize)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             .Take(pageSize)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             .ToListAsync();>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             return (totalRegistros, registros);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public virtual async Task^<T^> GetByIdAsync(int id)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             return await _context.Set^<T^>^().FindAsync(id);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         public void Update(T entity)>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo             _context.Set^<T^>^().Update(entity);>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo     }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
    echo }>>"!ubicacionguardada!Application\Repository\GenericRepository.cs"

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
:: Generacion BaseEntity
    echo using System;>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo using System.Linq;>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo.>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo namespace Domain.Entities>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo {>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo     public class BaseEntity>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo     {>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo         public int Id { get; set; }>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo     }>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
    echo }>>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo.>RefreshToken.cs
cd ..
mkdir Interfaces
cd Interfaces
:: Generacion IGeneric
    echo using System;>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo using System.Linq;>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo using Domain.Entities;>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo.>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo namespace Domain.Interfaces>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo { >>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo     public interface IGeneric^<T^> where T : BaseEntity>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo     {>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         Task^<T^> GetByIdAsync(int id);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         Task^<IEnumerable^<T^>^> GetAllAsync();>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         Task^<(int totalRegistros, IEnumerable^<T^> registros)^> GetAllAsync(int pageindex, int pageSize);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         IEnumerable^<T^> Find(Func^<T, bool^> predicate);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         void Add(T entity);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         void AddRange(IEnumerable^<T^> entities);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         void Update(T entity);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         void Delete(T entity);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo         void DeleteRange(IEnumerable^<T^> entities);>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo     }>>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
    echo } >>"!ubicacionguardada!Domain\Interfaces\IGeneric.cs"
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
start code .
dotnet build
dotnet restore
goto :menu_principal

::------------------------------------------------------------------------------------------------------------------------

:crecion_entidades_tres_capas
cls
REM Pregunta al usuario por el numero de entidades
set /p "num_entidades=Introduce el numero de entidades: "
pause
set "count=0"
pause
:loop
if %count% lss %num_entidades% (

    set /p "nombre_entidad=Introduce el nombre de la entidad %count%: "

    REM Crea la entidad en Core\Entities
    echo.>!ubicacionguardada!Core\Entities\!nombre_entidad!.cs
    REM Crea la interfaz en Core\Interfaces
    echo.>!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs
    REM Crea el controlador en API\Controllers
    echo.>!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs
    REM Crea el Dto en API\Dtos
    echo.>!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs
    REM Crear Repository
    echo.>!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs

    REM Agrega codigo al archivo recien creado en Core\Interfaces\IEntidadRepositoy.cs
    echo using System;>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo using System.Linq;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo using Core.Entities;>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo. >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo namespace Core.Interfaces>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo { >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo     public interface I!nombre_entidad!:IGeneric^<!nombre_entidad!^> >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo     {>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo     }>>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
    echo } >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"

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

    REM Agrega Codigo al archivo recien creado Repository
    echo using System; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo using System.Collections.Generic; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo using System.Linq; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo using System.Threading.Tasks; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo using Core.Entities; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo using Core.Interfaces; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo using Infrastructure.Data; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo. >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo namespace Infrastructure.Repository >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo { >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo     public class !nombre_entidad!Repository : GenericRepository^<!nombre_entidad!^> , I!nombre_entidad! >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo     { >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo         private readonly !proyecto!Context _context; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo         public !nombre_entidad!Repository^(!proyecto!Context context^) : base^(context^) >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo         { >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo             _context = context; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo         } >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo     } >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
    echo } >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"

    set /a "count+=1 "
    echo %count%
    pause
    goto :loop
)
goto :menu_principal

::--------------------------------------------------------------------------------------------------------------

:creacion_entidades_cuatro_capas
cls
REM Pregunta al usuario por el numero de entidades
set /p "num_entidades=Introduce el numero de entidades: "
REM Habilita la expansión retardada de variables
setlocal enabledelayedexpansion
REM Ciclo para crear las entidades
set "count=0"

:loop2
set /a "count+=1"
set /p "nombre_entidad=Introduce el nombre de la entidad !count!: "
REM Crea la entidad en Core\Entities
echo.>!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs
REM Crea la interfaz en Core\Interfaces
echo.>!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs
REM Crea el controlador en API\Controllers
echo.>!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs
REM Crea el Dto en API\Dtos
echo.>!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs
REM Crear Repository
echo.>!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs
REM Crear Configuration
echo.>!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs

    REM Agrega codigo al archivo recien creado en Domain\Interfaces\IEntidad.cs
    echo using System;>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo using System.Linq;>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo using Domain.Entities;>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo.>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo namespace Domain.Interfaces>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo { >>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo     public interface I!nombre_entidad!:IGeneric^<!nombre_entidad!^> >>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo     {>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo.>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo     }>>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
    echo } >>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"

    REM Agrega codigo al archivo recien creado en Domain\Entities\Entidad.cs
    echo using System;>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo using System.ComponentModel.DataAnnotations;>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Linq;>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo.>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo namespace Domain.Entities>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo {>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo     public class !nombre_entidad! : BaseEntity>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo     {>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo.>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo     }>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"
    echo }>>"!ubicacionguardada!Domain\Entities\!nombre_entidad!.cs"

    REM Agrega Codigo al archivo recien creado API\Dtos
    echo using System; >"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Collections.Generic; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Linq; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Threading.Tasks; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo.>>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo namespace API.Dtos; >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo     public class !nombre_entidad!Dto : BaseDto>>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo     { >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo.>>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"
    echo     } >>"!ubicacionguardada!\API\Dtos\!nombre_entidad!Dto.cs"

    REM Agrega Codigo al archivo recien creado Repository
    echo using System; > "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using System.Collections.Generic; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using System.Linq; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using System.Threading.Tasks; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using Api.Repository; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using Domain.Entities; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using Domain.Interfaces; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using Microsoft.EntityFrameworkCore; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using Persistence.Data; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo.>> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo namespace Application.Repository >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo { >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo     public class !nombre_entidad!Repository : GenericRepository^<!nombre_entidad!^> , I!nombre_entidad! >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo     { >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo         public !proyecto!Context _context { get; set; } >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo         public !nombre_entidad!Repository(!proyecto!Context context) : base(context) >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo         { >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo             _context = context; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo         } >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo     } >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo } >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"

    REM Agrega Codigo al archivo recien creado Controller
    echo using System;> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using System.Collections.Generic;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using System.Linq;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using System.Threading.Tasks;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using API.Dtos;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using AutoMapper;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using Domain.Entities;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using Domain.Interfaces;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using Microsoft.AspNetCore.Mvc;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo.>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo namespace API.Controllers;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo public class !nombre_entidad!Controller: BaseController>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo     {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         private readonly IUnitOfWork _unitOfWork;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         private readonly IMapper _mapper;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo.>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         public !nombre_entidad!Controller(IUnitOfWork unitOfWork, IMapper mapper)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             _unitOfWork = unitOfWork;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             _mapper = mapper;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo.>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[HttpGet^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status200OK)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status400BadRequest)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         public async Task^<ActionResult^<IEnumerable^<!nombre_entidad!^>^>^> Get()>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             var entidades = await _unitOfWork.!nombre_entidad!s.GetAllAsync();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             return _mapper.Map^<List^<!nombre_entidad!^>^>(entidades);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo.>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[HttpGet("{id}")^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status200OK)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status400BadRequest)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status404NotFound)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         public async Task^<ActionResult^<!nombre_entidad!Dto^>^> Get(int id)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             var entidad = await _unitOfWork.!nombre_entidad!s.GetByIdAsync(id);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             if(entidad == null)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                 return NotFound();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             return _mapper.Map^<!nombre_entidad!Dto^>(entidad);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo.>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[HttpPost^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status200OK)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status400BadRequest)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         public async Task^<ActionResult^<!nombre_entidad!^>^> Post(!nombre_entidad!Dto !nombre_entidad!Dto)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             var entidad = _mapper.Map^<!nombre_entidad!^>(!nombre_entidad!Dto);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             this._unitOfWork.!nombre_entidad!s.Add(entidad);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             await _unitOfWork.SaveAsync();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             if(entidad == null)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                 return BadRequest();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             !nombre_entidad!Dto.Id = entidad.Id;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             return CreatedAtAction(nameof(Post), new {id = !nombre_entidad!Dto.Id}, !nombre_entidad!Dto);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo.>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[HttpPut("{id}")^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status200OK)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status400BadRequest)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status404NotFound)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         public async Task^<ActionResult^<!nombre_entidad!Dto^>^> Put(int id, ^[FromBody^] !nombre_entidad!Dto !nombre_entidad!Dto)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             if(!nombre_entidad!Dto == null)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                 return NotFound();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             var entidades = _mapper.Map^<!nombre_entidad!^>(!nombre_entidad!Dto);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             _unitOfWork.!nombre_entidad!s.Update(entidades);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             await _unitOfWork.SaveAsync();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             return !nombre_entidad!Dto;>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo.>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[HttpDelete("{id}")^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status204NoContent)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         ^[ProducesResponseType(StatusCodes.Status404NotFound)^]>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         public async Task^<IActionResult^> Delete(int id)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             var entidad = await _unitOfWork.!nombre_entidad!s.GetByIdAsync(id);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             if(entidad == null)>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             {>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                 return NotFound();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             _unitOfWork.!nombre_entidad!s.Delete(entidad);>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             await _unitOfWork.SaveAsync();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo             return NoContent();>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo         }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo     }>> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"

    REM Agrega Codigo al archivo recien creado Configuration
    echo using System;>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo using System.Linq;>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo using Domain.Entities;>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo using Microsoft.EntityFrameworkCore;>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo using Microsoft.EntityFrameworkCore.Metadata.Builders;>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo.>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo namespace Persistence.Data.Configuration>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo {>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo     public class !nombre_entidad!Configuration : IEntityTypeConfiguration^<!nombre_entidad!^>>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo     {>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo         public void Configure(EntityTypeBuilder^<!nombre_entidad!^> builder)>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo         {>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo.>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo         }>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo     }>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"
    echo }>>"!ubicacionguardada!Persistence\Data\Configuration\!nombre_entidad!Configuration.cs"

if !count! lss %num_entidades% (
    goto :loop2
)
goto :menu_principal



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
echo using Domain.Entities;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo using Microsoft.EntityFrameworkCore;>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo.>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo namespace Persistence.Data>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo {>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo     public class !proyecto!Context : DbContext>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo     {>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         public !proyecto!Context^(DbContextOptions^<!proyecto!Context^> options^) : base^(options^)>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         {>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo         }>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
echo.>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
for %%f in ("!ubicacionguardada!Domain\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo         public DbSet^<!nombre!^> ^!nombre^!s ^{ get; set; ^}>> !ubicacionguardada!Persistence\Data\!proyecto!Context.cs
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
cls
echo using Application.Repository;> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo using Domain.Interfaces;>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo using Persistence.Data;>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo namespace Application.UnitOfWork;>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo public class UnitOfWork : IUnitOfWork, IDisposable>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo {>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     private readonly !proyecto!Context _context;>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     public UnitOfWork(!proyecto!Context context)>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     {>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo         _context = context;>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     }>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     public void Dispose()>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     {>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo         _context.Dispose();>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     }>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
for %%f in ("!ubicacionguardada!Domain\Entities\*") do (
    set "nombre=%%~nf"
    for /f %%c in ('powershell -command "[CultureInfo]::CurrentCulture.TextInfo.ToLower('!nombre!')"') do set "nombre_minuscula=%%c"
    if not "!nombre!"=="BaseEntity" (
        echo     private I!nombre! _!nombre_minuscula!s;>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        )
)
for %%f in ("!ubicacionguardada!Domain\Entities\*") do (
    set "nombre=%%~nf"
    for /f %%c in ('powershell -command "[CultureInfo]::CurrentCulture.TextInfo.ToLower('!nombre!')"') do set "nombre_minuscula=%%c"
    if not "!nombre!"=="BaseEntity" (
        echo     public I!nombre! !nombre!s ^{>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo         get>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo         {>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo             if^(_!nombre_minuscula!s == null^) >> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo             {>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo                 _!nombre_minuscula!s = new !nombre!Repository^(_context^);>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo             }>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo             return _!nombre_minuscula!s;>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo         }>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        echo     }>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
        )
)
echo.>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     public async Task^<int^> SaveAsync()>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     {>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo         return await _context.SaveChangesAsync();>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo     }>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
echo }>> !ubicacionguardada!Application\UnitOfWork\UnitOfWork.cs
goto :menu_insertar_codigo_cuatro_capas

::-------------------------------------------------------------------------------------------------------------

:IUnitOfWork_tres_capas

::-------------------------------------------------------------------------------------------------------------

:IUnitOfWork_cuatro_capas
cls
echo using System;> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo using System.Collections.Generic;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo using System.Linq;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo using System.Threading.Tasks;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo using Domain.Entities;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo.>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo namespace Domain.Interfaces;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo.>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo     public interface IUnitOfWork>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo {>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
for %%f in ("!ubicacionguardada!Domain\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo         I!nombre! !nombre!s { get; }>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
        )
)
echo         Task^<int^> SaveAsync();>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo }>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
goto :menu_insertar_codigo_cuatro_capas

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
echo         public static void AddApplicationServices(this IServiceCollection services) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtension.cs"
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

:ApplicationServiceExtension_sinJWT_cuatro_capas
echo using System; > "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo using System.Collections.Generic; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo using System.Linq; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo using System.Threading.Tasks; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo using Application.UnitOfWork; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo using AspNetCoreRateLimit; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo using Domain.Interfaces; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo.>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo namespace API.Extension; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo.>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo     public static class ApplicationServiceExtensions >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo     { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         public static void ConfigureCors(this IServiceCollection services) =^> >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             services.AddCors(options =^> >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                 options.AddPolicy("CorsPolicy", builder =^> >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                     builder.AllowAnyOrigin()    //WithOrigins("https://domain.com") >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                     .AllowAnyMethod()       //WithMethods("GET","POST") >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                     .AllowAnyHeader();     //WithHeaders("accept","content-type") >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             }); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         }); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         public static void ConfigureRateLimiting(this IServiceCollection services)>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         {>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             services.AddMemoryCache();>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             services.AddSingleton^<IRateLimitConfiguration, RateLimitConfiguration^>^();>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             services.AddInMemoryRateLimiting();>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             services.Configure^<IpRateLimitOptions^>^(options =^>>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             {>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                 options.GeneralRules = new List^<RateLimitRule^>>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                 {>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                     new RateLimitRule>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                     {>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                         Endpoint = "*",>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                         Limit = 100,>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                         Period = "10s">> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                     },>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo                 };>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             });>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         }>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         public static void AddAplicationServices(this IServiceCollection services)>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         {>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo             services.AddScoped^<IUnitOfWork,UnitOfWork^>^();>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo         }>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
echo     }>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
goto :menu_insertar_codigo_cuatro_capas

::-------------------------------------------------------------------------------------------------------------

:MappingProfiles_tres_capas
REM Agrega las directivas using al archivo
echo using System;> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using System.Collections.Generic;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using System.Linq;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using System.Threading.Tasks;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using API.Dtos;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using AutoMapper;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using Core.Entities;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo.>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo namespace API.Profiles>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo {>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo     public class MappingProfiles : Profile {>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo         public MappingProfiles^(^) ^{>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo.>> !ubicacionguardada!API\Profiles\MappingProfiles.cs

REM Itera a través de los archivos en el directorio

for %%f in ("!ubicacionguardada!Core\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo             CreateMap^<!nombre!, ^!nombre^!Dto^>^(^).ReverseMap^(^);>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
    )
)

REM Generar el contenido faltante del codigo

echo.>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo         }>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo     }>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo }>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
goto :menu_insertar_codigo_tres_capas
::-------------------------------------------------------------------------------------------------------------

:MappingProfiles_cuatro_capas
echo using System;> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using System.Collections.Generic;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using System.Linq;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using System.Threading.Tasks;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using API.Dtos;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using AutoMapper;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo using Domain.Entities;>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo.>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo namespace API.Profiles>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo {>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo     public class MappingProfiles : Profile>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo     {>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo         public MappingProfiles()>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo         {>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
for %%f in ("!ubicacionguardada!Domain\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo             CreateMap^<!nombre!, !nombre!Dto^>^(^)^.^ReverseMap^(^);>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
    )
)
echo         }>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo     }>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
echo }>> !ubicacionguardada!API\Profiles\MappingProfiles.cs
goto :menu_insertar_codigo_cuatro_capas

::-------------------------------------------------------------------------------------------------------------

:IUnitOfWork_tres_capas
REM Genera el contenido del archivo C#

echo using System;> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo using System.Collections.Generic;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo using System.Linq;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo using System.Threading.Tasks;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo.>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo namespace Core.Interfaces;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo public interface IUnitOfWork >> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo {>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo.>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs

REM Itera a través de los archivos en el directorio

for %%f in ("!ubicacionguardada!Core\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo     I!nombre!Repository ^!nombre^!s ^{ get; ^}>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
    )
)

REM Generar el contenido faltante del codigo

echo.>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo     Task^<int^> SaveAsync^(^);>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo }>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
echo IUnitOfWork creado

pause
goto :menu_insertar_codigo_tres_capas
::-------------------------------------------------------------------------------------------------------------

:IUnitOfWork_cuatro_capas
REM Genera el contenido del archivo C#

echo using System;> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo using System.Collections.Generic;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo using System.Linq;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo using System.Threading.Tasks;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo.>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo namespace Domain.Interfaces;>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo public interface IUnitOfWork >> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo {>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo.>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs

REM Itera a través de los archivos en el directorio

for %%f in ("!ubicacionguardada!Domain\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo     I!nombre!Repository ^!nombre^!s ^{ get; ^}>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
    )
)
REM Generar el contenido faltante del codigo

echo.>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo     Task^<int^> SaveAsync^(^);>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo }>> !ubicacionguardada!Domain\Interfaces\IUnitOfWork.cs
echo IUnitOfWork
pause
goto :menu_insertar_codigo_cuatro_capas
::-------------------------------------------------------------------------------------------------------------
