#ifndef COUNTRY_CONTROLLER_H
#define COUNTRY_CONTROLLER_H

#include "crow.h"
#include "../services/CountryService.h"

class CountryController {
public:
    // El constructor recibe una referencia al servicio de países.
    CountryController(CountryService& service);

    // Esta función registrará todas las rutas de la API relacionadas con países.
    void addRoutes(crow::SimpleApp& app);

private:
    CountryService& countryService_; // Referencia al experto en países.
};

#endif // COUNTRY_CONTROLLER_H