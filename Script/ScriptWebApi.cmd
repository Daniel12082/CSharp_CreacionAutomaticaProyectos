@echo off
setlocal enabledelayedexpansion
::---------------------------------------------------------------------------------------------------------

call :ubicacion

::---------------------------------------------------------------------------------------------------------

setlocal enabledelayedexpansion
:ubicacion
:: Definir la ubicación guardada como el directorio del propio archivo
set "ubicacionguardada=%~dp0"
echo Tenga en cuenta que la ubicacion guardada es: "!ubicacionguardada!"
set /p 'proyecto = "Introduzca el nombre del proyecto:" '
pause

goto :menu_principal

::---------------------------------------------------------------------------------------------------------

:menu_principal
cls
echo "!ubicacionguardada!"
echo Menu Principal
echo 1. Creacion de Proyecto
echo 2. Creacion de Entidades
echo 3. Insertar Codigo
echo 4.Ingresar al proyecto
echo 5. Salir
set /p "opcion_menu=Seleccione una opcion: "

if "%opcion_menu%"=="1" (
    call :menu_seleccion_proyecto
) else if "%opcion_menu%"=="2" (
    call :menu_seleccion_entidades
) else if "%opcion_menu%"=="3" (
    call :menu_seleccion_insertar_codigo
) else if "%opcion_menu%"=="4" (
    goto :code
) else if "%opcion_menu%"=="5" (
    exit /b
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :menu_principal
)

::---------------------------------------------------------------------------------------------------------

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
    goto :UnitOfWork_tres_capas
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
    goto :UnitOfWork_cuatro_capas
) else if %opcioncod%==3 (
    goto :ApplicationServiceExtension_sinJWT_cuatro_capas
) else if %opcioncod%==4 (
    goto :ApplicationServiceExtension_conJWT_cuatro_capas
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
mkdir Dtos
    echo using System; >"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo using System.Collections.Generic; >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo using System.Linq; >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo using System.Threading.Tasks; >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo.>>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo namespace API.Dtos; >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo     public class BaseDto>>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo     { >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo         public int Id { get; set; }>>"!ubicacionguardada!API\Dtos\BaseDto.cs"
    echo     } >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
mkdir Extension
cd Extension
echo.>ApplicationServiceExtension.cs
cd ..
mkdir Profiles
cd Profiles
echo.>MappingProfiles.cs
cd ..
dotnet add package AspNetCoreRateLimit --version 5.0.0
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.6
dotnet add package Microsoft.EntityFrameworkCore --version 8.0.6
dotnet add package Microsoft.EntityFrameworkCore.Design --version 8.0.6
dotnet add package Microsoft.Extensions.DependencyInjection --version 8.0.0
dotnet add package System.IdentityModel.Tokens.Jwt --version 7.6.0
dotnet add package Serilog.AspNetCore --version 8.0.1
dotnet add package AutoMapper --version 13.0.1
dotnet add package AspNetCoreRateLimit --version 5.0.0
dotnet add reference ..\Infrastructure
cd ..\Infrastructure\
del Class1.cs
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 8.0.2
dotnet add package Microsoft.EntityFrameworkCore --version 8.0.6
dotnet add package CsvHelper --version 32.0.3
mkdir Data\Configuration
cd Data
echo.>!proyecto!Context.cs
cd ..
mkdir Repository
cd Repository
echo using System;>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo using System.Linq;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo using Core.Entities;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo using Core.Interfaces;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo using Microsoft.EntityFrameworkCore;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo using Infrastructure.Data;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo namespace API.Repository>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo     public class GenericRepository^<T^> : IGenericRepository^<T^> where T : BaseEntity>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo     {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        private readonly !proyecto!Context _context;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public GenericRepository(!proyecto!Context context)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo            _context = context;>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public virtual void Add(T entity)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo            _context.Set^<T^>^().Add(entity);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public virtual void AddRange(IEnumerable^<T^> entities)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo            _context.Set^<T^>^().AddRange(entities);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public virtual void Delete(T entity)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo            _context.Set^<T^>^().Remove(entity);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public virtual void DeleteRange(IEnumerable^<T^> entities)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo            _context.Set^<T^>^().RemoveRange(entities);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public virtual IEnumerable^<T^> Find(Func^<T, bool^> predicate)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo            return _context.Set^<T^>^().Where(predicate);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public virtual async Task^<IEnumerable^<T^>^> GetAllAsync()>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo            return await _context.Set^<T^>^().ToListAsync();>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        public virtual async Task^<(int totalRegistros, IEnumerable^<T^> registros)^> GetAllAsync(int pageIndex, int pageSize)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo        {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             var totalRegistros = await _context.Set^<T^>^().CountAsync();>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             var registros = await _context.Set^<T^>^()>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             .Skip((pageIndex - 1) * pageSize)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             .Take(pageSize)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             .ToListAsync();>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             return (totalRegistros, registros);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo         public virtual async Task^<T^> GetByIdAsync(int id)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             return await _context.Set^<T^>^().FindAsync(id);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo.>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo         public void Update(T entity)>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo         {>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo             _context.Set^<T^>^().Update(entity);>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo         }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo     }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
    echo }>>"!ubicacionguardada!Infrastructure\Repository\GenericRepository.cs"
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
    echo using System;>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo using System.Linq;>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo.>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo namespace Core.Entities>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo {>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo     public class BaseEntity>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo     {>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo         public int Id { get; set; }>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo     }>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
    echo }>>"!ubicacionguardada!Core\Entities\BaseEntity.cs"
