--------ARQUITECTURA DE CREACION DE PROYECTO WEBAPI------------
* CREAR CARPETA DEL PROYECTO
* CREAR SOLUCION : dotnet new sln
* CREAR PROYECTO WEB API: dotnet new webapi -o (nombre del proyecto o API)
* ASOCIAR EL PROYECTO API CON LA SOLUCION GLOBAL : dotnet sln add (nombre del proyecto o API)
* CREAR CARPETA DE INFRAESTRUCTURA : mkdir infrastucture
* CREAR PROYECTO DE INFRAESTRUCTURA : dotnet new classlib -o (nombre del proyecto o Infrastructure)
* ASOCIAR EL PROYECTO DE INFRAESTRUCTURA CON LA SOLUCION GLOBAL : dotnet sln add (nombre del proyecto o Infrastructure)
* CREAR CARPETA DE CORE : mkdir core
* CREAR PROYECTO DE CORE : dotnet new classlib -o (nombre del proyecto o Core)
* ASOCIAR EL PROYECTO DE CORE CON LA SOLUCION GLOBAL : dotnet sln add (nombre del proyecto o Core)
* ENTRAR A CARPETA API : cd (nombre del proyecto o API)
* RELACIONAR PROYECTO DE API CON EL PROYECTO DE INFRASTRUCTURE : dotnet add reference ../(nombre del proyecto O Infrastructure)
* ENTRAR A CARPETA INFRASTRUCTURE : cd (nombre del proyecto o Infrastructure)
* RELACIONAR PROYECTO DE INFRASTRUCTURE CON EL PROYECTO DE CORE : dotnet add reference ../(nombre del proyecto o Core)

---------EXTENCIONES DE VISUAL STUDIO CODE------------
* C#
* C# Extensions
* NuGet Gallery

-----------INSTALACION DE PAQUETES NUGET--------------

- MICROSFT.ENTITYFRAMEWORKCORE (infraestructure)
- POMELON.ENTITYFRAMEWORKCORE.MYSQL (infraestructure)
- MICROSOFT.ENTITYFRAMEWORKCORE.DESIGN (infraestructure)
- CSVHELPER (infraestructure)

---------------INCIACION DEL PROYECTO-----------------
* BORRAR CLASES VACIAS
----------------CREACION DE CARPETAS------------------

EN INFRASCTRUCTURE
• Data/Configuration
• Repository
• UnitOfWork

EN CORE
• Entities
• Interfaces

EN API
• Controllers
• Extensions
• Profiles
-----------------CONEXION A MY SQL-------------------
EN LA CARPETA API
ENTRAR AL ARCHIVO APPSETTINGS.JSON
    "AllowedHosts": "*",
    "ConnectionStrings" : {
        "MySqlConex" : "server=localhost;user=root;password=123456;database=(nombre de la base de datos)"
    }
ENTRAR AL ARCHIVO APPSETTING.DEVELOPMENT.JSON
    "ConnectionStrings" : {
        "MySqlConex" : "server=localhost;user=root;password=123456;database=(nombre de la base de datos)"
    }
----------------CLASE DE CONTEXTO---------------------
EN LA CARPETA DATA
-CREAR UNA CLASE LLAMADA (nombre de la base de datos)Context
-HEREDAR A DBCONTEXT
-CREAR UN CONSTRUCTOR A LA CLASE

CREAR METODO DE CREACION DE MODELOS
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.ApplyConfigurationsAssembly(Assembly.GetExecutingAssembly());
    }
----------INYECTAR LA CONEXION A LA BASE DE DATOS--------
EN LA CARPETA API
ENTRAR AL ARCHIVO PROGRAMS.CS ANTES DE VAR APP = BUILDER.BUILD();
builder.Service.AddDbContext<(nombre de la base de datos)Context>(options => 
{
    string connectionString = builder.Configuration.GetConnectionString("MySqlConex");
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

-----------------CREACION DE ENTIDADES------------------
EN LA CARPETA CORE
- CREACION DE LA ENTIDADES
- CREAR LA ENTIDAD BASE QUE TIENE UN ATRIBUTO QUE TIENEN TODAS LAS ENTIDADES (EntityBase)
- A CADA CLASE ASIGNARLE LOS ATRIBUTOS Y HEREDEAR A LA ENTIDAD BASE
- A CADA CLASE ASIGNARLE SI TIENE LLAVES FORANEAS O ATRIBUTOS HEREDADOS
---------------------DOTNET----------------------------
* TENER INSTALADO DOTNET

/REVISION DE VERSION DE DOTNET: dotnet --version
/REVISION DE VERSION DE DOTNET TOOLS: dotnet tool list -g
/INSTALACION DE DOTNET EN LINUX : sudo apt install dotnet-sdk-(version)
/INSTALACION DE DOTNET EN WINDOWS : https://dotnet.microsoft.com/download/dotnet-core/

