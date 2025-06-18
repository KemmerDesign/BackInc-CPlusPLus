# =======================================================
# CMAKE-RAÍZ (Versión Final Híbrida y Estable)
# =======================================================
cmake_minimum_required(VERSION 3.14)
project(DataphoneApp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# --- Dependencias del Sistema ---
# 1. Encontramos libpqxx y su dependencia libpq usando el sistema.
#    Esto nos da la versión precompilada y estable de tu Ubuntu.
find_package(PkgConfig REQUIRED)
pkg_check_modules(LibPQXX REQUIRED libpqxx)
message(STATUS "CEO: Encontrado proveedor del sistema libpqxx v${LibPQXX_VERSION}")

# --- Dependencias del Proyecto (FetchContent) ---
include(FetchContent)

# 2. Contratando a Asio.
FetchContent_Declare(
    asio
    GIT_REPOSITORY https://github.com/chriskohlhoff/asio.git
    GIT_TAG asio-1-34-2
)
FetchContent_MakeAvailable(asio)
set(ASIO_INCLUDE_DIR ${asio_SOURCE_DIR}/asio/include) # La pista para Crow
message(STATUS "CEO: Contratado y listo el proveedor Asio.")

# 3. Contratando a Crow.
FetchContent_Declare(
    crow
    GIT_REPOSITORY https://github.com/CrowCpp/Crow.git
    GIT_TAG v1.2.1.2
)
FetchContent_MakeAvailable(crow)
message(STATUS "CEO: Contratado y listo el proveedor Crow.")

# --- Delegación y Ensamblaje Final ---
add_subdirectory(src)
add_executable(dataphone_app src/main.cpp)

# SOLUCIÓN AL LINKER ERROR: Enlazamos explícitamente dataphone_lib Y crow_all al ejecutable final.
target_link_libraries(dataphone_app PRIVATE
    dataphone_lib         # Nuestra biblioteca de lógica
    Crow::Crow            # El target moderno de Crow
    ${LibPQXX_LIBRARIES}  # Las bibliotecas de libpqxx del sistema
)
message(STATUS "CEO: Proyecto configurado y listo para ensamblar.")