cd ..
mkdir Interfaces
cd Interfaces
    echo using System;>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo using System.Collections.Generic;>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo using System.Linq;>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo using System.Threading.Tasks;>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo using Core.Entities;>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo.>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo namespace Core.Interfaces>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo { >>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo     public interface IGenericRepository^<T^> where T : BaseEntity>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo     {>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         Task^<T^> GetByIdAsync(int id);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         Task^<IEnumerable^<T^>^> GetAllAsync();>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         Task^<(int totalRegistros, IEnumerable^<T^> registros)^> GetAllAsync(int pageindex, int pageSize);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         IEnumerable^<T^> Find(Func^<T, bool^> predicate);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         void Add(T entity);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         void AddRange(IEnumerable^<T^> entities);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         void Update(T entity);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         void Delete(T entity);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo         void DeleteRange(IEnumerable^<T^> entities);>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo     }>>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
    echo } >>"!ubicacionguardada!Core\Interfaces\IGenericRepository.cs"
echo.>IUnitOfWork.cs
cd ..
cd ..
dotnet build
pause
code .
goto :menu_principal

::--------------------------------------------------------------------------------------------------------

:creacion_proyecto_cuatro_capas
cls
echo Creando proyecto de 4 capas...
cd "%ubicacion%"
mkdir "%proyecto%"
cd "%proyecto%"

:: Continuar con la creación del proyecto
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
cd Profiles
echo.>MappingProfiles.cs
cd ..
mkdir Dtos

:: Generar BaseDto
echo using System; >"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo using System.Collections.Generic; >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo namespace API.Dtos >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo { >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo     public class BaseDto >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo     { >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo         public int Id { get; set; } >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo     } >>"!ubicacionguardada!API\Dtos\BaseDto.cs"
echo } >>"!ubicacionguardada!API\Dtos\BaseDto.cs"

mkdir Extension
cd Extension
echo.>ApplicationServiceExtensions.cs
cd ..
mkdir Controllers
cd Controllers
:: Generar BaseController
echo using System; >"!ubicacionguardada!API\Controllers\BaseController.cs"
echo using Microsoft.AspNetCore.Mvc; >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo namespace API.Controllers >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo { >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo     [ApiController] >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo     [Route("[controller]")] >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo     public class BaseController : ControllerBase >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo     { >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo     } >>"!ubicacionguardada!API\Controllers\BaseController.cs"
echo } >>"!ubicacionguardada!API\Controllers\BaseController.cs"
del WeatherForecastController.cs
cd ..

mkdir Helpers
cd Helpers
:: Generar ApiException
echo namespace API.Helpers;>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo public class ApiException : ApiResponse >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo { >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo     public ApiException(int statusCode, string message = null, string details = null) >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo                     : base(statusCode, message) >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo     { >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo         Details = details; >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo     } >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo     public string Details { get; set; } >>"!ubicacionguardada!API\Helpers\ApiException.cs"
echo } >>"!ubicacionguardada!API\Helpers\ApiException.cs"

