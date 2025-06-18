#include "DatabaseManager.h"
#include <cstdlib> // Para std::getenv

// 1. Inicializamos las herramientas "estáticas" del conserje.
//    Están listas antes de que nadie las use.
std::unique_ptr<DatabaseManager> DatabaseManager::instance_ = nullptr;
std::once_flag DatabaseManager::once_flag_;

// 2. El constructor PRIVADO: Aquí es donde se hace la magia de la conexión.
DatabaseManager::DatabaseManager() {
    // Leemos las credenciales de las "notas adhesivas" del sistema (variables de entorno)
    const char* dbname = std::getenv("DB_NAME");
    const char* user = std::getenv("DB_USER");
    const char* password = std::getenv("DB_PASSWORD");
    const char* host = std::getenv("DB_HOST");
    const char* port = std::getenv("DB_PORT");

    // Construimos la cadena de conexión
    std::string conn_string = "dbname=" + std::string(dbname) +
                            " user=" + std::string(user) +
                            " password=" + std::string(password) +
                            " host=" + std::string(host) +
                            " port=" + std::string(port);

    // Creamos la conexión y la guardamos en nuestro puntero inteligente.
    // Si algo falla aquí, lanzará una excepción.
    connection_ = std::make_unique<pqxx::connection>(conn_string);
}

// 3. La implementación de la puerta PÚBLICA.
DatabaseManager& DatabaseManager::getInstance() {
    // 4. ¡LA PARTE MÁS IMPORTANTE!
    // Esto asegura que el código de adentro se ejecute UNA SOLA VEZ.
    // Es como una ceremonia de "corte de cinta" para inaugurar al conserje.
    std::call_once(once_flag_, []() {
        // Esta es la "expresión lambda" o "función anónima".
        // Piensa en ella como unas instrucciones en una servilleta que se usan
        // una vez y se tiran. Las instrucciones son: "Crea el único conserje".
        instance_.reset(new DatabaseManager());
    });

    // 5. Una vez que el conserje existe, simplemente lo devolvemos.
    return *instance_;
}

// 6. La función para obtener la conexión.
pqxx::connection& DatabaseManager::getConnection() {
    if (!connection_ || !connection_->is_open()) {
        throw std::runtime_error("La conexión con la base de datos no está disponible.");
    }
    return *connection_;
}