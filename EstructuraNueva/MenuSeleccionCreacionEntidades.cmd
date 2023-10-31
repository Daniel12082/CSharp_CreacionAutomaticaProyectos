:menu_entidades
cls
echo Seleccione el tipo de proyecto para la creacion de entidades:
echo 1. Proyecto de 3 capas
echo 2. Proyecto de 4 capas
echo 3. Atras
set /p "opcion_entidades=Introduzca 1 o 2 para seleccionar el tipo de proyecto (o 3 para volver): "

if "%opcion_entidades%"=="1" (
    call :entidades_tres_capas
) else if "%opcion_entidades%"=="2" (
    call :entidades_cuatro_capas
) else if "%opcion_entidades%"=="3" (
    goto :menu_principal
) else (
    echo Opción no válida. Intente de nuevo.
    goto :menu_entidades
)