:: Generar ApiResponse
echo namespace API.Helpers; >"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo public class ApiResponse >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo { >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     public int StatusCode { get; set; } >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     public string Message { get; set; } >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     public ApiResponse(int statusCode, string message = null) >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     { >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo         StatusCode = statusCode; >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo         Message = message ?? GetDefaultMessage(statusCode); >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     } >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     public ApiResponse() >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     { >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     } >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     private string GetDefaultMessage(int statusCode) >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     { >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo         return statusCode switch >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo         { >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo             400 =^> "Has realizado una petición incorrecta.", >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo             401 =^> "Usuario no autorizado.", >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo             404 =^> "El recurso que has intentado solicitar no existe.", >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo             405 =^> "Este método HTTP no está permitido en el servidor.", >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo             500 =^> "Error en el servidor. No eres tú, soy yo. Comunícate con el administrador XD.", >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo         }; >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo     } >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"
echo } >>"!ubicacionguardada!API\Helpers\ApiResponse.cs"

:: Generar ApiValidation
echo namespace API.Helpers; >"!ubicacionguardada!API\Helpers\ApiValidation.cs"
echo public class ApiValidation : ApiResponse >>"!ubicacionguardada!API\Helpers\ApiValidation.cs"
echo { >>"!ubicacionguardada!API\Helpers\ApiValidation.cs"
echo     public ApiValidation() : base(400) >>"!ubicacionguardada!API\Helpers\ApiValidation.cs"
echo     { >>"!ubicacionguardada!API\Helpers\ApiValidation.cs"
echo     } >>"!ubicacionguardada!API\Helpers\ApiValidation.cs"
echo     public IEnumerable^<string^> Errors { get; set; } >>"!ubicacionguardada!API\Helpers\ApiValidation.cs"
echo } >>"!ubicacionguardada!API\Helpers\ApiValidation.cs"

:: Generar Authorization
echo namespace API.Helpers; >"!ubicacionguardada!API\Helpers\Authorization.cs"
echo public class Authorization >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo { >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo     public enum Roles >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo     { >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo         Administrator, >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo         Manager, >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo         Employee >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo     } >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo     public const Roles rol_default = Roles.Employee; >>"!ubicacionguardada!API\Helpers\Authorization.cs"
echo } >>"!ubicacionguardada!API\Helpers\Authorization.cs"

echo.>ExceptionMiddleware.cs

:: Generar Jwt
echo namespace API.Helpers; >"!ubicacionguardada!API\Helpers\Jwt.cs"
echo public class JWT >>"!ubicacionguardada!API\Helpers\Jwt.cs"
echo { >>"!ubicacionguardada!API\Helpers\Jwt.cs"
echo     public string Key { get; set; } >>"!ubicacionguardada!API\Helpers\Jwt.cs"
echo     public string Issuer { get; set; } >>"!ubicacionguardada!API\Helpers\Jwt.cs"
echo     public string Audience { get; set; } >>"!ubicacionguardada!API\Helpers\Jwt.cs"
echo     public double DurationInMinutes { get; set; } >>"!ubicacionguardada!API\Helpers\Jwt.cs"
echo } >>"!ubicacionguardada!API\Helpers\Jwt.cs"
cd ..

mkdir Services
cd Services
echo.>IUserService.cs
echo.>UserService.cs
cd ..

dotnet add package AspNetCoreRateLimit --version 5.0.0
dotnet add package AutoMapper --version 13.0.0
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.6
dotnet add package Microsoft.AspNetCore.Mvc.Versioning --version 5.1.0
dotnet add package Microsoft.AspNetCore.OpenApi --version 8.0.6
dotnet add package Microsoft.EntityFrameworkCore.Design --version 8.0.6

cd ..
cd Application
del Class1.cs
mkdir Repository

:: Generar GenericRepository
echo using System.Linq.Expressions; >"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo using Domain.Entities; >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo using Domain.Interfaces; >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo using Microsoft.EntityFrameworkCore; >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo using Persistence; >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo namespace Application.Repository; >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo public class GenericRepository^<T^> : IGenericRepositoryRepository^<T^> where T : BaseEntity >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    private readonly !proyecto!Context _context; >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public GenericRepository(!proyecto!Context context) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       _context = context; >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual void Add(T entity) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       _context.Set^<T^>().Add(entity); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo     public virtual void AddRange(IEnumerable^<T^> entities) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       _context.Set^<T^>().AddRange(entities); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual IEnumerable^<T^> Find(Expression^<Func^<T, bool^>^> expression) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       return _context.Set^<T^>().Where(expression); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual async Task^<T^> GetAllAsync() >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       return await _context.Set^<T^>().ToListAsync(); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual async Task^<T^> GetByIdAsync(int id) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       return await _context.Set^<T^>().FindAsync(id); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual void GetByIdAsync(string id) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       reurn await _context.Set^<T^>().FindAsync(id); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual void Remove(T entity) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       _context.Set^<T^>().Remove(entity); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual void RemoveRange(IEnumerable^<T^> entities) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       _context.Set^<T^>().RemoveRange(entities); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    public virtual void Update(T entity) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    { >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo       _context.Set^<T^>().Update(entity); >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo           .Update(entity) >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo    } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
echo } >>"!ubicacionguardada!Application\Repository\GenericRepository.cs"
mkdir UnitOfWork
cd UnitOfWork
echo.>UnitOfWork.cs
cd ..

