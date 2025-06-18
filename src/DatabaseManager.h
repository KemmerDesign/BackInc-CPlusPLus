#ifndef DATABASE_MANAGER_H
#define DATABASE_MANAGER_H

#include <pqxx/pqxx>
#include <memory>    // Para std::unique_ptr
#include <mutex>     // Para std::once_flag y std::call_once
#include <string>
#include <stdexcept>

// 1. La declaración de nuestra clase "Conserje"
class DatabaseManager {
public:
    // 2. La puerta PÚBLICA para llamar al conserje.
    static DatabaseManager& getInstance();

    // 3. La función para pedirle un "vaso de agua" (la conexión a la BD).
    pqxx::connection& getConnection();
    
    DatabaseManager(const DatabaseManager&) = delete;
    DatabaseManager& operator=(const DatabaseManager&) = delete;

private:
    // 5. El constructor es PRIVADO. Nadie puede crear un conserje por su cuenta.
    //    Solo el propio conserje puede "existir" por primera vez.
    DatabaseManager(); 

    //unique_ptr es un puntero que apunta a un objeto en el heap y hace que este puntero sea unico y no permite ser copiado o alterado, al acabarse su transaccion
    // o uso el mismo destruye el puntero y en este caso cierra la conexion.
    std::unique_ptr<pqxx::connection> connection_;

    // 7. Estas son las herramientas para asegurar que el conserje se cree UNA SOLA VEZ,
    //    incluso si 100 empleados lo llaman al mismo tiempo (seguridad en hilos).
    static std::unique_ptr<DatabaseManager> instance_;
    static std::once_flag once_flag_;
};

#endif // DATABASE_MANAGER_H