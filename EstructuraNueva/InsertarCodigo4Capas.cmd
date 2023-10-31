:insertar_codigo_cuatro_capas
cls
REM Código de creación de entidades para el proyecto de 4 capas
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
choice /c 1234 /n /m "Elija una ubicacion de su proyecto: "
set "eleccion=%errorlevel%"

if !eleccion! == 3 (
    set "ubicacion=Desktop"
    pause
) else if !eleccion! == 2 (
    set "ubicacion=Documents"
) else if !eleccion! == 1 (
    set "ubicacion=Downloads"
) else (
	set "ubicacion=%cd%"
)
echo Seleccione una opción:
echo 1. Context
echo 2. Repository
echo 3. Unit of Work
echo 4. DTOs
echo 5. Extension
echo 6. Helpers
echo 7. Services
echo 8. Salir
set /p "opcioncod=Ingrese el número de opción deseada: "
echo !opcioncod!
cls
set /p "project=Introduce el nombre del proyecto (teniendo en cuenta mayúsculas y minúsculas):"
pause
if %opcioncod%==1 (
    echo Ha seleccionado Context.
) else if %opcioncod%==2 (
    echo Ha seleccionado Repository.
    pause
    REM Lógica específica para Repository
) else if %opcioncod%==3 (
    echo Ha seleccionado Unit of Work.
    REM Lógica específica para Unit of Work
) else if %opcioncod%==4 (
    echo Ha seleccionado DTOs.
    REM Lógica específica para DTOs
) else if %opcioncod%==5 (
    echo Ha seleccionado Extension.
    REM Lógica específica para Extension
) else if %opcioncod%==6 (
    echo Ha seleccionado Helpers.
    REM Lógica específica para Helpers
) else if %opcioncod%==7 (
    echo Ha seleccionado Services.
    REM Lógica específica para Services
) else if %opcioncod%==8 (
    goto :menu_principal
    exit
) else (
    echo Opción no válida. Por favor, seleccione una opción del menú.
    pause
)