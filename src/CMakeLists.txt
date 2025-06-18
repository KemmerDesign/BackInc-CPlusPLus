# src/CMakeLists.txt (Versión Final para el Modelo Híbrido)

add_library(dataphone_lib
    DatabaseManager.cpp
    services/CountryService.cpp
    controllers/CountryController.cpp
)

target_include_directories(dataphone_lib 
    PUBLIC
    # Libpqxx include directories are handled by linking with the pqxx target
    ${crow_SOURCE_DIR}/include     # De FetchContent
    ${asio_SOURCE_DIR}/asio/include    # De FetchContent
)

target_link_libraries(dataphone_lib 
    PUBLIC 
    pqxx                 # Libpqxx via FetchContent
    Crow::Crow           # Target de FetchContent
)

message(STATUS "Manager de SRC: Biblioteca de componentes construida y enlazada.")