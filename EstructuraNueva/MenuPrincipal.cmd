@echo off
setlocal enabledelayedexpansion

:menu_principal
cls
echo Menu Principal
echo 1. Creacion de Proyecto
echo 2. Creacion de Entidades
echo 3. Insertar Codigo
echo 4. Salir
set /p "opcion_menu=Seleccione una opcion: "

if "%opcion_menu%"=="1" (
    call :menu_proyecto
) else if "%opcion_menu%"=="2" (
    call :menu_entidades
) else if "%opcion_menu%"=="3" (
    call :insertar_codigo
) else if "%opcion_menu%"=="4" (
    goto :eof
) else (
    echo Opcion no valida. Intente de nuevo.
    goto :menu_principal
)
