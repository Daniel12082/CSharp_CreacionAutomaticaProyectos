:insertar_codigo
cls
echo Insertar Código
echo 1. Insertar Código para Proyecto de 3 Capas
echo 2. Insertar Código para Proyecto de 4 Capas
echo 3. Atras
set /p "opcion_codigo=Seleccione una opcion: "

if "%opcion_codigo%"=="1" (
    call :insertar_codigo_tres_capas
) else if "%opcion_codigo%"=="2" (
    call :insertar_codigo_cuatro_capas
) else if "%opcion_codigo%"=="3" (
    goto :menu_principal
) else (
    echo Opción no válida. Intente de nuevo.
    goto :insertar_codigo
)