dotnet add reference ..\Domain
dotnet add reference ..\Persistence

cd ..

cd Domain
del Class1.cs
mkdir Entities

:: Generar BaseEntity
echo using System; >"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo namespace Domain.Entities >>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo { >>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo     public class BaseEntity >>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo     { >>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo         public int Id { get; set; } >>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo     } >>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
echo } >>"!ubicacionguardada!Domain\Entities\BaseEntity.cs"
cd Entities
echo namespace Domain.Entities; >"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo public class RefreshToken : BaseEntity  >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo { >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public int UserId { get; set; } >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public User User { get; set; } >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public string Token { get; set; } >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public DateTime Expires { get; set; } >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public bool IsExpired => DateTime.UtcNow ^>= Expires; >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public DateTime Created { get; set; } >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public DateTime? Revoked { get; set; } >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo     public bool IsActive =^> Revoked == null && !IsExpired; >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
echo } >>"!ubicacionguardada!Domain\Entities\RefreshToken.cs"
cd ..
mkdir Interfaces
cd Interfaces

:: Generar IGenericRepository
echo using System; >"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo using System.Collections.Generic; >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo using System.Threading.Tasks; >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo using Domain.Entities; >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo namespace Domain.Interfaces >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo { >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo     public interface IGenericRepository^<T^> where T : BaseEntity >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo     { >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         Task^<T^> GetByIdAsync(int id); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         Task<IEnumerable^<T^>> GetAllAsync(); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         Task<(int totalRegistros, IEnumerable^<T^> registros)> GetAllAsync(int pageIndex, int pageSize); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         IEnumerable^<T^> Find(Func<T, bool> predicate); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         void Add(T entity); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         void AddRange(IEnumerable^<T^> entities); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         void Update(T entity); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         void Delete(T entity); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo         void DeleteRange(IEnumerable^<T^> entities); >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo     } >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"
echo } >>"!ubicacionguardada!Domain\Interfaces\IGenericRepository.cs"

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
:: Generar ProyectoContext
echo.>!proyecto!Context.cs
cd ..
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.12
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 7.0.0
cd ..


:: Abrir el código en el editor
code .

:: Construir y restaurar el proyecto
dotnet build
dotnet restore

goto :menu_principal

::------------------------------------------------------------------------------------------------------------------------

