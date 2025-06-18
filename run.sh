#!/bin/bash

# --- Script para compilar y ejecutar la aplicación Dataphone-System ---

# 1. Comprobar si el archivo .env existe
if [ ! -f .env ]; then
    echo "Error: El archivo .env no se encuentra. Por favor, créalo antes de continuar."
    exit 1
fi

# 2. Cargar las variables de entorno desde el archivo .env
echo "Cargando variables de entorno desde .env..."
export $(grep -v '^[[:space:]]*#' .env | grep -v '^[[:space:]]*$' | sed 's/#.*//')

# 3. Crear el directorio de build si no existe
if [ ! -d "build" ]; then
    mkdir build
fi

# 4. Compilar el proyecto con CMake
echo "Compilando el proyecto..."
cd build
cmake ..
make

# Comprobar si la compilación fue exitosa
if [ $? -ne 0 ]; then
    echo "Error: La compilación ha fallado."
    cd ..
    exit 1
fi

# 5. Ejecutar la aplicación
echo "Ejecutando la aplicación..."
./dataphone_app

# Volver al directorio raíz al finalizar
cd ..