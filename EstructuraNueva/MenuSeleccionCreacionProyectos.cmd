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