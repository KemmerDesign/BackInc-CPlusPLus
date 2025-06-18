#include "crow.h"
#include "services/CountryService.h"
#include "controllers/CountryController.h"

int main() {
    // 1. Crea la aplicación Crow.
    crow::SimpleApp app;

    // 2. Crea una instancia de nuestro servicio.
    CountryService countryService;

    // 3. Crea el controlador, pasándole el servicio.
    CountryController countryController(countryService);

    // 4. Registra las rutas de la API.
    countryController.addRoutes(app);

    std::cout << "Servidor iniciado en http://localhost:18080" << std::endl;

    // 5. Inicia el servidor en el puerto 18080 y habilita múltiples hilos.
    app.port(18080).multithreaded().run();

    return 0;
}