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