:crecion_entidades_tres_capas
cls
REM Pregunta al usuario por el numero de entidades
set /p "num_entidades=Introduce el numero de entidades: "
set "count=0"
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
    echo     public interface I!nombre_entidad!:IGenericRepository^<!nombre_entidad!^> >>"!ubicacionguardada!Core\Interfaces\I!nombre_entidad!.cs"
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
    echo using System; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Collections.Generic; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Linq;; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo using Core.Entities; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo namespace API.Dtos; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo     public class !nombre_entidad!Dto : BaseDto >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo     { >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo         // Aqui va tu codigo adicional o personalizado. >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo     } >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"

    REM Agrega Codigo al archivo recien creado Repository
        echo using System; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
        echo using System.Collections.Generic; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
        echo using System.Linq; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
        echo using System.Threading.Tasks; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
        echo using Core.Entities; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
        echo using Core.Interfaces; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
        echo using API.Repository; >> "!ubicacionguardada!Infrastructure\Repository\!nombre_entidad!Repository.cs"
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

        REM Agrega Codigo al archivo recien creado API Controllers
    echo using System; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using System.Collections.Generic; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using System.Linq; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using System.Threading.Tasks; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using API.Dto;; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using AutoMapper;; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using Domain.Entities;; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using Domain.Interfaces;; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo using Microsoft.AspNetCore.Mvc;; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo. >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo namespace API.Controllers >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo    public class !nombre_entidad!Controller : BaseController >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo    { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        private readonly IUnitOfWork _unitOfWork; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        private readonly IMapper _mapper; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo. >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        public !nombre_entidad!Controller(IUnitOfWork unitOfWork, IMapper mapper) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            _unitOfWork = unitOfWork; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            _mapper = mapper; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo. >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [HttpGet] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status200OK)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status400BadRequest)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        public async Task<ActionResult<IEnumerable<!nombre_entidad!>>> Get() >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            var entidades = await _unitOfWork.!nombre_entidad!s.GetAllAsync(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            return _mapper.Map<List<!nombre_entidad!>>>(entidades); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo. >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [HttpGet("{id}")] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status200OK)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status400BadRequest)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status404NotFound)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        public async Task<ActionResult<!nombre_entidad!Dto>> Get(int id) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            var entidad = await _unitOfWork.!nombre_entidad!s.GetByIdAsync(id); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            if (entidad == null) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                return NotFound(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            return _mapper.Map<!nombre_entidad!Dto>(entidad); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo. >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [HttpPost] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status200OK)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status400BadRequest)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        public async Task<ActionResult<!nombre_entidad!>> Post(!nombre_entidad!Dto !nombre_entidad!Dto) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            var entidad = _mapper.Map<!nombre_entidad!>(!nombre_entidad!Dto); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            _unitOfWork.!nombre_entidad!s.Add(entidad); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            await _unitOfWork.SaveAsync(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            if (entidad == null) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                return BadRequest(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            !nombre_entidad!Dto.Id = entidad.Id; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            return CreatedAtAction(nameof(Post), new { id = !nombre_entidad!Dto.Id }, !nombre_entidad!Dto); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo. >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [HttpPut("{id}")] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status200OK)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status400BadRequest)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status404NotFound)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        public async Task<ActionResult<!nombre_entidad!Dto>> Put(int id, [FromBody] !nombre_entidad!Dto !nombre_entidad!Dto) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            if (!nombre_entidad!Dto == null) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                return NotFound(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            var entidades = _mapper.Map<!nombre_entidad!>(!nombre_entidad!Dto); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            _unitOfWork.!nombre_entidad!s.Update(entidades); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            await _unitOfWork.SaveAsync(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            return !nombre_entidad!Dto; >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo. >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [HttpDelete("{id}")] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status204NoContent)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        [ProducesResponseType(StatusCodes.Status404NotFound)] >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        public async Task<IActionResult> Delete(int id) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            var entidad = await _unitOfWork.!nombre_entidad!s.GetByIdAsync(id); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            if (entidad == null) >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            { >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo                return NotFound(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            _unitOfWork.!nombre_entidad!s.Delete(entidad); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            await _unitOfWork.SaveAsync(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo            return NoContent(); >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo        } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo    } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"
    echo } >> "!ubicacionguardada!API\Controllers\!nombre_entidad!Controller.cs"

    set /a "count+=1 "
    echo %count%+1
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
    echo     public interface I!nombre_entidad!:IGenericRepository^<!nombre_entidad!^> >>"!ubicacionguardada!Domain\Interfaces\I!nombre_entidad!.cs"
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
    echo using System; >"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Collections.Generic; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Linq; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo using System.Threading.Tasks; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo.>>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo namespace API.Dtos; >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo     public class !nombre_entidad!Dto : BaseDto>>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo     { >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo.>>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"
    echo     } >>"!ubicacionguardada!API\Dtos\!nombre_entidad!Dto.cs"

    REM Agrega Codigo al archivo recien creado Repository
    echo using System; > "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using System.Collections.Generic; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using System.Linq; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using System.Threading.Tasks; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
    echo using API.Repository; >> "!ubicacionguardada!Application\Repository\!nombre_entidad!Repository.cs"
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

    :UnitOfWork_tres_capas
    cls
    echo using Core.Interfaces;> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo using Infrastructure.Repository; >> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo using Infrastructure.Data;>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo namespace Infrastructure.UnitOfWork;>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo public class UnitOfWork : IUnitOfWork, IDisposable>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo {>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     private readonly !proyecto!Context _context;>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     public UnitOfWork(!proyecto!Context context)>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     {>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo         _context = context;>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     }>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     public void Dispose()>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     {>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo         _context.Dispose();>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     }>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    for %%f in ("!ubicacionguardada!Core\Entities\*") do (
        set "nombre=%%~nf"
        for /f %%c in ('powershell -command "[CultureInfo]::CurrentCulture.TextInfo.ToLower('!nombre!')"') do set "nombre_minuscula=%%c"
        if not "!nombre!"=="BaseEntity" (
            echo     private I!nombre! _!nombre_minuscula!s;>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            )
    )
    for %%f in ("!ubicacionguardada!Core\Entities\*") do (
        set "nombre=%%~nf"
        for /f %%c in ('powershell -command "[CultureInfo]::CurrentCulture.TextInfo.ToLower('!nombre!')"') do set "nombre_minuscula=%%c"
        if not "!nombre!"=="BaseEntity" (
            echo     public I!nombre! !nombre!s ^{>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo         get>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo         {>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo             if^(_!nombre_minuscula!s == null^) >> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo             {>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo                 _!nombre_minuscula!s = new !nombre!Repository^(_context^);>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo             }>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo             return _!nombre_minuscula!s;>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo         }>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            echo     }>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
            )
    )
    echo.>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     public async Task^<int^> SaveAsync()>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     {>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo         return await _context.SaveChangesAsync();>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo     }>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    echo }>> !ubicacionguardada!Infrastructure\UnitOfWork\UnitOfWork.cs
    cls
    goto :menu_insertar_codigo_tres_capas

