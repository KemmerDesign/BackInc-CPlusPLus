# src/CMakeLists.txt (Versión Final para el Modelo Híbrido)

add_library(dataphone_lib
    DatabaseManager.cpp
    services/CountryService.cpp
    controllers/CountryController.cpp
)

target_include_directories(dataphone_lib 
    PUBLIC
    ${LibPQXX_INCLUDE_DIRS}         # De pkg-config
    ${crow_SOURCE_DIR}/include     # De FetchContent
    ${asio_SOURCE_DIR}/asio/include    # De FetchContent
)

target_link_libraries(dataphone_lib 
    PUBLIC 
    ${LibPQXX_LIBRARIES} # De pkg-config
    Crow::Crow           # Target de FetchContent
)

message(STATUS "Manager de SRC: Biblioteca de componentes construida y enlazada.")