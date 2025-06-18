# =======================================================
# CMAKE-RAÍZ (Versión Final Híbrida y Estable)
# =======================================================
cmake_minimum_required(VERSION 3.14)
project(DataphoneApp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# --- Dependencias del Sistema ---
# --- Dependencias del Proyecto (FetchContent) ---
include(FetchContent)

# 1. Contratando a libpqxx.
FetchContent_Declare(
    libpqxx
    GIT_REPOSITORY https://github.com/jtv/libpqxx.git
    GIT_TAG 7.7
)
FetchContent_MakeAvailable(libpqxx)
message(STATUS "CEO: Contratado y listo el proveedor libpqxx.")

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
    pqxx                  # Libpqxx via FetchContent
)
message(STATUS "CEO: Proyecto configurado y listo para ensamblar.")