::-------------------------------------------------------------------------------------------------------------

    :UnitOfWork_cuatro_capas
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
    :ApplicationServiceExtension_conJWT_cuatro_capas
    echo using System; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using API.Helpers; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using API.Services; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using Application.UnitOfWork; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using Domain.Entities; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using Domain.Interfaces; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using Microsoft.AspNetCore.Authentication.JwtBearer; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using Microsoft.AspNetCore.Identity; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using Microsoft.AspNetCore.Mvc; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo using Microsoft.IdentityModel.Tokens; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo.>> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo namespace API.Extension >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo     public static class ApplicationServiceExtensions >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo     { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         public static void ConfigureCors(this IServiceCollection services) => >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             services.AddCors(options => >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 options.AddPolicy("CorsPolicy", builder => >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     builder.AllowAnyOrigin()    //WithOrigins("https://domain.com") >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                         .AllowAnyMethod()       //WithMethods("GET","POST) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                         .AllowAnyHeader());     //WithHeaders("accept","content-type") >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             }); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         public static void AddAplicacionServices(this IServiceCollection services) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             services.AddScoped<IPasswordHasher<User>, PasswordHasher<User>>(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             services.AddScoped<IUserService, UserService>(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             services.AddScoped<IUnitOfWork, UnitOfWork>(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         public static void AddJwt(this IServiceCollection services, IConfiguration configuration) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             //Configuration from AppSettings >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             services.Configure<JWT>(configuration.GetSection("JWT")); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             //Adding Authentication - JWT >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             services.AddAuthentication(options => >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             }) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             .AddJwtBearer(o => >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 o.RequireHttpsMetadata = false; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 o.SaveToken = false; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 o.TokenValidationParameters = new TokenValidationParameters >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     ValidateIssuerSigningKey = true, >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     ValidateIssuer = true, >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     ValidateAudience = true, >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     ValidateLifetime = true, >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     ClockSkew = TimeSpan.Zero, >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     ValidIssuer = configuration["JWT:Issuer"], >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     ValidAudience = configuration["JWT:Audience"], >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JWT:Key"])) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 }; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             }); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         public static void AddValidationErrors(this IServiceCollection services) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             services.Configure<ApiBehaviorOptions>(options => >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 options.InvalidModelStateResponseFactory = actionContext => >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     var errors = actionContext.ModelState.Where(u => u.Value.Errors.Count > 0) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                                                     .SelectMany(u => u.Value.Errors) >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                                                     .Select(u => u.ErrorMessage).ToArray(); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     var errorResponse = new ApiValidation() >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     { >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                         Errors = errors >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     }; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                     return new BadRequestObjectResult(errorResponse); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo                 }; >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo             }); >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo         } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo     } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"
    echo } >> "!ubicacionguardada!API\Extension\ApplicationServiceExtensions.cs"

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
    cls
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
    cls
    echo IUnitOfWork creado
    pause
    

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
    cls
    echo IUnitOfWork creado
    pause
    goto :menu_insertar_codigo_cuatro_capas

::-------------------------------------------------------------------------------------------------------------